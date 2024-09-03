Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3816C969995
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 11:56:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7812E10E45F;
	Tue,  3 Sep 2024 09:56:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sxlLfJbL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2071.outbound.protection.outlook.com [40.107.220.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A18E510E458
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 09:56:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OoG6V7lac8nX+qDR3N2aMKIqH3nC5Vqb+L3aZ4gjNzgVVPWI2e9CdjAzjecy/0rYWfR0fD0SyJrUaWj7S8G12Cz6u+L3WJOZ5U7cFSfTtrbo8TsQenqUM1Kjo/u5ViHmwJDjZFGpcWUN1esP8HAAUeDMrEMkOwE0Onlm4e9TpCOfv9dx9KWV/RVXFUVD9dQfzsJDElFdVFJCYj34CZ2eTOIm8DrCDV4zKoaZwV7pv8wOB0+VJiYZuNHcrPVfgeI1ahtNyoTMLywxvh4MidPIjJ+qPxwEEGzYmqghTvpw0g2TSVDgu9EClj8LmuRQTlq35XpgFJ89g8mSew6nJOQNhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tc5jtxpEpkMC60FRxGqIpDuWHi9Rl+g2GHjiZEoNrzQ=;
 b=lNRLxOby0Jc7s3uziZTy6n2/IKYjQqS0eDnY26U8gTnb3jX3VVPOYUspj7sW2kiqNNAZ01BZ5m+xRFSMAxZNUvn77jNQ2Vp1UiSorDuLxlcXJMJNefS09il5LPEF/Z5cBgEKXTmOtf6WglGtU0xRfiNoaQK6c/gQPLToa41OaaDdJJRk0oy9TP19coTSkuvdmcLAZ8Aq12wm0DTpTIotb7l9XoWBFaM8sgbEtGqNbVDFGfwxCntrSdPLjIu32SvXBwScy8K0td0xfG8Gt5FncYs18vLZ+lORNzAhLvFw9jR67Os2QDTYQHNI5wqg5po+CanSEzHBp4Qh8w+9tZnnoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tc5jtxpEpkMC60FRxGqIpDuWHi9Rl+g2GHjiZEoNrzQ=;
 b=sxlLfJbLs9eajk4oq70+PIHfhuNrWEIPRtRkVS12ILJKo97kjb96qaHxu6sZDO0BApIUpjGxRIL+306T5Ohek0IWz9rARSu9nwgTbiL55mvox270zNJ9hEzM5/ydogLZkbt2Vys0Gg/MDsh4ATbQvBzFHJZwNeb9KKZM1Wg3UHI=
Received: from DM4PR12MB5086.namprd12.prod.outlook.com (2603:10b6:5:389::9) by
 DS0PR12MB9038.namprd12.prod.outlook.com (2603:10b6:8:f2::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.25; Tue, 3 Sep 2024 09:56:34 +0000
Received: from DM4PR12MB5086.namprd12.prod.outlook.com
 ([fe80::70cd:b5c2:596c:5744]) by DM4PR12MB5086.namprd12.prod.outlook.com
 ([fe80::70cd:b5c2:596c:5744%7]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 09:56:34 +0000
From: "V, Narasimhan" <Narasimhan.V@amd.com>
To: Helge Deller <deller@gmx.de>
CC: Linux Next Mailing List <linux-next@vger.kernel.org>, Daniel Vetter
 <daniel@ffwll.ch>, "linux-fbdev@vger.kernel.org"
 <linux-fbdev@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>,
 "linux@weissschuh.net" <linux@weissschuh.net>, Borislav Petkov
 <bp@alien8.de>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: WARNING: CPU: 0 PID: 8 at drivers/video/fbdev/core/fbmem.c:467
 unregister_framebuffer+0x45/0x160
Thread-Topic: WARNING: CPU: 0 PID: 8 at drivers/video/fbdev/core/fbmem.c:467
 unregister_framebuffer+0x45/0x160
Thread-Index: AQHa/S0UVvhkZ/Wo30mAWgWYLmKdfbJE1b2dgAAalICAAOPRUQ==
Date: Tue, 3 Sep 2024 09:56:34 +0000
Message-ID: <DM4PR12MB50864B3F2396760358F2955589932@DM4PR12MB5086.namprd12.prod.outlook.com>
References: <DM4PR12MB5086C89FD0EAF070D167733389912@DM4PR12MB5086.namprd12.prod.outlook.com>
 <20240902084546.GAZtV7Ot58w7D90fwQ@fat_crate.local>
 <7cf68133-e6f5-4fef-92ae-7a8c30631fb5@suse.de>
 <DM4PR12MB50863789A621575F937E240F89922@DM4PR12MB5086.namprd12.prod.outlook.com>
 <d5ed77c9-89ad-4de6-b46b-5865378e029a@gmx.de>
In-Reply-To: <d5ed77c9-89ad-4de6-b46b-5865378e029a@gmx.de>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-09-03T09:56:34.210Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5086:EE_|DS0PR12MB9038:EE_
x-ms-office365-filtering-correlation-id: cb36f6f0-c421-4e99-5bd5-08dccbfeb1da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?IS4n4xm/FK01XbbUGizEpgdKTPOeV1nQyTe7CKHBdngabr9szGVekE4ywt?=
 =?iso-8859-1?Q?7PavmA89rrNyTiBHYHXEi0jmsltRhohJINjjH/5vH+E+BvHGf7kc8urDd0?=
 =?iso-8859-1?Q?QNyJo/Jz8x154SOc4aLqpOoxn9+g5jgjJA/PgPVYz5yUeFaUR3Z2oaYRAn?=
 =?iso-8859-1?Q?rYaAWIRgl0X/SSgd5GBPiH8WJPIg1m8QUPh4AvS/SuiBudSi+37kmgxOGq?=
 =?iso-8859-1?Q?zyi/8hTGUdfrwE/OXRpMstJz85BJ+HopDpovWmIFrNrU+7QbnCc0N7TKDu?=
 =?iso-8859-1?Q?J1CMUJEYjcqf0VX9HVObk2Y9lNu2Yglw6IaedWDy+x51bhVb36t8KpZCtW?=
 =?iso-8859-1?Q?/JJhxTEw8EhLJLOm12MF/q8IvEIZ5HvqZLn0YxFuNQSvGwAkdjXA8E4zRI?=
 =?iso-8859-1?Q?9Uoc7NZL33PUIICtzmJg+6ttZWmIcQA6A6SBWY+iKwMOugZHe1EkqCi5CA?=
 =?iso-8859-1?Q?a7wRXf+I0RWtHhDeJyMf4nK5mTNXI2ORqXATJlUsNq2ozoWhzZY6Lo4+8c?=
 =?iso-8859-1?Q?MoiyK0SNxh1sBIOUQr7fnsY6kikZotJxmsY/Kq0Jsl/4DlDsA3KTpM/YdZ?=
 =?iso-8859-1?Q?an3PPUdqZFHSrVYq9rdzY1ebhfLYn1Hwn4GFZpNiWQT1Q9xVlbiaEg1XXe?=
 =?iso-8859-1?Q?55kMCoU6thud+AH/N38KYXJv7CVpIJy1XuNfYNdz7qrtRBrptUHTnrn8ud?=
 =?iso-8859-1?Q?Gon9UCr8oK0Wkn82kzOtcON0TV+7w6emu2ZYBKA2w8CufrHOzK8gSNwBLR?=
 =?iso-8859-1?Q?lX4J0ys1YoJR8LC5+4NxQ9/XcVAQD/4260xAcJfyoT1MdOZI6mpsi7F43z?=
 =?iso-8859-1?Q?KMdvodiGZ84RWaBB7wyPi4MrSB9aFc8SaYdGwB4LPuy4T8bMJvVxU4EgNg?=
 =?iso-8859-1?Q?AF6WkMkuIcwvmiG1rP25sbhG5JCyfB6KVwABCT+dRoFcwyzasFQUZgbmhq?=
 =?iso-8859-1?Q?UailVmqiqgYSj6SqqXTMzg1jNtmCtz84LFj79Dpkuss+VBLUkZT0IveoAU?=
 =?iso-8859-1?Q?EPYt5ku64fGX5O5t2uAIaSF1UReFQwuE49TQ7EIBXJ7n6mFlxdcWaqeXCs?=
 =?iso-8859-1?Q?BmvLiIPwR5S15nqd1qNl83fmDfTQEjzE5TC04qwRu788CrfWM1rDfJjEkP?=
 =?iso-8859-1?Q?vJlUYlYQZ8sEQgO3OCS7YbqidwPtBu0iJUdXhePGtaOoq3srTMCkX5pYzk?=
 =?iso-8859-1?Q?vYNQcqRkPoq3eaQpWdYPuWN6nPVVKFfH7mFUJxLYQmloMiolcN/3M6i4eb?=
 =?iso-8859-1?Q?DTRfm4VI6mL9aIf38ZFLSOhbQ9HOIh+PNaEpqu3P57IEFzTlASIpGIzhx+?=
 =?iso-8859-1?Q?Az10/+fvie9jMu2nzxC9AoAANCFMrUNfNm/+Rebcm8+CD5cZSIDQ9nefi/?=
 =?iso-8859-1?Q?9Jqbdkfo1wRVqgBd0+zn+bwNIBkPAYmgjaO/mIkO3dfD3N1UuWQ6Y=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5086.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?IoJwk01CpQqMfNzT6nWxtr27d1W+wE8AarTkhfw9gdW6IBnGvJcwyD2s0x?=
 =?iso-8859-1?Q?QLljOib5nrqLNrByBaz+QWQhW3JnCexsNq6Xv6WyA6eCeeNzSNczE6xi4K?=
 =?iso-8859-1?Q?DS/WBAJatTc/mc4n4tI4+lwPu+cBlJBXeokhJggNGGMy94iTlbCOQSY6mz?=
 =?iso-8859-1?Q?9wnjqmn+TW10SNUP0Q8sLA4vt5/g14rZ8pNN/oiGHgBDdhsK0IBSPH8LyH?=
 =?iso-8859-1?Q?AkeDfQuld4W/v3+bjoufZ6+j5KUnXYitwjbfATbNyWXTeF7zJTWSaOmkGk?=
 =?iso-8859-1?Q?fDWZbQstg8QVDVbpyLpmyxT64Iu9z/jCZjlBbY1QIVOXIh4iByJi/rO43S?=
 =?iso-8859-1?Q?lLE4C6n7sOA9nffdbl+O/H4gFu5PrPv5YDof727yJXMT6A28ATyoAcTKOp?=
 =?iso-8859-1?Q?7Ryc9UVB06zY954K6L0pQeDwaJnElootPuR7zmpGi8m/nA0dsHxNYSpSuY?=
 =?iso-8859-1?Q?mqqwM0L9YxxbwO+0GGnuKqZvRTiB1+n5iQFov+YyHZ0gu022TmbHNF1DRt?=
 =?iso-8859-1?Q?Bu1xOV1anCELbO8+6aQSnFDdJbfGUsZFr7DRvFdFdjN77quNdwSJVgJ6Gx?=
 =?iso-8859-1?Q?c4AmUjY2IeWAaTDf8VoWQHDEkHqKzxx2fYtRD78Gor4O7MvXjtHv5EbeYP?=
 =?iso-8859-1?Q?6CVV3dh6zq3WUFmczUXn6+OSqEEidxy1HASrBHbbFSzz/L0HHr9LgqoVRw?=
 =?iso-8859-1?Q?kb/STTKPYcfrafg0YNqrGOMyA2DKmho8yzaXMUbZIMF1owj9t7gSpzno9F?=
 =?iso-8859-1?Q?VFmyQgCWAqy2RTZjJuSbju56xa6WufZUjhIJecoDAqEF/DwlePh9wSVxYx?=
 =?iso-8859-1?Q?800w90pGGi/pyNE4p7Oi8SeQTveT3CgDmFjImKxHc1BtAd0B9mC/fKh4h9?=
 =?iso-8859-1?Q?pabaw91wIs9NKWR4ciXLpdgNOG+9PNtknCc1NpA8rpaIbuCJY6cGnktpH+?=
 =?iso-8859-1?Q?M0/lRrumzalKcuoGErVJFt3hzEMsMYGfoWonu/pjesfvR+GvYZUp9iAfhG?=
 =?iso-8859-1?Q?me7Zw3hVCYKgBl3ra1LqQytw+CCVsY7qpLe12VYxFvc8JpUYIUPkHAKqIZ?=
 =?iso-8859-1?Q?xqx9Tyln4yb3QaPdfm0VjbTqZmRqN8i4NxIHAFKMJUEjSlP0mlTVsbZfTA?=
 =?iso-8859-1?Q?GAFb/JIzCZ3tQ61//gx98VKJqSv85iJQTpsuldTjMaLGkHTtfXsnILfG3p?=
 =?iso-8859-1?Q?tu8UUcRSGLuItrH2XGlJD0pDdt9UR+04I+JY5d504HzubIgapNXdtvbzpz?=
 =?iso-8859-1?Q?IEyKxGgczKdO012lkTdDCfknzS8d6eEqIUaYfIePIeOXtmcVFH5sYmSQ4P?=
 =?iso-8859-1?Q?gOqKYjdYWm4kaZXfne269oLNmXGYoyOcEe9MQ4hXuwVPlyNuU5AGOvsNLJ?=
 =?iso-8859-1?Q?8rVJco+28anCv84lfC4Zf8K/csY+0+4nKSA9ERR0evzHZQP5nOTXqWuqPD?=
 =?iso-8859-1?Q?ynbHOM9vOLNjqshH4b1E+/FOfyOsUyAnxI0Eenoz9o2Tib+gIuvRBcqO6e?=
 =?iso-8859-1?Q?ittP5wniMG5R31Z+9WcQHCGtbPSvHLhk9Az5WQ+4hiAcl1QLHN1QwNqDW8?=
 =?iso-8859-1?Q?0/I2rtemMDNHCAK/iA45BwvIWrdPKDu0bXcEwAqHJNs5lsK/mW4DsrDrA2?=
 =?iso-8859-1?Q?e5Khtj55NSbKo=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5086.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb36f6f0-c421-4e99-5bd5-08dccbfeb1da
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2024 09:56:34.5327 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sMCw2vNKfC9kn5s7Vs4yjfBEE8uXpqgzpHC6o6UFXT4SDDOBPwJYLBSFdKLI9IA+2ZgaKR8SMiQVVscjZe004w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9038
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

[AMD Official Use Only - AMD Internal Distribution Only]

Hi,


________________________________________
From: Helge Deller <deller@gmx.de>
Sent: Tuesday, September 3, 2024 01:48 AM
To: V, Narasimhan; Thomas Zimmermann
Cc: Linux Next Mailing List; Daniel Vetter; linux-fbdev@vger.kernel.org; dr=
i-devel@lists.freedesktop.org; open list; linux@weissschuh.net; Borislav Pe=
tkov
Subject: Re: WARNING: CPU: 0 PID: 8 at drivers/video/fbdev/core/fbmem.c:467=
 unregister_framebuffer+0x45/0x160

>On 9/2/24 20:56, V, Narasimhan wrote:
>> From: Thomas Zimmermann <tzimmermann@suse.de>
>>>>> Seeing the following warning and bug on boot with linux-next-20240829
>>>>>
>>>>> WARNING: CPU: 0 PID: 8 at drivers/video/fbdev/core/fbmem.c:467 unregi=
ster_framebuffer+0x45/0x160
>>>>> BUG: kernel NULL pointer dereference, address: 0000000000000000
>>
>>> Does it work if you revert one of these commits?
>>
>>>    c2fe0480cd77 ("fbdev/efifb: Use devm_register_framebuffer()")
>>
>>
>> Reverting this commit fixes the issue.

> Good.

>>> For the latter, there might be a fix at
>>
>>> https://patchwork.freedesktop.org/patch/611902/?series=3D138008&rev=3D1

> Current fbdev git tree and for-next series have this newer patch already.
> I expect that the issue is already resolved with there, but it would
> be good if you could test.

> Helge

The patch seems to be already into linux-next tree and the issue is no more=
 seen with today's linux-next build.

--
Regards
Narasimhan V
