Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C9486C392
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 09:35:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADFE710E211;
	Thu, 29 Feb 2024 08:35:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="Rq7KXKmD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2122.outbound.protection.outlook.com [40.107.22.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29EBD10E1F4
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 08:35:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JvKDmjGUw1yvjg5mr4VZK9c200CwVLDy8+Xarro8rQWDR13GHKmEqzbnB3SQmrq1Y2kE6G2gjJ8ZuYuIMCyVA0Qd0199VwafC7Q2yzqzig/7auROwpZA8rdUnMDtbRUFtm0PZyxFFCfG/fdOZCO2XAoR6d0+r3sFPDLkj+qAkouPdUYFjlyCtHxmkemyOfHHQpvHZ/PxwdGUYbiiMOLFy8O+JnTePnHqU6mha9aIZXeUzru2/75/BIfA7vcwswXFd3/4pVVUPUU/Vkmnl3b5FwoopMGBYiOKlwAhOyyvDjtrJ86xjYBkp6JryuYIpyW0glV7DwXSpYTeFQ1IEIvOAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oZ/pSS/SvY4eruNxrTINDd0ELQdqtnODz0ZyyM7YC4k=;
 b=OCHoXjB/VpKoZbVDwLPAUyveyIsEp6amYFu2s3MAz9fV9Cui/kohoYacN8O5HLq8hXmoDL1KS3/BVE4vtJSTSZlTqqx2aq5PGkCU2t3I7NRC4hYbUjx3sWhgZC5bZ65R54Sqcd4AnQlGvaMWX07RXeYKM4KHHymo1/aT9KZ3i3yugepcKYGZj2Mc+7gVquJZ7OILnC0gGEjCyAx/+SSzNtXf2iZHISsY/L5QO1E0Vj/2RQbemDau2U6Fq2wvcFA8joZDvGMgsArDIvG3z8cmQUAFzqT3PKCFm3oUqtyI2bXKy736vY89nF6r8zh9OkIh7FDuktL+vLiX16t2j1cW5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oZ/pSS/SvY4eruNxrTINDd0ELQdqtnODz0ZyyM7YC4k=;
 b=Rq7KXKmDWmLPLGQ3ggUkdw/eqH2TjvZmh3cv6WQ4kVoxRVpGKr/yw/peHqobpifWoO/dyfzPyOQrL+pm4/btVy0HL/ybP77fxpJ+8d4ClCTN4QSVqJKh0UKvyvbJzLT6ZCFC4vCn+A5oXEbFygDIfOqQCp9OMBBWTTHxFsIIgG8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by DU0PR08MB9727.eurprd08.prod.outlook.com (2603:10a6:10:445::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Thu, 29 Feb
 2024 08:34:53 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f%6]) with mapi id 15.20.7316.035; Thu, 29 Feb 2024
 08:34:53 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Date: Thu, 29 Feb 2024 09:34:44 +0100
Subject: [PATCH v6 1/9] usb: misc: onboard_hub: use pointer consistently in
 the probe function
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240229-onboard_xvf3500-v6-1-a0aff2947040@wolfvision.net>
References: <20240229-onboard_xvf3500-v6-0-a0aff2947040@wolfvision.net>
In-Reply-To: <20240229-onboard_xvf3500-v6-0-a0aff2947040@wolfvision.net>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Helen Koike <helen.koike@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 Javier Carrasco <javier.carrasco@wolfvision.net>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709195691; l=853;
 i=javier.carrasco@wolfvision.net; s=20230509; h=from:subject:message-id;
 bh=SFVrdbQBKp6w6iOi3+cJln+dSXaq8fghc4J0yWNMHNw=;
 b=xGSVI4zRSKyb+ceH8aCwoSZAZaOEt7JmR6WYz4swE1/h1zNBi2AhuPBawrl/kg95eNJAkGERS
 0yK3obd4WnDAjEU680G3EdZqu7XkB6NVxVZiu1Qt1ckn1gfylO04hZH
X-Developer-Key: i=javier.carrasco@wolfvision.net; a=ed25519;
 pk=tIGJV7M+tCizagNijF0eGMBGcOsPD+0cWGfKjl4h6K8=
X-ClientProxiedBy: FR3P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::21) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|DU0PR08MB9727:EE_
X-MS-Office365-Filtering-Correlation-Id: 069d09f9-4aef-440e-8ab4-08dc39014d73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OA5kImIKOl7+LZWEPE2IMBItBOiV1bY7jLa5uRB9P8JfOT8PItETRNh9JQ7a/aAAzcCVPe95XIVQH6RzDmQ4iARZn2gc10bkNTfGnmZXvKhcZi7HGh3GgbSZ0V7ci0F4M1D0gas3CABJnvoG7d1ZQQ5eX4XSLHxIHeGUqgxCaRyThVc2Vy1QF1jJPPElWi3NvpJN9FEbQanHx0hgW3NS+BO7ZA9rh1TluA0PSKficXnZU0aOy4vI2c2bi3/FhnCEZ2wFC32B7j1mEY68zhPVkeyTo7G5bYH0efpfQRXxTjB2IUXXeu/8hyTEkUPKT86GyVw22Czeot+ClTBP0KLUvf9eAgHKkvHNhyCPf9KJZCXvd89044pVisjTwfegwNbmOoUWMSP8h4D264It5dTiV8pbSoVnamUut4B3k/C3UU2aUdVs1yrUJsm+GPc8XFlwMXKtLzCNb832/PBvHlTxQmxL3nB3fX3MHWeXZ2VpX4uMwWANIdzTDBQNXJ4sXlC7L6YX38rjFUhIHXruDvVYbcTEQszn39+QuKMEgc672H5ip3wHBeAjoMgicvKn3SxrPTt+bYqp56Qgta3CvKT3K993DtnrkXfao9ze3nDENw52gj2+yl9mi95ulecMlBbFSuYFQzas9yhB2Jjoa57aST4jx2be9GCtn/ab0wfVcPiW4n4EIIgtcMHEng26iwK0Z0J6U02CzcxmhN4S6ofV7hB7ritjxURl9J+NaTYQInU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(921011)(38350700005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWJDWGpYTzRUcUNtWnh6SUJpTWRhUnI3aVVCUkp2Y1krcS9rbnBPeitqWWJT?=
 =?utf-8?B?MS9VU0pDTkNZN0djVGo3T05Gem01VVBpdGk1OFlNVEtBOFZSRXp3MkZnTUo1?=
 =?utf-8?B?TGdjeVVYQ2ZaSlpJd1h5TytlNjNteXhwQWZUZUpmTnB0eEJ1MFJ4WGk3TGNz?=
 =?utf-8?B?cjRhY3ZDbUxGY2NpakF2cjAvcnVEVmg5RUticW1VODJIcFNkamZsZXlaeGli?=
 =?utf-8?B?bHFEZ3JQZzYvblJzc2YxQWowQ2EvVnRxUFRBODBxZG1wazhBY3RXREFqNzJi?=
 =?utf-8?B?dHJvaXdFUlZ4aHNWcU9vU1J5MVVFVzZqR0l2VmdnODZWOHJ5VjZJUXQrS1RX?=
 =?utf-8?B?VXhxbnpjazZKNDMzN1ZidXZvMnVRcFNTamljVkFIUHVhZEgzWjZGRjMvRnBL?=
 =?utf-8?B?UkVsT3NDd1gxeXNOck9JRzJwbWhKVE1BK01CcklJNG9PRlJLdHBsK0lNK2VC?=
 =?utf-8?B?UGRxT2VFNDBDU3gvQ1hJSE55MXlOWUdnbmZqSWs0L1ZaNFNmWUhxbDJZRnZE?=
 =?utf-8?B?bGE2SU1tVjQ4ODNZMnlGa2taT2E3UW9paFNrS0ZxR0E4N2lzQUY2eDNLNXpp?=
 =?utf-8?B?Qm94M1FXYklSdm1lTmRZNURYZnhjQW1NNjNCZGlvT0V4UjE5L1ZUa3lZUDZC?=
 =?utf-8?B?RmZEZlVienFsWXNBQVZSTVdlNDg3NkFiZmZiUDI1Z1dWaTFFVmVYUzYxWi9I?=
 =?utf-8?B?U3FlbjRadDF3aXYya25telBWU2Q5RHVzL3pncjJjRThmVk41MFNtWmUycS9i?=
 =?utf-8?B?WnZGQ2ZNQmpSWW9BMUh2SSt3VlU0dXhrTUVqY0xGYUFBNjZmN0dna0wzOURI?=
 =?utf-8?B?VndKbUZXOU5lSkxaeEVzeHM1VGdSL0x4eks4eC9kNXFPS2hMMURlY2VyZUtI?=
 =?utf-8?B?Tk5ueGdTTkdFdW5vWG5BaVY0bFNud0J6aUhXSFZqMDdPSjhOVlJ3Q3BpclE5?=
 =?utf-8?B?dHB3OXJMdWVoRHgyWng3akYzekoydmxZQS9NNERHaEQ4eFMvYXlUR3NBb2Jv?=
 =?utf-8?B?N0NXNW9ZaDQ1VTN1T3ErVWoxc2VqSm5RU1NmT0dpbCs5a0xJOHR3aVB5elp4?=
 =?utf-8?B?dWl1U0d5ZHY5SUxiVHJMUmRxM2habERHNHpOc1I3S0ZKL21kdDZuUEtuMmJF?=
 =?utf-8?B?ajJJNG1xOS9NOVhDZWFMV1EzZTBnWlBjbEVBRjcvQ0djZEZGekpPNGxjZ3Fh?=
 =?utf-8?B?OXBHZFpEb2xSNlNudk14L2NkVFdobENaOERVY05QWVlOTFAvb291cGNCWmVv?=
 =?utf-8?B?Qmo2UG5sUlRjVWhtR3RCTitLbjZRREV3VU5EVXk0dzFjYmZESThYMDUyaTl4?=
 =?utf-8?B?dFdjZnR3U2N2Y0paWlIwK056TVY3SVBBbUJaRHhwTGJMYzVlcS93NUdVd2Iz?=
 =?utf-8?B?R25QaFVNekR3NlhNWmV5bzhSM215WDQzTGEwN3FZaE9oT2w5eElXRFF2Z1l5?=
 =?utf-8?B?aFB5S3QraXBkeW95Q011cVJNaTdiYUpsMXY3MXcwbVdzWkh6RWp6SW5IbGtz?=
 =?utf-8?B?Vm15L01TQVIrMUIzamtXRmJjSFYyaE5jS0FPQk1ORHA0WFNxb1lDY1hVNlk5?=
 =?utf-8?B?VUJCUnJKZ0g4Y3JWY1FTV2JJSmszamxFaWN3cjFWSzhIOHE4b20yZEJlajBm?=
 =?utf-8?B?bFdlWmxHYjdTdGpDd0hEc2pGSFMyRG5LNDBlbkc2TEZzNnhJaXd2bEh6T2I5?=
 =?utf-8?B?NGxpM3RsRFNvUnd0cDJROG9oOGxpZEgwMHVHOHIweU0zd0ZqYnFlWFBCcmVm?=
 =?utf-8?B?TFJFbno3YUFIa040YWI2bUJ3SUxxOU8xQSthbU8xb2xGSFNoYzhKVzZScVRa?=
 =?utf-8?B?ZldUdC9iZktIS2ZrVVFGWlZBeERDVU44TUF2dVFFLzNyYTNocEZUbDY2aSti?=
 =?utf-8?B?YUsxWTk4ODRad3NlZEhOeW92eUJKc0c4YzZwVjhib2tCUDhwdVdqRGcrb0xS?=
 =?utf-8?B?NDJnUVZoOXBSRTFxT2ZTYXhhOGsrVVVnL2lyeWl2RHdxdEJCQ2RXN1NMN1Jw?=
 =?utf-8?B?TEFGOEMrZ0szU0VuVFZiaGZuUlVpSUhXZkdRRkVKd2lkSE9xRkhzTGxRVkhj?=
 =?utf-8?B?N0w3QXpNS240UzNNVTRZV0hTN3g1WGNqajErOXdTUElvZnlTUmFZRHg3TlVF?=
 =?utf-8?B?Y2VPK0g4S3lsRWgwRkYvbHVta3dFUmJFcHFQdk81OGV6YVIxSSt1a3VnVHRp?=
 =?utf-8?Q?VZAzmLvJ5qDrxEpOl4lXQvo=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 069d09f9-4aef-440e-8ab4-08dc39014d73
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 08:34:53.8064 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bpBikqnE4IqF5pJSSCe8q0Mvj7KpBw8Cg0dMAkL8WP6dy8RIrdcAwvu64vLC2ICp5HftCaoqlOFufxbD+4HFzoncCr20s27u7ImarDNFNj8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9727
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 14485de431b0 ("usb: Use device_get_match_data()") overlooked the
already existing pointer to pdev->dev 'dev'.

Use the existing pointer 'dev' in device_get_match_data() to keep code
consistency.

Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
---
 drivers/usb/misc/onboard_usb_hub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
index 0dd2b032c90b..81c001fd38c1 100644
--- a/drivers/usb/misc/onboard_usb_hub.c
+++ b/drivers/usb/misc/onboard_usb_hub.c
@@ -260,7 +260,7 @@ static int onboard_hub_probe(struct platform_device *pdev)
 	if (!hub)
 		return -ENOMEM;
 
-	hub->pdata = device_get_match_data(&pdev->dev);
+	hub->pdata = device_get_match_data(dev);
 	if (!hub->pdata)
 		return -EINVAL;
 

-- 
2.40.1

