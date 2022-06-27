Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A818055BBD8
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 21:49:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 529B611309F;
	Mon, 27 Jun 2022 19:49:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2087.outbound.protection.outlook.com [40.107.20.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BC8510FB88
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 13:40:24 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=U3gC93OZZ1RIzFzvVvpwR+A+DQiWAlCTlhQ7nEX2qoQpEjTJRuU+kA10ujFYtcLLtim5YJwn0a3MG3+0urrn4B+sgOr8ywf9kH4B0fhRFjE27q/1yNM5FWFI94nVGnDD2em/ozwTa24PT/qNBRcEFLHO/4BvgLsi6fMW1pGuWsC2asvT44x9qCEhYfGPPsX8c/zrTtwSV8aDhN/Et5j+Gcc665UzuqYc8Z2lnlUnzlJP/yNL8GhQkClapVvj/fLYLdBlmdrWQsmxkx6JatRTRSbbtpRFYzZ+JC8clVTro6nnGMq0hrQXXdyOyBbGFIQaUHKo7zm0iJSL6EHLiK469w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7fgD72nPynBaZgSkwk+NmjJm16cT13glVDdoluryPNU=;
 b=g0uSdfPB0VU0Uyv4v6qowUoqqqI1/3gjSwzDrOg6ls2OixJAUGD0iJRNE2T7Fd/YYWuiJ3gpavMXm0SVtIuyiyVCeA5J0jKfBj/IECjQHQmw/QbN4ZvYDxrNAXBQkHV6dWHwpZM/dnuZylgo4PorrcIlkqmMJkwisyN3D2cvPRzmbixFQfBC934HARbQATUdYeboIJx1QKQPGYs2uv0Ovysr5NJPYfTg95cfS4hbEGNpLnll6wNaLRHdHrT5iYiW502atQT+7tifZ9MY9MQSjQuVdeR9QbUXNIPWZJV6a5u3ln2gmVuOAyvvMZ6uM3+NdLtNsmbOLWhO1cWWvC5Ppw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7fgD72nPynBaZgSkwk+NmjJm16cT13glVDdoluryPNU=;
 b=JYLHTBLn4C/FPv0ulgAXLobMkGCvAMs2dSL1L26xmHM4J8sIOA+gIU9eUSDzLW/k9HqgjLTJp15Qc2jUXOx+Mm0Mfwoy8n3bPrdSwnZQug3Pjt1N5UGo69GBBnhBJDXmF60Y5j1PdZnJK3nMClbAnk28+h7+XQiAedhjzpCGqfY=
Received: from DB9PR05CA0006.eurprd05.prod.outlook.com (2603:10a6:10:1da::11)
 by PR2PR08MB4700.eurprd08.prod.outlook.com (2603:10a6:101:1b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Mon, 27 Jun
 2022 13:40:18 +0000
Received: from DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1da:cafe::c1) by DB9PR05CA0006.outlook.office365.com
 (2603:10a6:10:1da::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.21 via Frontend
 Transport; Mon, 27 Jun 2022 13:40:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT038.mail.protection.outlook.com (100.127.143.23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Mon, 27 Jun 2022 13:40:17 +0000
Received: ("Tessian outbound d3318d0cda7b:v120");
 Mon, 27 Jun 2022 13:40:17 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: efbec8c0c858ce25
X-CR-MTA-TID: 64aa7808
Received: from b5fb964353be.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 78B3BBED-E5DD-4EFB-886D-1C49644C2B34.1; 
 Mon, 27 Jun 2022 13:40:07 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b5fb964353be.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 27 Jun 2022 13:40:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KuUsvcH4ow2S739glGOEkWAacHrsahS0dZHgrpCncbJ+WLr2dw7T8uPwNRiqZbJofS1vOYRyL6mPpkPBsptnpNzMeKpvsoNbZjJNckKpABaS1Lxe5rIOwWL5PbRDVcMq3hsjdbOQo/oNTDgLV8aDchviDrSvuB41H9ELy06U54FoBwgX7pucqHIvhc+Pz0c7VtESMUcVPIc83qhecd22ImuhVaqS8oOjgdVvL0n/xYeR1OBS2Wz3ha7qqWE7fQ9IbtwtejBLQiiFz2nh9trP/cARoZEPkaA/pQVBDiaJ8C1U4rLRLVibGtB6mrBJ+UgJlmBrsHkreSNBo/3gesQlxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7fgD72nPynBaZgSkwk+NmjJm16cT13glVDdoluryPNU=;
 b=NRJ3aZnnlwZCVB5ef/JKemU/uN9twY04fB03svLIWetdypzZ1XhNxy1OHa8k/g3MYg/QKTYQ6IQthgGmuTJYsAfMM9vyJZGn2r8ThWl+BhfGSkIovvbyt3dhA0yiVH6hRHwg4OB4Eku152kTjP7Yr6pZXQO6pMnVj8xKZ25nRR6H/eCzwbk0Kv6+ORsgUAVYfSjIOszAAUyb8cAyKs7afUeH0tbQQ/iMCtg5IobU5SNNctq1lxzwk8m+QA/PjRPdaTphfFreg/ZiDcCtqAhaD15LnGH/yXURMrtkEwnbkxW9tHE6TiVQ3X2zkIuqyy6dAkJo8OMpsFaUd9lLk56+gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7fgD72nPynBaZgSkwk+NmjJm16cT13glVDdoluryPNU=;
 b=JYLHTBLn4C/FPv0ulgAXLobMkGCvAMs2dSL1L26xmHM4J8sIOA+gIU9eUSDzLW/k9HqgjLTJp15Qc2jUXOx+Mm0Mfwoy8n3bPrdSwnZQug3Pjt1N5UGo69GBBnhBJDXmF60Y5j1PdZnJK3nMClbAnk28+h7+XQiAedhjzpCGqfY=
Received: from AS8PR08MB8111.eurprd08.prod.outlook.com (2603:10a6:20b:54d::22)
 by VI1PR08MB3471.eurprd08.prod.outlook.com (2603:10a6:803:7d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Mon, 27 Jun
 2022 13:40:04 +0000
Received: from AS8PR08MB8111.eurprd08.prod.outlook.com
 ([fe80::1050:2cea:6ae5:160f]) by AS8PR08MB8111.eurprd08.prod.outlook.com
 ([fe80::1050:2cea:6ae5:160f%7]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 13:40:04 +0000
From: Dennis Tsiang <Dennis.Tsiang@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/1] [RFC] drm/fourcc: Add new unsigned R16_UINT/RG1616_UINT
 formats
Thread-Topic: [PATCH 0/1] [RFC] drm/fourcc: Add new unsigned
 R16_UINT/RG1616_UINT formats
Thread-Index: AQHYihAY2HJVH06gQ0+xJdAfJgLkRA==
Date: Mon, 27 Jun 2022 13:40:04 +0000
Message-ID: <AS8PR08MB81117652E417826E741154B8F8B99@AS8PR08MB8111.eurprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 141b311f-f6fb-01fd-7544-7beaa4875e55
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 86de35cd-601d-4b9b-5a77-08da584292b7
x-ms-traffictypediagnostic: VI1PR08MB3471:EE_|DBAEUR03FT038:EE_|PR2PR08MB4700:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: QL0lFaEznQIm1Hdu29RLSYTFtYcVSgaLU/AmWwvBMSWa/3rPYCGCAbKJWWtw04a6Lfo35tOkxztTH2y6EMbhJAWETJvl821ZcGhxIijClySti+opeZjE3XyXY25RrfaQHnXHOffPo0hBKl6jEmpuj9QjlqMjDw5sfj1h94fjb8a3clKxL2CZsrzRYjX8VCgrNvHw0hFM009jNzG7FrOg/qukebTBYE3cfAifU3bkDPHwN9xn1GSD4Uypm5tPxGI0XuzsOHjZzzQ0jxGrXOuoNX3aOq47UVXcJnu0tWPas8PWsVxNZC3jIMl8IDxIKQ+nlxSTmUY4/5je4s0WGDKSo0X890CJjScaPFaRpa+0yvqw/VkZAUfiBwzOoVIwFyHoaN4duwts7hDMJQO5Qc+swVp3D7WNOgB2EW9bi+K+3Sv7bdSc2dYM/QLcK710x/Ph0RcIUxZNelPVALurGT038QeCozN7mvGb/kql5/VVzZrT4WkMBegtB88ROsk3OiFS9gFksTgSi4KWi0X5qafgD2xWJa1cqJM3GcJWCeKageHZAQrmtVSrOxCkH73oQVm6m4qB3Ht1PFT82zsP8uRy+39ELqsVOdjw2NmIU0wbzWcIJenhAAQ1Eyv8w607MptJ3LtJVu/vZeGqzDNZrglgbaQmcOPXeEb7mYilx2FuT57neQ/zzqCf4rCWDQcZkjyzNYyIFtC+TmyYzI3zDXLmXRZtaD6TKtJwZNL/CLmtEic8JC4heCxNoMuaqskQK3QUkSWThmNgQw+gr7bgoji+UysJbcaAtTzmbpzj65IGwKE=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AS8PR08MB8111.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(396003)(346002)(376002)(136003)(39860400002)(8676002)(4326008)(66476007)(66556008)(91956017)(66446008)(66946007)(186003)(83380400001)(76116006)(5660300002)(7416002)(38100700002)(52536014)(64756008)(316002)(55016003)(8936002)(6506007)(9686003)(7696005)(41300700001)(122000001)(38070700005)(6916009)(54906003)(2906002)(71200400001)(26005)(478600001)(33656002)(86362001);
 DIR:OUT; SFP:1101; 
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3471
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 56fc4a55-8aab-4b07-0eef-08da58428a94
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ml9dZ1TfGGsgcLHxZO6iFsECiToaPw9GMe/NuPgU5bjMZ4OK3lE0xiPV7KKKcQVnHYWQXHnULwUycy80Ne+peAKxU+MuCofVZe9aUV/WPsEUdid1NYocvSIPy2kOFtmPqrmOSSUPw4672SqQOVKruKwqzeyPkrePyko+LWW3cPAryu3gCkWxMCUoCc1qi/OGNdGgg+hE93ke0ujqidtP9P63On00JyyqzOR+hIOdExPIKP0NzYgXFs0v7LINSExEMbfK5Z4OXXMWHiI40suL/J6xGxavmk4O6WWww4DkNU4C0qwq4qkP8NgFekKgIoLj+A0P3qj7tbh3hC03ECSiahg2TFoAFzBmdt95q46NGrz5J39Gxc2WJBR92hJ+eMDaTFCfHAD1/bTlzb7iKHGPS4YlOIUSf3dCtK6XzZmEa9/89x4+TDuTbD6BmQSRz6nQ9mvTEMpAXztt2YXmxrJXkv+WF5i3i5Ec/SvLowWaLS2w3cHSBhRH3JxZXU+U43N+vgZ54mpx8kmPxkE8Xbmtqq76pQ3ydIdw/5jmLVQZbWhzbIvWqXTjGzDl4r6Cf+F2Dac8QouCHa1EP6t9WJH8Ts8g2X99iK2JUKPc5ljOWyy/tdFEiYb4L8mMJFhlPENp+GzIxKFqRt8qDWG8/2X6oMXyvw3ki9+QnHLKYA/+LFds9pDDpg2FcpHNBhia2YVwIJ/D2HWbc+yyTav0wc/Hp50WHoXd8rusG3xWfgin5losDLz6YHgPHcegJDHLop4K8KiFVydTSRpDV549eBM/vyoxIDVGzn5XmM29Qw3n5Qsb3IErcaXBxie9XkkT1D7O
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(136003)(396003)(39860400002)(376002)(40470700004)(46966006)(36840700001)(41300700001)(47076005)(6916009)(70586007)(186003)(26005)(83380400001)(70206006)(6506007)(336012)(54906003)(8676002)(81166007)(7696005)(82740400003)(356005)(9686003)(478600001)(82310400005)(36860700001)(52536014)(33656002)(5660300002)(4326008)(2906002)(86362001)(40460700003)(8936002)(55016003)(316002)(40480700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 13:40:17.8922 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86de35cd-601d-4b9b-5a77-08da584292b7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4700
X-Mailman-Approved-At: Mon, 27 Jun 2022 19:49:07 +0000
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
Cc: Normunds Rieksts <Normunds.Rieksts@arm.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Dennis Tsiang <Dennis.Tsiang@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Lisa Wu <lisa.wu@arm.com>, nd <nd@arm.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch is an early RFC to discuss the viable options and
alternatives for inclusion of unsigned integer formats for the DRM API.

This patch adds a new single component 16-bit and a two component 32-bit
DRM fourcc=92s that represent unsigned integer formats. The use case for
needing UINT formats, in our case, would be to support using raw buffers
for camera ISPs.

For images imported with DRM fourcc + modifier combination, the GPU
driver needs a way to determine the datatype of the format which
currently the DRM API does not provide explicitly with a notable
exception of the floating-point fourccs such as DRM_FORMAT_XRGB16161616F
as an example. As the DRM fourccs do not currently define the
interpretation of the data, should the information be made explicit in
the DRM API similarly to how it is already done in Vulkan?

The reason for introducing datatype to the DRM fourcc's is that the
alternative, for any API (e.g., EGL) that lacks the format datatype
information for fourcc/modifier combination for dma_buf interop would be
to introduce explicit additional metadata/attributes that encode this
information which then would be passed to the GPU driver but the
drawback of this is that it would require extending multiple graphics
APIs to support every single platform.

By having the DRM API expose the datatype information for formats saves
a lot of integration/verification work for all of the different graphics
APIs and platforms as this information could be determined by the DRM
triple alone for dma_buf interop.

It would be good to gather some opinions on what others think about
introducing datatypes to the DRM API.

Any feedback and suggestions are highly appreciated.

Dennis Tsiang (1):
  [RFC] drm/fourcc: Add new unsigned R16_UINT/RG1616_UINT formats

 include/uapi/drm/drm_fourcc.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

--
2.36.1

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
