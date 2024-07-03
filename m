Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 898B5926B4D
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 00:14:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81ED810E0F4;
	Wed,  3 Jul 2024 22:14:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arri.de header.i=@arri.de header.b="HJZagDfq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05hn2229.outbound.protection.outlook.com [52.100.20.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E5410E8B3
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 14:05:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LDAR+UV0J9wBVy+rRPWx/2qI1bZI7ZH3Uf64M2lNT7VuimNxYiAxMjUUqMroUAf36yq3HpWtWmDfriFm5FLCifIpJKx2v3zASz9h8vN+Ap8dJPGwqel66ibUyZ/WkvpqfIPZ798ZbGtRS5hXPJb1F6xhyKBy0LQI+haKmJROR17kA9WmEYRzWOaMH4xjbEI0qtcK+zWtId8t9Iiz2qN7yMIefO5w/VF9c4rLZDcjQr7zXbyd9lMoZzHh3Q/9hlmor7X4AMs2yqPu1M7M61L05cCxSceRkYybxlToLNlErrFNqDwYFSPU/pdSCvT/lNv5oG75PnfmGI+VkeKe4zXO/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E10gPqcL6hRgvaMs8XYn2D9znD4b6zwR4muSMuLp8o4=;
 b=gvDjb2L8UP1801qLGXLUAKsgB8EhF93uW0oFbDATfrXw425uzYUu5m97+uyx+FVO/bAW9XtbCuv6uDpeRA5ZjyXatZfWWVWlbIlJFd7dRa+oNRF+tc7UxXs9XmE5FQR2fSQnjprBlV4lnFXIxZ9R7U2PSE3XfdCruKj7oBkJM5284JcOVNAqqLrGi2X3+Vq0pUGyzCl/7h2BMscY4WS1Cokf/gpWGub8Cz7hRdJxoYDZL5E2CBhubeu+u/jwXPEW1nr1V3PXEXcqJziK/iCRfc6+PEnJ1AV4OSbQaAXvxb6F7xsPlavCpN45rdX++3xvsBk43jDIA5tiVoEXo7wxWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 52.169.0.179) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=arri.de;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arri.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arri.de; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E10gPqcL6hRgvaMs8XYn2D9znD4b6zwR4muSMuLp8o4=;
 b=HJZagDfqx002PhxHw7ZMJREapaKbK6OJYGb1r5XTDlhrPksYcQNUCGZ9svdO+9DOMSpElL68qboORJYatDTDk9xks2RKNnfITYUceVVsHyKJ5P/V/Wnd6219IG6T+QqEJ9OA0u66E9gy6r/3zIu2K9VluDXfANvu1BZDrOmHI9M=
Received: from DB7PR05CA0049.eurprd05.prod.outlook.com (2603:10a6:10:2e::26)
 by VI1PR07MB6672.eurprd07.prod.outlook.com (2603:10a6:800:18f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.23; Wed, 3 Jul
 2024 14:05:36 +0000
Received: from DB3PEPF0000885E.eurprd02.prod.outlook.com
 (2603:10a6:10:2e:cafe::4a) by DB7PR05CA0049.outlook.office365.com
 (2603:10a6:10:2e::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25 via Frontend
 Transport; Wed, 3 Jul 2024 14:05:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 52.169.0.179)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arri.de;
Received-SPF: Pass (protection.outlook.com: domain of arri.de designates
 52.169.0.179 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.169.0.179; helo=eu2.smtp.exclaimer.net; pr=C
Received: from eu2.smtp.exclaimer.net (52.169.0.179) by
 DB3PEPF0000885E.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.7741.18 via Frontend Transport; Wed, 3 Jul 2024 14:05:33 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (104.47.17.104)
 by eu2.smtp.exclaimer.net (52.169.0.179) with Exclaimer Signature Manager
 ESMTP Proxy eu2.smtp.exclaimer.net (tlsversion=TLS12,
 tlscipher=TLS_ECDHE_WITH_AES256_SHA384); Wed, 3 Jul 2024 14:05:34 +0000
X-ExclaimerHostedSignatures-MessageProcessed: true
X-ExclaimerProxyLatency: 16751512
X-ExclaimerImprintLatency: 11350820
X-ExclaimerImprintAction: 829cb2d161f74764956e5a39f7feacf8
Content-Type: multipart/related;
 boundary="----_=_NextPart_4996921f-6d18-4a08-88ed-e02c2429e54f"
Received: from AS4P195CA0035.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:65a::19)
 by PAXPR07MB8339.eurprd07.prod.outlook.com (2603:10a6:102:220::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.23; Wed, 3 Jul
 2024 14:05:31 +0000
Received: from AMS1EPF0000004E.eurprd04.prod.outlook.com
 (2603:10a6:20b:65a:cafe::84) by AS4P195CA0035.outlook.office365.com
 (2603:10a6:20b:65a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25 via Frontend
 Transport; Wed, 3 Jul 2024 14:05:31 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 AMS1EPF0000004E.mail.protection.outlook.com (10.167.16.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.18 via Frontend Transport; Wed, 3 Jul 2024 14:05:30 +0000
Received: from N9W6SW14.arri.de (10.30.4.245) by mta.arri.de (10.10.18.5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Wed, 3 Jul
 2024 16:05:29 +0200
From: Christian Eggers <ceggers@arri.de>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: David Lechner <david@lechnology.com>, =?UTF-8?q?Noralf=20Tr=C3=B8nnes?=
 <noralf@tronnes.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Christian Eggers <ceggers@arri.de>
Subject: [RFC PATCH] drm/tiny: Add support for Sitronix ST7539
Date: Wed, 3 Jul 2024 16:05:04 +0200
Message-ID: <20240703140504.8518-1-ceggers@arri.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Originating-IP: [10.30.4.245]
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004E:EE_|PAXPR07MB8339:EE_|DB3PEPF0000885E:EE_|VI1PR07MB6672:EE_
X-MS-Office365-Filtering-Correlation-Id: 05a03bfa-24dd-4650-8da0-08dc9b6935a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|34020700016|36860700013|12100799063;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?tdoqC5B78OIiSNsP1p8MkH2ZV29s+bg3fcL8K0/fU54+U3+oFnD2ZfggOxsM?=
 =?us-ascii?Q?xwD3OpnGU4m20SUHoTdesdLgHSmoBjel+QGTmqfKY6AA3faor2Re0FZx2Ovd?=
 =?us-ascii?Q?XmbfXVipNpmwSBrcGseZ878eh7jdgBhTXlDJaaGRCAJNgGb239KE44mvhn8s?=
 =?us-ascii?Q?zj+ikfWelUAkP+PnO+2eu9kNhurDcDn6uxM9bCL7KTah8j6iWzuW9L3xjLQV?=
 =?us-ascii?Q?XF78NWwuTz1+WeBd6eQfkfYmDM1jZPqv1hDXzO4f7T21JuEdyWHRAofMzaGG?=
 =?us-ascii?Q?hY9VJupLUCtsfTfQO02caIKPXztad4lfrneo8yFeqEucMeMRu165bQBFYpr7?=
 =?us-ascii?Q?cF67IcV4c3KlJQMS32+y/UxHZKaqJx7TYZ7TL+5G4XCCOYL/haQAg4Fy1X06?=
 =?us-ascii?Q?ah5vzPF34teNW2Sj5rBAtNLqFsY+9drfmehTjosYWkorrdTmmlKP9cHkyTW4?=
 =?us-ascii?Q?iohrIg8VDEHhSq5f7rP9OjUXBXUF60bfVkOd3Yut788SqV0kKwG2xHyFpKEg?=
 =?us-ascii?Q?bDLAxXXOyauHD7EjnWJjz9gm8TNQCNDi/2tRdMYPbFmhasCA1VuCW19bKmh+?=
 =?us-ascii?Q?hrhQ1rmPHY7DptdILtcb7Jh+G1x9cI0iNZ9zbm95zCy+J3FBZFDJsEKyWMJf?=
 =?us-ascii?Q?vOBAvvHk8Jo+OuNPISIhPyDZVsB2zhh1HWrOFZs3lKX4p9jxYw6EWpTyIWNf?=
 =?us-ascii?Q?/F5YJTNycp2YzJ6MFg9FUQh0Xtew0wUs03+e/EqrcDYjLjiQqtxZ67cd0hZa?=
 =?us-ascii?Q?ddg5K6rv57Rh3MiegiRxU0eObaamaBJ8XNpIPekMqWJIzIvWOxuPRsCyfqYL?=
 =?us-ascii?Q?Brg2MsluYk9YZLd0uufgaS40G5Q5ktK/KFqKN+dZ1yXzlFt6gEITMN+TaO8z?=
 =?us-ascii?Q?JlWU79tGB2g3e1O44vULBMJao5gvXxZ+v0b6oUkGErIC1qzIcL5XCPJxDO3v?=
 =?us-ascii?Q?qFD26/NsGb/673RiKDP5zm90yf/TSzwSjJgUujZVRSdwSCPVW57Xf+fbtZbl?=
 =?us-ascii?Q?dcCmbHXIAklor8alzBJinFhwO04nPm4pU5AotprcA+Ol1fpg2wNLSY1zymW2?=
 =?us-ascii?Q?bJQhuFQvATwp/crsvzjO3rHCF6RRo/wsbOIVBE5GnQ+VlBkSO2MU21Pa7B5P?=
 =?us-ascii?Q?m+qZ1tSZLZqKX3nkki92B1h3t9qSTaT2INOE+qkkM8c55cmJqqTiQyA2j+83?=
 =?us-ascii?Q?Tc2dBsyS+it2QqWBWtkp9MYJ0g+BZoege/TjTAGxYc8lo4Br7gzmOoRWm1rJ?=
 =?us-ascii?Q?dfmWQdll1FigLGarP1noqVhEzyp/XnNvH/sGil/RBdloHDqjlwctmUi+tFgd?=
 =?us-ascii?Q?yt5P5yox2X6TkM1k12zKvtsauUEVUZ7AIX6TSO/BNMr0cgrM2ttuu73zqm3+?=
 =?us-ascii?Q?b6selarA5T/td/8qKSJykaUsyoGY?=
X-Forefront-Antispam-Report-Untrusted: CIP:217.111.95.7; CTRY:DE; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:mta.arri.de; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(34020700016)(36860700013)(12100799063);
 DIR:OUT; SFP:1501; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR07MB8339
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB3PEPF0000885E.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0cb1eaf9-cf4b-4266-88d8-08dc9b69327b
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|34020700016|35042699022|82310400026|36860700013|376014|1800799024|12100799063;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TlViYlA2YnRYeFJMb2hWZWZOZkdiUVRYZXBjUW01eU9MdHBHN3ZTRXFPcEhW?=
 =?utf-8?B?RlRpdHZCSjNLWExXb2hvcHNma25MYlZQZjNDbXJySjRlSlZZZWw0dVZnZkJE?=
 =?utf-8?B?ZG5hRFdET0dxZUFqU0cwMjN3cFRrY3NmdjYwTVp3ejFjekE4NnFWYkVCWkE4?=
 =?utf-8?B?YVVkWklnOWpCb1RDR1YzRE5DcW5Pc0N1Z0MrQlFZSmxuNWNqK01iVWR4TUh0?=
 =?utf-8?B?TFB3Mmk1ZVNQY3ViZjhQV0RwV256STZ5SGZXeENhMnZ2bit2ZDJXUC9vME9u?=
 =?utf-8?B?NDhicHJpYlcwNVlydFA2d3dZd0RUYkdqeThYYTRxVUhFclRNUms5UU1ja0Rs?=
 =?utf-8?B?NDNPd3kxVDlZZjRBSktrblZpOVNmU21XMDl5YjFxYzVhRWdjMkxvSWd4cVhM?=
 =?utf-8?B?UlZGNFZaTjdUUHJGYnFqZWE5dEg5QmRzMVdvVW5xbmZLT1JJSkREQ0RGWlhx?=
 =?utf-8?B?SXFvaC9MaTN3NUVadEJ6QWZ2MEpBMS9WVG1xc0xraTl3cnVUK1VHa0R6LzVX?=
 =?utf-8?B?SVMwc0FLdGF2dDd6N0Z0Z1hHaXNLOEFqWmQzZTRQbVU1WGZTY1hXRndibkZF?=
 =?utf-8?B?aHR1ZHowYjlYVGFieDBUYzlwTXdXU04yeUNMZ2dFaVZWTWtsajZMV1ZINTNO?=
 =?utf-8?B?RXdwSzArZDNrVnNzcWp4U3R4bWx1dEVkVENZaHlybnZDbzY2Z2djNUlsazUv?=
 =?utf-8?B?RzNZWmoweEgvY0NjSjU0M2lVd294NVBuM3cxS2hOUmY3M0JiSDd4ek4vd0xT?=
 =?utf-8?B?cmUwVFhiQ0loYSt6Ymt4dnliT25jdlBaN0NVdzdBVlRxMzRmTkEvYVdqZkpR?=
 =?utf-8?B?WEVwTnNjZkRYU0dNbitCay9IbEo0Ly9UekFyenpyRDk1WjIvUzlNZytSelNw?=
 =?utf-8?B?QnNMVzkvdUdFeGtkSGxBWGl5b0FHNzVsL09SVmhLN1BaSWxMMVFCVmovMWVM?=
 =?utf-8?B?cFQrQlY1OTdlRG9EaVg2K3UvcFdYWkdhUFBZV1BlN0FGWi9zSmlVdW5xa2Vi?=
 =?utf-8?B?Zm1yV3lJcTE2R29Wb3h5alI0ZUljYThXaVIvK29aSDJ2MU9tME5xSUVpdUdW?=
 =?utf-8?B?bHpRUkdFV3ZNRjVzamZtdk5SeWxFbDhKdDRJeTlCWDdvR0lwWmw1L0RHdzN3?=
 =?utf-8?B?OElkTmlITlBQL3h6Z09vRFp0UEpCWnJxOFhPNEM3WHE2SHoxczZpN0loNFQ5?=
 =?utf-8?B?UVYyYXhER3RmaHYxK1RxTUkweDJZVTI3OVFLdlFPZHhwampPdm9ma1phZFkx?=
 =?utf-8?B?NHR6SnJWdHVNSGhQWWVSRm9kYWxCOSt0bHA4b29vV2k4RUtRVkRYSjg5Tlhv?=
 =?utf-8?B?OUw4ajBoRGEwMTZlVTdhcmtCUUlHbjFTcGNZU0RjZExXaHpZSmlxdHppQ053?=
 =?utf-8?B?NTdvSm5reGpTbklnY3g1cUovcFhvbmRua1Z1aVBjNndHYlZQUDJvSDlIVGh0?=
 =?utf-8?B?TU5aVFVpVVdYTVkycVdZUUU4cVlmSXdMcU0rUnJNVmZHdDZDVkovdXRUaXpq?=
 =?utf-8?B?MzBBL0JneW1aRUdoZXdVSWlERUVmMHRhNDFULzVHUm9IS0gvWkh0QzZhY0xq?=
 =?utf-8?B?NGF2Wk1EY1k0RXUwdzJHdU1JaDZ1SXZHZ01rdDNLTVdYdG5QUTF5YTFmbVE5?=
 =?utf-8?B?SVl3WWs3eTgyTnk4bTBDdUtKMU5sbkpTNzk4aWhqYVlNY2FKOUpSSXR4MUQ0?=
 =?utf-8?B?SHNPL1dsSTRrUGQrOWJmOUxpWUxYUEV5OTBRK0twNDY4bmdhVHVTNXU1VWRC?=
 =?utf-8?B?MFhITUJ4eS9NK0FoVGNEbDQ4blpGYUpaWnpBRHZpeDducWhYR3FWaVo2b2tU?=
 =?utf-8?B?ZFl2UGxQZ0UzdFkxNkNRbUk0ckJwVXRQOHZhRThDcmRORi8xZ2g5WGxwN0tN?=
 =?utf-8?B?RGdHODg0RFJrWkoyeVhyNzZtMTl6cEliZ05vSGhId3hjRmc9PQ==?=
X-Forefront-Antispam-Report: CIP:52.169.0.179; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:eu2.smtp.exclaimer.net; PTR:eu2.smtp.exclaimer.net;
 CAT:NONE;
 SFS:(13230040)(34020700016)(35042699022)(82310400026)(36860700013)(376014)(1800799024)(12100799063);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 14:05:33.9291 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05a03bfa-24dd-4650-8da0-08dc9b6935a0
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a; Ip=[52.169.0.179];
 Helo=[eu2.smtp.exclaimer.net]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB6672
X-Mailman-Approved-At: Wed, 03 Jul 2024 22:13:57 +0000
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

This is a multi-part message in MIME format.

------_=_NextPart_4996921f-6d18-4a08-88ed-e02c2429e54f
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_7f9b811e-48ef-4552-8611-14319a450862"

------_=_NextPart_7f9b811e-48ef-4552-8611-14319a450862
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Based on the existing ST7586 driver. But the ST7539 ...
- is monochrome only
- has 8 VERTICAL pixels per byte
- doesn't support any MIPI DCS commands
- has (a few) 16 bit commands
- doesn't support setting a clipping rect when writing to the RAM
- doesn't support rotation (only mirroring of X and/or Y axis)

Questions/TODO:
- should drivers for such old displays be mainlined?
- shall I use mipi_dbi_ although the display doesn't implement MIPI DCS
  (and has some 16 bit commands)?
- can the conversion to 8 vertical pixels/byte (taken from
  solomon/ssd130x.c) be avoided / simplified / made more efficient?
- how to implement setting of the display contrast (required by my
  application)?
- add device tree binding

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 MAINTAINERS                   |   6 +
 drivers/gpu/drm/tiny/Kconfig  |  11 +
 drivers/gpu/drm/tiny/Makefile |   1 +
 drivers/gpu/drm/tiny/st7539.c | 424 ++++++++++++++++++++++++++++++++++
 4 files changed, 442 insertions(+)
 create mode 100644 drivers/gpu/drm/tiny/st7539.c

diff --git a/MAINTAINERS b/MAINTAINERS
index e7d543cf9f6c..7191206c1ae3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7116,6 +7116,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
 F:	drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
 
+DRM DRIVER FOR SITRONIX ST7539 PANELS
+M:	Christian Eggers <ceggers@arri.de>
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	drivers/gpu/drm/tiny/st7539.c
+
 DRM DRIVER FOR SITRONIX ST7586 PANELS
 M:	David Lechner <david@lechnology.com>
 S:	Maintained
diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index f6889f649bc1..220d2aee9354 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -186,6 +186,17 @@ config TINYDRM_REPAPER
 
 	  If M is selected the module will be called repaper.
 
+config TINYDRM_ST7539
+	tristate "DRM support for Sitronix ST7539 display panels"
+	depends on DRM && SPI
+	select DRM_KMS_HELPER
+	select DRM_GEM_DMA_HELPER
+	select DRM_MIPI_DBI
+	help
+	  DRM driver for Sitronix ST7539 panels.
+
+	  If M is selected the module will be called st7539.
+
 config TINYDRM_ST7586
 	tristate "DRM support for Sitronix ST7586 display panels"
 	depends on DRM && SPI
diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makefile
index 76dde89a044b..0bd217779995 100644
--- a/drivers/gpu/drm/tiny/Makefile
+++ b/drivers/gpu/drm/tiny/Makefile
@@ -14,5 +14,6 @@ obj-$(CONFIG_TINYDRM_ILI9341)		+=3D ili9341.o
 obj-$(CONFIG_TINYDRM_ILI9486)		+=3D ili9486.o
 obj-$(CONFIG_TINYDRM_MI0283QT)		+=3D mi0283qt.o
 obj-$(CONFIG_TINYDRM_REPAPER)		+=3D repaper.o
+obj-$(CONFIG_TINYDRM_ST7539)		+=3D st7539.o
 obj-$(CONFIG_TINYDRM_ST7586)		+=3D st7586.o
 obj-$(CONFIG_TINYDRM_ST7735R)		+=3D st7735r.o
diff --git a/drivers/gpu/drm/tiny/st7539.c b/drivers/gpu/drm/tiny/st7539.c
new file mode 100644
index 000000000000..9a6aeea006ef
--- /dev/null
+++ b/drivers/gpu/drm/tiny/st7539.c
@@ -0,0 +1,424 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * DRM driver for Sitronix ST7539 panels
+ *
+ * Copyright 2024 Christian Eggers <ceggers@arri.de>
+ *
+ * based on st7586.c
+ * Copyright 2017 David Lechner <david@lechnology.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/property.h>
+#include <linux/spi/spi.h>
+#include <video/mipi_display.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_damage_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fb_dma_helper.h>
+#include <drm/drm_fbdev_dma.h>
+#include <drm/drm_format_helper.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_mipi_dbi.h>
+#include <drm/drm_rect.h>
+
+/* controller-specific commands */
+#define ST7539_SET_COLUMN_ADDRESS_LSB(CA) (0x00 | ((CA) & 0x0f))
+#define ST7539_SET_COLUMN_ADDRESS_MSB(CA) (0x10 | (((CA) & 0xff) >> 4))
+#define ST7539_SET_SCROLL_LINE(x)    (0x40 | ((x) & 0x3f))
+#define ST7539_SET_CONTRAST           0x81    /* + 1 byte value */
+#define ST7539_SET_FPS__76            0xA0    /* 76 fps */
+#define ST7539_SET_FPS__95            0xA1    /* 95 fps */
+#define ST7539_SET_FPS__132           0xA2    /* 132 fps */
+#define ST7539_SET_FPS__168           0xA3    /* 168 fps */
+#define ST7539_SET_DISP_NORMAL        0xA6    /* non inverse */
+#define ST7539_SET_DISP_INVERSE       0xA7    /* inverse display */
+#define ST7539_SET_DISP_OFF           0xAE    /* display off and controlle=
r power down */
+#define ST7539_SET_DISP_ON            0xAF    /* display on and controller=
 power on */
+#define ST7539_SET_PAGE_ADDRESS(PA)  (0xB0 | ((PA) & 0xf))
+#define ST7539_SET_SCAN_NORMAL        0xC0    /* MX=3D0, MY=3D0 */
+#define ST7539_SET_SCAN_X_INV         0xC2    /* MX=3D1, MY=3D0 */
+#define ST7539_SET_SCAN_Y_INV         0xC4    /* MX=3D0, MY=3D1 */
+#define ST7539_SET_SCAN_XY_INV        0xC6    /* MX=3D1, MY=3D1 */
+#define ST7539_SOFT_RESET             0xE2
+#define ST7539_NOP                    0xE3
+#define ST7539_SET_BIAS__1_6          0xE8    /* 1/6 */
+#define ST7539_SET_BIAS__1_7          0xE9    /* 1/7 */
+#define ST7539_SET_BIAS__1_8          0xEA    /* 1/8 */
+#define ST7539_SET_BIAS__1_9          0xEB    /* 1/9 */
+
+#define ST7539_HOR_RES 192
+#define ST7539_VER_RES 64
+
+/* slightly modified version of from mipi_dbi_typec3_command() */
+static int st7539_dbi_command_buf(struct mipi_dbi *dbi,
+				   u8 *cmd, size_t cmd_len,
+				   u8 *par, size_t num)
+{
+	struct spi_device *spi =3D dbi->spi;
+	u32 speed_hz;
+	int ret =3D 0;
+
+	spi_bus_lock(spi->controller);
+	gpiod_set_value_cansleep(dbi->dc, 0);
+	speed_hz =3D mipi_dbi_spi_cmd_max_speed(spi, cmd_len);
+	ret =3D mipi_dbi_spi_transfer(spi, speed_hz, 8, cmd, cmd_len);
+	spi_bus_unlock(spi->controller);
+	if (ret || !num)
+		return ret;
+
+	spi_bus_lock(spi->controller);
+	gpiod_set_value_cansleep(dbi->dc, 1);
+	speed_hz =3D mipi_dbi_spi_cmd_max_speed(spi, num);
+	ret =3D mipi_dbi_spi_transfer(spi, speed_hz, 8, par, num);
+	spi_bus_unlock(spi->controller);
+
+	return ret;
+}
+
+/**
+ * st7539_dbi_command16 - Command with 2 bytes
+ * @dbi: MIPI DBI structure
+ * @cmd: Array of two command bytes
+ *
+ * Returns:
+ * Zero on success, negative error code on failure.
+ */
+static int st7539_dbi_command16(struct mipi_dbi *dbi, const u8 *cmd)
+{
+	u8 *cmdbuf;
+	int ret;
+
+	/* SPI requires dma-safe buffers */
+	cmdbuf =3D kmemdup(cmd, 2, GFP_KERNEL);
+	if (!cmdbuf)
+		return -ENOMEM;
+
+	mutex_lock(&dbi->cmdlock);
+	ret =3D st7539_dbi_command_buf(dbi, cmdbuf, 2, NULL, 0);
+	mutex_unlock(&dbi->cmdlock);
+
+	kfree(cmdbuf);
+
+	return ret;
+}
+
+static int st7539_dbi_typec3_command(struct mipi_dbi *dbi,
+				   u8 *cmd, u8 *par, size_t num)
+{
+	return st7539_dbi_command_buf(dbi, cmd, 1, par, num);
+}
+
+/*
+ * The ST7539 controller packs 8 VERTICAL pixels into one byte
+ * (similar as "page_address_mode" for SH1106 in drm/solomon/ssd130x.c).
+ */
+
+static void st7539_xrgb8888_to_mono(u8 *dst, struct iosys_map *src,
+				       struct drm_framebuffer *fb,
+				       struct drm_rect *clip,
+				       struct drm_format_conv_state *fmtcnv_state)
+{
+	u8 *buf;
+	struct iosys_map dst_map;
+
+	unsigned int width =3D drm_rect_width(clip);
+	unsigned int height =3D drm_rect_height(clip);
+	unsigned int line_length =3D DIV_ROUND_UP(width, 8);
+	unsigned int page_height =3D 8;
+	unsigned int pages =3D DIV_ROUND_UP(height, page_height);
+	size_t len =3D pages * width;
+	u32 array_idx =3D 0;
+	int i, j, k;
+
+	/* intermediate buffer (8 horizontal pixels per byte) */
+	buf =3D kmalloc(len, GFP_KERNEL);
+	if (!buf)
+		return;
+
+	iosys_map_set_vaddr(&dst_map, buf);
+	drm_fb_xrgb8888_to_mono(&dst_map, NULL, src, fb, clip, fmtcnv_state);
+
+	/* convert to 8 VERTICAL pixels per byte */
+	for (i =3D 0; i < pages; i++) {
+		for (j =3D 0; j < width; j++) {
+			u8 data =3D 0;
+
+			for (k =3D 0; k < 8; k++) {
+				u8 byte =3D buf[(8 * i + k) * line_length + j / 8];
+				u8 bit =3D !((byte >> (j % 8)) & 1);  /* invert pixels */
+
+				data |=3D bit << k;
+			}
+			dst[array_idx++] =3D data;
+		}
+	}
+
+	kfree(buf);
+}
+
+static int st7539_buf_copy(void *dst, struct iosys_map *src, struct drm_fr=
amebuffer *fb,
+			   struct drm_rect *clip, struct drm_format_conv_state *fmtcnv_state)
+{
+	int ret;
+
+	ret =3D drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
+	if (ret)
+		return ret;
+
+	st7539_xrgb8888_to_mono(dst, src, fb, clip, fmtcnv_state);
+
+	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
+
+	return 0;
+}
+
+static void st7539_fb_dirty(struct iosys_map *src, struct drm_framebuffer =
*fb,
+			    struct drm_rect *rect, struct drm_format_conv_state *fmtcnv_state)
+{
+	struct mipi_dbi_dev *dbidev =3D drm_to_mipi_dbi_dev(fb->dev);
+	struct mipi_dbi *dbi =3D &dbidev->dbi;
+	int start, end, ret =3D 0;
+
+	/* hardware doesn't support clipping of the column --> send full lines */
+	rect->x1 =3D 0;
+	rect->x2 =3D ST7539_HOR_RES;
+	/* 8 pixels per byte, so grow clip to nearest multiple of 8 */
+	rect->y1 =3D rounddown(rect->y1, 8);
+	rect->y2 =3D roundup(rect->y2, 8);
+
+	DRM_DEBUG_KMS("Flushing [FB:%d] " DRM_RECT_FMT "\n", fb->base.id, DRM_REC=
T_ARG(rect));
+
+	ret =3D st7539_buf_copy(dbidev->tx_buf, src, fb, rect, fmtcnv_state);
+	if (ret)
+		goto err_msg;
+
+	/* Pixels are packed 8 per byte */
+	start =3D rect->y1 / 8;
+	end =3D rect->y2 / 8;
+
+	mipi_dbi_command(dbi, ST7539_SET_COLUMN_ADDRESS_LSB(rect->x1 & 0xFF));
+	mipi_dbi_command(dbi, ST7539_SET_COLUMN_ADDRESS_MSB((rect->x1 >> 8) & 0xF=
F));
+
+	ret =3D mipi_dbi_command_buf(dbi, ST7539_SET_PAGE_ADDRESS(start),
+				   (u8 *)dbidev->tx_buf,
+				   (rect->x2 - rect->x1) * (end - start));
+err_msg:
+	if (ret)
+		dev_err_once(fb->dev->dev, "Failed to update display %d\n", ret);
+}
+
+static void st7539_pipe_update(struct drm_simple_display_pipe *pipe,
+			       struct drm_plane_state *old_state)
+{
+	struct drm_plane_state *state =3D pipe->plane.state;
+	struct drm_shadow_plane_state *shadow_plane_state =3D to_drm_shadow_plane=
_state(state);
+	struct drm_framebuffer *fb =3D state->fb;
+	struct drm_rect rect;
+	int idx;
+
+	if (!pipe->crtc.state->active)
+		return;
+
+	if (!drm_dev_enter(fb->dev, &idx))
+		return;
+
+	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
+		st7539_fb_dirty(&shadow_plane_state->data[0], fb, &rect,
+				&shadow_plane_state->fmtcnv_state);
+
+	drm_dev_exit(idx);
+}
+
+static void st7539_pipe_enable(struct drm_simple_display_pipe *pipe,
+			       struct drm_crtc_state *crtc_state,
+			       struct drm_plane_state *plane_state)
+{
+	struct mipi_dbi_dev *dbidev =3D drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct drm_shadow_plane_state *shadow_plane_state =3D to_drm_shadow_plane=
_state(plane_state);
+	struct drm_framebuffer *fb =3D plane_state->fb;
+	struct mipi_dbi *dbi =3D &dbidev->dbi;
+	struct drm_rect rect =3D {
+		.x1 =3D 0,
+		.x2 =3D fb->width,
+		.y1 =3D 0,
+		.y2 =3D fb->height,
+	};
+	int idx;
+
+	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+		return;
+
+	DRM_DEBUG_KMS("\n");
+
+	/* Cannot use mipi_dbi_poweron_reset() here as the ST7539 has a non DCI
+	 * opcode for soft reset
+	 */
+	mipi_dbi_hw_reset(dbi);
+
+	mipi_dbi_command(dbi, ST7539_SOFT_RESET);
+	mipi_dbi_command(dbi, ST7539_SET_FPS__76);
+	mipi_dbi_command(dbi, ST7539_SET_BIAS__1_9);
+	st7539_dbi_command16(dbi, (u8[]){ST7539_SET_CONTRAST, 120});
+	mipi_dbi_command(dbi, ST7539_SET_SCAN_Y_INV);  /* ToDo: make this configu=
rable */
+
+	st7539_fb_dirty(&shadow_plane_state->data[0], fb, &rect,
+			&shadow_plane_state->fmtcnv_state);
+
+	mipi_dbi_command(dbi, ST7539_SET_DISP_ON);
+}
+
+static void st7539_pipe_disable(struct drm_simple_display_pipe *pipe)
+{
+	struct mipi_dbi_dev *dbidev =3D drm_to_mipi_dbi_dev(pipe->crtc.dev);
+
+	/*
+	 * This callback is not protected by drm_dev_enter/exit since we want to
+	 * turn off the display on regular driver unload. It's highly unlikely
+	 * that the underlying SPI controller is gone should this be called after
+	 * unplug.
+	 */
+
+	DRM_DEBUG_KMS("\n");
+
+	mipi_dbi_command(&dbidev->dbi, MIPI_DCS_SET_DISPLAY_OFF);
+}
+
+static const u32 st7539_formats[] =3D {
+	DRM_FORMAT_XRGB8888,
+};
+
+static const struct drm_simple_display_pipe_funcs st7539_pipe_funcs =3D {
+	.mode_valid	=3D mipi_dbi_pipe_mode_valid,
+	.enable		=3D st7539_pipe_enable,
+	.disable	=3D st7539_pipe_disable,
+	.update		=3D st7539_pipe_update,
+	.begin_fb_access =3D mipi_dbi_pipe_begin_fb_access,
+	.end_fb_access	=3D mipi_dbi_pipe_end_fb_access,
+	.reset_plane	=3D mipi_dbi_pipe_reset_plane,
+	.duplicate_plane_state =3D mipi_dbi_pipe_duplicate_plane_state,
+	.destroy_plane_state =3D mipi_dbi_pipe_destroy_plane_state,
+};
+
+static const struct drm_display_mode st7539_mode =3D {
+	DRM_SIMPLE_MODE(ST7539_HOR_RES, ST7539_VER_RES, 57, 23),
+};
+
+DEFINE_DRM_GEM_DMA_FOPS(st7539_fops);
+
+static const struct drm_driver st7539_driver =3D {
+	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
+	.fops			=3D &st7539_fops,
+	DRM_GEM_DMA_DRIVER_OPS_VMAP,
+	.debugfs_init		=3D mipi_dbi_debugfs_init,
+	.name			=3D "st7539",
+	.desc			=3D "Sitronix ST7539",
+	.date			=3D "20240624",
+	.major			=3D 1,
+	.minor			=3D 0,
+};
+
+static const struct of_device_id st7539_of_match[] =3D {
+	{ .compatible =3D "sitronix,st7539" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, st7539_of_match);
+
+static const struct spi_device_id st7539_id[] =3D {
+	{ "st7539", 0 },
+	{ },
+};
+MODULE_DEVICE_TABLE(spi, st7539_id);
+
+static int st7539_probe(struct spi_device *spi)
+{
+	struct device *dev =3D &spi->dev;
+	struct mipi_dbi_dev *dbidev;
+	struct drm_device *drm;
+	struct mipi_dbi *dbi;
+	struct gpio_desc *a0;
+	size_t bufsize;
+	int ret;
+
+	dbidev =3D devm_drm_dev_alloc(dev, &st7539_driver,
+				    struct mipi_dbi_dev, drm);
+	if (IS_ERR(dbidev))
+		return PTR_ERR(dbidev);
+
+	dbi =3D &dbidev->dbi;
+	drm =3D &dbidev->drm;
+
+	bufsize =3D DIV_ROUND_UP(st7539_mode.vdisplay, 8) * st7539_mode.hdisplay;
+
+	dbi->reset =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(dbi->reset))
+		return dev_err_probe(dev, PTR_ERR(dbi->reset), "Failed to get GPIO 'rese=
t'\n");
+
+	a0 =3D devm_gpiod_get(dev, "a0", GPIOD_OUT_LOW);
+	if (IS_ERR(a0))
+		return dev_err_probe(dev, PTR_ERR(a0), "Failed to get GPIO 'a0'\n");
+
+	ret =3D mipi_dbi_spi_init(spi, dbi, a0);
+	if (ret)
+		return ret;
+
+	/* override the command function set in mipi_dbi_spi_init() */
+	dbi->command =3D st7539_dbi_typec3_command;
+
+	/* Cannot read from this controller via SPI */
+	dbi->read_commands =3D NULL;
+
+	ret =3D mipi_dbi_dev_init_with_formats(dbidev, &st7539_pipe_funcs,
+					     st7539_formats, ARRAY_SIZE(st7539_formats),
+					     &st7539_mode, 0, bufsize);
+	if (ret)
+		return ret;
+
+	drm_mode_config_reset(drm);
+
+	ret =3D drm_dev_register(drm, 0);
+	if (ret)
+		return ret;
+
+	spi_set_drvdata(spi, drm);
+
+	drm_fbdev_dma_setup(drm, 0);
+
+	return 0;
+}
+
+static void st7539_remove(struct spi_device *spi)
+{
+	struct drm_device *drm =3D spi_get_drvdata(spi);
+
+	drm_dev_unplug(drm);
+	drm_atomic_helper_shutdown(drm);
+}
+
+static void st7539_shutdown(struct spi_device *spi)
+{
+	drm_atomic_helper_shutdown(spi_get_drvdata(spi));
+}
+
+static struct spi_driver st7539_spi_driver =3D {
+	.driver =3D {
+		.name =3D "st7539",
+		.of_match_table =3D st7539_of_match,
+	},
+	.id_table =3D st7539_id,
+	.probe =3D st7539_probe,
+	.remove =3D st7539_remove,
+	.shutdown =3D st7539_shutdown,
+};
+module_spi_driver(st7539_spi_driver);
+
+MODULE_DESCRIPTION("Sitronix ST7539 DRM driver");
+MODULE_AUTHOR("Christian Eggers <ceggers@arri.de>");
+MODULE_LICENSE("GPL");
-- 
2.43.0


_______________________________________________________
Christian 
Eggers
Software Engineer
=E2=80=8B
ARRI
Arnold & Richter Cine Technik GmbH & Co. Betriebs KG 
Arriweg 17, 
83071 
Stephanskirchen
www.arri.com 

+49 8036 3009-3118
CEggers@arri.de

=E2=80=8B

Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
Sitz: M=C3=BCnchen - Registergericht: Amtsgericht M=C3=BCnchen - Handelsreg=
isternummer: HRA 57918
Pers=C3=B6nlich haftender Gesellschafter: Arnold & Richter Cine Technik Gmb=
H
Sitz: M=C3=BCnchen - Registergericht: Amtsgericht M=C3=BCnchen - Handelsreg=
isternummer: HRB 54477
Gesch=C3=A4ftsf=C3=BChrer: Dr. Matthias Erb (Chairman); Walter Trauninger

=E2=80=8B

------_=_NextPart_7f9b811e-48ef-4552-8611-14319a450862
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8" /></head><body><div>Based on the existing ST7586 driver. But the =
ST7539 ...<br />- is monochrome only<br />- has 8 VERTICAL pixels per byte<=
br />- doesn&#39;t support any MIPI DCS commands<br />- has (a few) 16 bit =
commands<br />- doesn&#39;t support setting a clipping rect when writing to=
 the RAM<br />- doesn&#39;t support rotation (only mirroring of X and/or Y =
axis)<br /><br />Questions/TODO:<br />- should drivers for such old display=
s be mainlined?<br />- shall I use mipi_dbi_ although the display doesn&#39=
;t implement MIPI DCS<br />  (and has some 16 bit commands)?<br />- can the=
 conversion to 8 vertical pixels/byte (taken from<br />  solomon/ssd130x.c)=
 be avoided / simplified / made more efficient?<br />- how to implement set=
ting of the display contrast (required by my<br />  application)?<br />- ad=
d device tree binding<br /><br />Signed-off-by: Christian Eggers &lt;cegger=
s@arri.de&gt;<br />---<br /> MAINTAINERS                   |   6 +<br /> dr=
ivers/gpu/drm/tiny/Kconfig  |  11 +<br /> drivers/gpu/drm/tiny/Makefile |  =
 1 +<br /> drivers/gpu/drm/tiny/st7539.c | 424 ++++++++++++++++++++++++++++=
++++++<br /> 4 files changed, 442 insertions(+)<br /> create mode 100644 dr=
ivers/gpu/drm/tiny/st7539.c<br /><br />diff --git a/MAINTAINERS b/MAINTAINE=
RS<br />index e7d543cf9f6c..7191206c1ae3 100644<br />--- a/MAINTAINERS<br /=
>+++ b/MAINTAINERS<br />@@ -7116,6 +7116,12 @@ S:	Maintained<br /> F:	Docum=
entation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml<br /> F:	dr=
ivers/gpu/drm/panel/panel-samsung-s6d7aa0.c<br /> <br />+DRM DRIVER FOR SIT=
RONIX ST7539 PANELS<br />+M:	Christian Eggers &lt;ceggers@arri.de&gt;<br />=
+S:	Maintained<br />+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.=
git<br />+F:	drivers/gpu/drm/tiny/st7539.c<br />+<br /> DRM DRIVER FOR SITR=
ONIX ST7586 PANELS<br /> M:	David Lechner &lt;david@lechnology.com&gt;<br /=
> S:	Maintained<br />diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gp=
u/drm/tiny/Kconfig<br />index f6889f649bc1..220d2aee9354 100644<br />--- a/=
drivers/gpu/drm/tiny/Kconfig<br />+++ b/drivers/gpu/drm/tiny/Kconfig<br />@=
@ -186,6 +186,17 @@ config TINYDRM_REPAPER<br /> <br /> 	  If M is selected=
 the module will be called repaper.<br /> <br />+config TINYDRM_ST7539<br /=
>+	tristate &quot;DRM support for Sitronix ST7539 display panels&quot;<br /=
>+	depends on DRM &amp;&amp; SPI<br />+	select DRM_KMS_HELPER<br />+	select=
 DRM_GEM_DMA_HELPER<br />+	select DRM_MIPI_DBI<br />+	help<br />+	  DRM dri=
ver for Sitronix ST7539 panels.<br />+<br />+	  If M is selected the module=
 will be called st7539.<br />+<br /> config TINYDRM_ST7586<br /> 	tristate =
&quot;DRM support for Sitronix ST7586 display panels&quot;<br /> 	depends o=
n DRM &amp;&amp; SPI<br />diff --git a/drivers/gpu/drm/tiny/Makefile b/driv=
ers/gpu/drm/tiny/Makefile<br />index 76dde89a044b..0bd217779995 100644<br /=
>--- a/drivers/gpu/drm/tiny/Makefile<br />+++ b/drivers/gpu/drm/tiny/Makefi=
le<br />@@ -14,5 +14,6 @@ obj-$(CONFIG_TINYDRM_ILI9341)		+=3D ili9341.o<br =
/> obj-$(CONFIG_TINYDRM_ILI9486)		+=3D ili9486.o<br /> obj-$(CONFIG_TINYDRM=
_MI0283QT)		+=3D mi0283qt.o<br /> obj-$(CONFIG_TINYDRM_REPAPER)		+=3D repap=
er.o<br />+obj-$(CONFIG_TINYDRM_ST7539)		+=3D st7539.o<br /> obj-$(CONFIG_T=
INYDRM_ST7586)		+=3D st7586.o<br /> obj-$(CONFIG_TINYDRM_ST7735R)		+=3D st7=
735r.o<br />diff --git a/drivers/gpu/drm/tiny/st7539.c b/drivers/gpu/drm/ti=
ny/st7539.c<br />new file mode 100644<br />index 000000000000..9a6aeea006ef=
<br />--- /dev/null<br />+++ b/drivers/gpu/drm/tiny/st7539.c<br />@@ -0,0 +=
1,424 @@<br />+// SPDX-License-Identifier: GPL-2.0-or-later<br />+/*<br />+=
 * DRM driver for Sitronix ST7539 panels<br />+ *<br />+ * Copyright 2024 C=
hristian Eggers &lt;ceggers@arri.de&gt;<br />+ *<br />+ * based on st7586.c=
<br />+ * Copyright 2017 David Lechner &lt;david@lechnology.com&gt;<br />+ =
*/<br />+<br />+#include &lt;linux/delay.h&gt;<br />+#include &lt;linux/gpi=
o/consumer.h&gt;<br />+#include &lt;linux/module.h&gt;<br />+#include &lt;l=
inux/property.h&gt;<br />+#include &lt;linux/spi/spi.h&gt;<br />+#include &=
lt;video/mipi_display.h&gt;<br />+<br />+#include &lt;drm/drm_atomic_helper=
=2Eh&gt;<br />+#include &lt;drm/drm_damage_helper.h&gt;<br />+#include &lt;=
drm/drm_drv.h&gt;<br />+#include &lt;drm/drm_fb_dma_helper.h&gt;<br />+#inc=
lude &lt;drm/drm_fbdev_dma.h&gt;<br />+#include &lt;drm/drm_format_helper.h=
&gt;<br />+#include &lt;drm/drm_framebuffer.h&gt;<br />+#include &lt;drm/dr=
m_gem_atomic_helper.h&gt;<br />+#include &lt;drm/drm_gem_dma_helper.h&gt;<b=
r />+#include &lt;drm/drm_gem_framebuffer_helper.h&gt;<br />+#include &lt;d=
rm/drm_managed.h&gt;<br />+#include &lt;drm/drm_mipi_dbi.h&gt;<br />+#inclu=
de &lt;drm/drm_rect.h&gt;<br />+<br />+/* controller-specific commands */<b=
r />+#define ST7539_SET_COLUMN_ADDRESS_LSB(CA) (0x00 | ((CA) &amp; 0x0f))<b=
r />+#define ST7539_SET_COLUMN_ADDRESS_MSB(CA) (0x10 | (((CA) &amp; 0xff) &=
gt;&gt; 4))<br />+#define ST7539_SET_SCROLL_LINE(x)    (0x40 | ((x) &amp; 0=
x3f))<br />+#define ST7539_SET_CONTRAST           0x81    /* + 1 byte value=
 */<br />+#define ST7539_SET_FPS__76            0xA0    /* 76 fps */<br />+=
#define ST7539_SET_FPS__95            0xA1    /* 95 fps */<br />+#define ST=
7539_SET_FPS__132           0xA2    /* 132 fps */<br />+#define ST7539_SET_=
FPS__168           0xA3    /* 168 fps */<br />+#define ST7539_SET_DISP_NORM=
AL        0xA6    /* non inverse */<br />+#define ST7539_SET_DISP_INVERSE  =
     0xA7    /* inverse display */<br />+#define ST7539_SET_DISP_OFF       =
    0xAE    /* display off and controller power down */<br />+#define ST753=
9_SET_DISP_ON            0xAF    /* display on and controller power on */<b=
r />+#define ST7539_SET_PAGE_ADDRESS(PA)  (0xB0 | ((PA) &amp; 0xf))<br />+#=
define ST7539_SET_SCAN_NORMAL        0xC0    /* MX=3D0, MY=3D0 */<br />+#de=
fine ST7539_SET_SCAN_X_INV         0xC2    /* MX=3D1, MY=3D0 */<br />+#defi=
ne ST7539_SET_SCAN_Y_INV         0xC4    /* MX=3D0, MY=3D1 */<br />+#define=
 ST7539_SET_SCAN_XY_INV        0xC6    /* MX=3D1, MY=3D1 */<br />+#define S=
T7539_SOFT_RESET             0xE2<br />+#define ST7539_NOP                 =
   0xE3<br />+#define ST7539_SET_BIAS__1_6          0xE8    /* 1/6 */<br />=
+#define ST7539_SET_BIAS__1_7          0xE9    /* 1/7 */<br />+#define ST75=
39_SET_BIAS__1_8          0xEA    /* 1/8 */<br />+#define ST7539_SET_BIAS__=
1_9          0xEB    /* 1/9 */<br />+<br />+#define ST7539_HOR_RES 192<br /=
>+#define ST7539_VER_RES 64<br />+<br />+/* slightly modified version of fr=
om mipi_dbi_typec3_command() */<br />+static int st7539_dbi_command_buf(str=
uct mipi_dbi *dbi,<br />+				   u8 *cmd, size_t cmd_len,<br />+				   u8 *p=
ar, size_t num)<br />+{<br />+	struct spi_device *spi =3D dbi-&gt;spi;<br /=
>+	u32 speed_hz;<br />+	int ret =3D 0;<br />+<br />+	spi_bus_lock(spi-&gt;c=
ontroller);<br />+	gpiod_set_value_cansleep(dbi-&gt;dc, 0);<br />+	speed_hz=
 =3D mipi_dbi_spi_cmd_max_speed(spi, cmd_len);<br />+	ret =3D mipi_dbi_spi_=
transfer(spi, speed_hz, 8, cmd, cmd_len);<br />+	spi_bus_unlock(spi-&gt;con=
troller);<br />+	if (ret || !num)<br />+		return ret;<br />+<br />+	spi_bus=
_lock(spi-&gt;controller);<br />+	gpiod_set_value_cansleep(dbi-&gt;dc, 1);<=
br />+	speed_hz =3D mipi_dbi_spi_cmd_max_speed(spi, num);<br />+	ret =3D mi=
pi_dbi_spi_transfer(spi, speed_hz, 8, par, num);<br />+	spi_bus_unlock(spi-=
&gt;controller);<br />+<br />+	return ret;<br />+}<br />+<br />+/**<br />+ =
* st7539_dbi_command16 - Command with 2 bytes<br />+ * @dbi: MIPI DBI struc=
ture<br />+ * @cmd: Array of two command bytes<br />+ *<br />+ * Returns:<b=
r />+ * Zero on success, negative error code on failure.<br />+ */<br />+st=
atic int st7539_dbi_command16(struct mipi_dbi *dbi, const u8 *cmd)<br />+{<=
br />+	u8 *cmdbuf;<br />+	int ret;<br />+<br />+	/* SPI requires dma-safe b=
uffers */<br />+	cmdbuf =3D kmemdup(cmd, 2, GFP_KERNEL);<br />+	if (!cmdbuf=
)<br />+		return -ENOMEM;<br />+<br />+	mutex_lock(&amp;dbi-&gt;cmdlock);<b=
r />+	ret =3D st7539_dbi_command_buf(dbi, cmdbuf, 2, NULL, 0);<br />+	mutex=
_unlock(&amp;dbi-&gt;cmdlock);<br />+<br />+	kfree(cmdbuf);<br />+<br />+	r=
eturn ret;<br />+}<br />+<br />+static int st7539_dbi_typec3_command(struct=
 mipi_dbi *dbi,<br />+				   u8 *cmd, u8 *par, size_t num)<br />+{<br />+	r=
eturn st7539_dbi_command_buf(dbi, cmd, 1, par, num);<br />+}<br />+<br />+/=
*<br />+ * The ST7539 controller packs 8 VERTICAL pixels into one byte<br /=
>+ * (similar as &quot;page_address_mode&quot; for SH1106 in drm/solomon/ss=
d130x.c).<br />+ */<br />+<br />+static void st7539_xrgb8888_to_mono(u8 *ds=
t, struct iosys_map *src,<br />+				       struct drm_framebuffer *fb,<br /=
>+				       struct drm_rect *clip,<br />+				       struct drm_format_conv=
_state *fmtcnv_state)<br />+{<br />+	u8 *buf;<br />+	struct iosys_map dst_m=
ap;<br />+<br />+	unsigned int width =3D drm_rect_width(clip);<br />+	unsig=
ned int height =3D drm_rect_height(clip);<br />+	unsigned int line_length =
=3D DIV_ROUND_UP(width, 8);<br />+	unsigned int page_height =3D 8;<br />+	u=
nsigned int pages =3D DIV_ROUND_UP(height, page_height);<br />+	size_t len =
=3D pages * width;<br />+	u32 array_idx =3D 0;<br />+	int i, j, k;<br />+<b=
r />+	/* intermediate buffer (8 horizontal pixels per byte) */<br />+	buf =
=3D kmalloc(len, GFP_KERNEL);<br />+	if (!buf)<br />+		return;<br />+<br />=
+	iosys_map_set_vaddr(&amp;dst_map, buf);<br />+	drm_fb_xrgb8888_to_mono(&a=
mp;dst_map, NULL, src, fb, clip, fmtcnv_state);<br />+<br />+	/* convert to=
 8 VERTICAL pixels per byte */<br />+	for (i =3D 0; i &lt; pages; i++) {<br=
 />+		for (j =3D 0; j &lt; width; j++) {<br />+			u8 data =3D 0;<br />+<br =
/>+			for (k =3D 0; k &lt; 8; k++) {<br />+				u8 byte =3D buf[(8 * i + k) =
* line_length + j / 8];<br />+				u8 bit =3D !((byte &gt;&gt; (j % 8)) &amp=
; 1);  /* invert pixels */<br />+<br />+				data |=3D bit &lt;&lt; k;<br />=
+			}<br />+			dst[array_idx++] =3D data;<br />+		}<br />+	}<br />+<br />+	=
kfree(buf);<br />+}<br />+<br />+static int st7539_buf_copy(void *dst, stru=
ct iosys_map *src, struct drm_framebuffer *fb,<br />+			   struct drm_rect =
*clip, struct drm_format_conv_state *fmtcnv_state)<br />+{<br />+	int ret;<=
br />+<br />+	ret =3D drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);<br =
/>+	if (ret)<br />+		return ret;<br />+<br />+	st7539_xrgb8888_to_mono(dst,=
 src, fb, clip, fmtcnv_state);<br />+<br />+	drm_gem_fb_end_cpu_access(fb, =
DMA_FROM_DEVICE);<br />+<br />+	return 0;<br />+}<br />+<br />+static void =
st7539_fb_dirty(struct iosys_map *src, struct drm_framebuffer *fb,<br />+		=
	    struct drm_rect *rect, struct drm_format_conv_state *fmtcnv_state)<br =
/>+{<br />+	struct mipi_dbi_dev *dbidev =3D drm_to_mipi_dbi_dev(fb-&gt;dev)=
;<br />+	struct mipi_dbi *dbi =3D &amp;dbidev-&gt;dbi;<br />+	int start, en=
d, ret =3D 0;<br />+<br />+	/* hardware doesn&#39;t support clipping of the=
 column --&gt; send full lines */<br />+	rect-&gt;x1 =3D 0;<br />+	rect-&gt=
;x2 =3D ST7539_HOR_RES;<br />+	/* 8 pixels per byte, so grow clip to neares=
t multiple of 8 */<br />+	rect-&gt;y1 =3D rounddown(rect-&gt;y1, 8);<br />+=
	rect-&gt;y2 =3D roundup(rect-&gt;y2, 8);<br />+<br />+	DRM_DEBUG_KMS(&quot=
;Flushing [FB:%d] &quot; DRM_RECT_FMT &quot;\n&quot;, fb-&gt;base.id, DRM_R=
ECT_ARG(rect));<br />+<br />+	ret =3D st7539_buf_copy(dbidev-&gt;tx_buf, sr=
c, fb, rect, fmtcnv_state);<br />+	if (ret)<br />+		goto err_msg;<br />+<br=
 />+	/* Pixels are packed 8 per byte */<br />+	start =3D rect-&gt;y1 / 8;<b=
r />+	end =3D rect-&gt;y2 / 8;<br />+<br />+	mipi_dbi_command(dbi, ST7539_S=
ET_COLUMN_ADDRESS_LSB(rect-&gt;x1 &amp; 0xFF));<br />+	mipi_dbi_command(dbi=
, ST7539_SET_COLUMN_ADDRESS_MSB((rect-&gt;x1 &gt;&gt; 8) &amp; 0xFF));<br /=
>+<br />+	ret =3D mipi_dbi_command_buf(dbi, ST7539_SET_PAGE_ADDRESS(start),=
<br />+				   (u8 *)dbidev-&gt;tx_buf,<br />+				   (rect-&gt;x2 - rect-&gt=
;x1) * (end - start));<br />+err_msg:<br />+	if (ret)<br />+		dev_err_once(=
fb-&gt;dev-&gt;dev, &quot;Failed to update display %d\n&quot;, ret);<br />+=
}<br />+<br />+static void st7539_pipe_update(struct drm_simple_display_pip=
e *pipe,<br />+			       struct drm_plane_state *old_state)<br />+{<br />+	=
struct drm_plane_state *state =3D pipe-&gt;plane.state;<br />+	struct drm_s=
hadow_plane_state *shadow_plane_state =3D to_drm_shadow_plane_state(state);=
<br />+	struct drm_framebuffer *fb =3D state-&gt;fb;<br />+	struct drm_rect=
 rect;<br />+	int idx;<br />+<br />+	if (!pipe-&gt;crtc.state-&gt;active)<b=
r />+		return;<br />+<br />+	if (!drm_dev_enter(fb-&gt;dev, &amp;idx))<br /=
>+		return;<br />+<br />+	if (drm_atomic_helper_damage_merged(old_state, st=
ate, &amp;rect))<br />+		st7539_fb_dirty(&amp;shadow_plane_state-&gt;data[0=
], fb, &amp;rect,<br />+				&amp;shadow_plane_state-&gt;fmtcnv_state);<br /=
>+<br />+	drm_dev_exit(idx);<br />+}<br />+<br />+static void st7539_pipe_e=
nable(struct drm_simple_display_pipe *pipe,<br />+			       struct drm_crtc=
_state *crtc_state,<br />+			       struct drm_plane_state *plane_state)<br=
 />+{<br />+	struct mipi_dbi_dev *dbidev =3D drm_to_mipi_dbi_dev(pipe-&gt;c=
rtc.dev);<br />+	struct drm_shadow_plane_state *shadow_plane_state =3D to_d=
rm_shadow_plane_state(plane_state);<br />+	struct drm_framebuffer *fb =3D p=
lane_state-&gt;fb;<br />+	struct mipi_dbi *dbi =3D &amp;dbidev-&gt;dbi;<br =
/>+	struct drm_rect rect =3D {<br />+		.x1 =3D 0,<br />+		.x2 =3D fb-&gt;wi=
dth,<br />+		.y1 =3D 0,<br />+		.y2 =3D fb-&gt;height,<br />+	};<br />+	int=
 idx;<br />+<br />+	if (!drm_dev_enter(pipe-&gt;crtc.dev, &amp;idx))<br />+=
		return;<br />+<br />+	DRM_DEBUG_KMS(&quot;\n&quot;);<br />+<br />+	/* Can=
not use mipi_dbi_poweron_reset() here as the ST7539 has a non DCI<br />+	 *=
 opcode for soft reset<br />+	 */<br />+	mipi_dbi_hw_reset(dbi);<br />+<br =
/>+	mipi_dbi_command(dbi, ST7539_SOFT_RESET);<br />+	mipi_dbi_command(dbi, =
ST7539_SET_FPS__76);<br />+	mipi_dbi_command(dbi, ST7539_SET_BIAS__1_9);<br=
 />+	st7539_dbi_command16(dbi, (u8[]){ST7539_SET_CONTRAST, 120});<br />+	mi=
pi_dbi_command(dbi, ST7539_SET_SCAN_Y_INV);  /* ToDo: make this configurabl=
e */<br />+<br />+	st7539_fb_dirty(&amp;shadow_plane_state-&gt;data[0], fb,=
 &amp;rect,<br />+			&amp;shadow_plane_state-&gt;fmtcnv_state);<br />+<br /=
>+	mipi_dbi_command(dbi, ST7539_SET_DISP_ON);<br />+}<br />+<br />+static v=
oid st7539_pipe_disable(struct drm_simple_display_pipe *pipe)<br />+{<br />=
+	struct mipi_dbi_dev *dbidev =3D drm_to_mipi_dbi_dev(pipe-&gt;crtc.dev);<b=
r />+<br />+	/*<br />+	 * This callback is not protected by drm_dev_enter/e=
xit since we want to<br />+	 * turn off the display on regular driver unloa=
d. It&#39;s highly unlikely<br />+	 * that the underlying SPI controller is=
 gone should this be called after<br />+	 * unplug.<br />+	 */<br />+<br />=
+	DRM_DEBUG_KMS(&quot;\n&quot;);<br />+<br />+	mipi_dbi_command(&amp;dbidev=
-&gt;dbi, MIPI_DCS_SET_DISPLAY_OFF);<br />+}<br />+<br />+static const u32 =
st7539_formats[] =3D {<br />+	DRM_FORMAT_XRGB8888,<br />+};<br />+<br />+st=
atic const struct drm_simple_display_pipe_funcs st7539_pipe_funcs =3D {<br =
/>+	.mode_valid	=3D mipi_dbi_pipe_mode_valid,<br />+	.enable		=3D st7539_pi=
pe_enable,<br />+	.disable	=3D st7539_pipe_disable,<br />+	.update		=3D st7=
539_pipe_update,<br />+	.begin_fb_access =3D mipi_dbi_pipe_begin_fb_access,=
<br />+	.end_fb_access	=3D mipi_dbi_pipe_end_fb_access,<br />+	.reset_plane=
	=3D mipi_dbi_pipe_reset_plane,<br />+	.duplicate_plane_state =3D mipi_dbi_=
pipe_duplicate_plane_state,<br />+	.destroy_plane_state =3D mipi_dbi_pipe_d=
estroy_plane_state,<br />+};<br />+<br />+static const struct drm_display_m=
ode st7539_mode =3D {<br />+	DRM_SIMPLE_MODE(ST7539_HOR_RES, ST7539_VER_RES=
, 57, 23),<br />+};<br />+<br />+DEFINE_DRM_GEM_DMA_FOPS(st7539_fops);<br /=
>+<br />+static const struct drm_driver st7539_driver =3D {<br />+	.driver_=
features	=3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,<br />+	.fops			=
=3D &amp;st7539_fops,<br />+	DRM_GEM_DMA_DRIVER_OPS_VMAP,<br />+	.debugfs_i=
nit		=3D mipi_dbi_debugfs_init,<br />+	.name			=3D &quot;st7539&quot;,<br /=
>+	.desc			=3D &quot;Sitronix ST7539&quot;,<br />+	.date			=3D &quot;202406=
24&quot;,<br />+	.major			=3D 1,<br />+	.minor			=3D 0,<br />+};<br />+<br =
/>+static const struct of_device_id st7539_of_match[] =3D {<br />+	{ .compa=
tible =3D &quot;sitronix,st7539&quot; },<br />+	{},<br />+};<br />+MODULE_D=
EVICE_TABLE(of, st7539_of_match);<br />+<br />+static const struct spi_devi=
ce_id st7539_id[] =3D {<br />+	{ &quot;st7539&quot;, 0 },<br />+	{ },<br />=
+};<br />+MODULE_DEVICE_TABLE(spi, st7539_id);<br />+<br />+static int st75=
39_probe(struct spi_device *spi)<br />+{<br />+	struct device *dev =3D &amp=
;spi-&gt;dev;<br />+	struct mipi_dbi_dev *dbidev;<br />+	struct drm_device =
*drm;<br />+	struct mipi_dbi *dbi;<br />+	struct gpio_desc *a0;<br />+	size=
_t bufsize;<br />+	int ret;<br />+<br />+	dbidev =3D devm_drm_dev_alloc(dev=
, &amp;st7539_driver,<br />+				    struct mipi_dbi_dev, drm);<br />+	if (I=
S_ERR(dbidev))<br />+		return PTR_ERR(dbidev);<br />+<br />+	dbi =3D &amp;d=
bidev-&gt;dbi;<br />+	drm =3D &amp;dbidev-&gt;drm;<br />+<br />+	bufsize =
=3D DIV_ROUND_UP(st7539_mode.vdisplay, 8) * st7539_mode.hdisplay;<br />+<br=
 />+	dbi-&gt;reset =3D devm_gpiod_get(dev, &quot;reset&quot;, GPIOD_OUT_HIG=
H);<br />+	if (IS_ERR(dbi-&gt;reset))<br />+		return dev_err_probe(dev, PTR=
_ERR(dbi-&gt;reset), &quot;Failed to get GPIO &#39;reset&#39;\n&quot;);<br =
/>+<br />+	a0 =3D devm_gpiod_get(dev, &quot;a0&quot;, GPIOD_OUT_LOW);<br />=
+	if (IS_ERR(a0))<br />+		return dev_err_probe(dev, PTR_ERR(a0), &quot;Fail=
ed to get GPIO &#39;a0&#39;\n&quot;);<br />+<br />+	ret =3D mipi_dbi_spi_in=
it(spi, dbi, a0);<br />+	if (ret)<br />+		return ret;<br />+<br />+	/* over=
ride the command function set in mipi_dbi_spi_init() */<br />+	dbi-&gt;comm=
and =3D st7539_dbi_typec3_command;<br />+<br />+	/* Cannot read from this c=
ontroller via SPI */<br />+	dbi-&gt;read_commands =3D NULL;<br />+<br />+	r=
et =3D mipi_dbi_dev_init_with_formats(dbidev, &amp;st7539_pipe_funcs,<br />=
+					     st7539_formats, ARRAY_SIZE(st7539_formats),<br />+					     &amp=
;st7539_mode, 0, bufsize);<br />+	if (ret)<br />+		return ret;<br />+<br />=
+	drm_mode_config_reset(drm);<br />+<br />+	ret =3D drm_dev_register(drm, 0=
);<br />+	if (ret)<br />+		return ret;<br />+<br />+	spi_set_drvdata(spi, d=
rm);<br />+<br />+	drm_fbdev_dma_setup(drm, 0);<br />+<br />+	return 0;<br =
/>+}<br />+<br />+static void st7539_remove(struct spi_device *spi)<br />+{=
<br />+	struct drm_device *drm =3D spi_get_drvdata(spi);<br />+<br />+	drm_=
dev_unplug(drm);<br />+	drm_atomic_helper_shutdown(drm);<br />+}<br />+<br =
/>+static void st7539_shutdown(struct spi_device *spi)<br />+{<br />+	drm_a=
tomic_helper_shutdown(spi_get_drvdata(spi));<br />+}<br />+<br />+static st=
ruct spi_driver st7539_spi_driver =3D {<br />+	.driver =3D {<br />+		.name =
=3D &quot;st7539&quot;,<br />+		.of_match_table =3D st7539_of_match,<br />+=
	},<br />+	.id_table =3D st7539_id,<br />+	.probe =3D st7539_probe,<br />+	=
=2Eremove =3D st7539_remove,<br />+	.shutdown =3D st7539_shutdown,<br />+};=
<br />+module_spi_driver(st7539_spi_driver);<br />+<br />+MODULE_DESCRIPTIO=
N(&quot;Sitronix ST7539 DRM driver&quot;);<br />+MODULE_AUTHOR(&quot;Christ=
ian Eggers &lt;ceggers@arri.de&gt;&quot;);<br />+MODULE_LICENSE(&quot;GPL&q=
uot;);<br />-- <br />2.43.0<br /><br /></div><div dir=3D"ltr" style=3D"mso-=
line-height-rule:exactly;-webkit-text-size-adjust:100%;font-size:1px;direct=
ion:ltr;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"=
width:100%;border-collapse:collapse;font-size:1px;"><tr style=3D"font-size:=
0;"><td align=3D"left" style=3D"vertical-align:top;"><table cellpadding=3D"=
0" cellspacing=3D"0" border=3D"0" style=3D"border-collapse:collapse;font-si=
ze:0;"><tr style=3D"font-size:0;"><td align=3D"left" style=3D"padding:0;ver=
tical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" s=
tyle=3D"width:100%;border-collapse:collapse;font-size:0;"><tr style=3D"font=
-size:14.67px;color:#7F7F7F;font-style:normal;font-weight:400;white-space:n=
owrap;"><td align=3D"left" style=3D"vertical-align:top;font-family:Calibri,=
Arial,sans-serif;">_______________________________________________________<=
span style=3D"font-family:remialcxesans;font-size:1px;color:#FFFFFF;line-he=
ight:1px;">&#8203;<span style=3D"font-family:&#39;template-LZ3Cj7wTEei85wAN=
OiIRuQ&#39;;">&#8203;</span><span style=3D"font-family:&#39;zone-1&#39;;">&=
#8203;</span><span style=3D"font-family:&#39;zones-AQ&#39;;">&#8203;</span>=
</span></td></tr><tr style=3D"font-size:0;"><td align=3D"left" style=3D"ver=
tical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" s=
tyle=3D"border-collapse:collapse;font-size:0;"><tr style=3D"font-size:0;"><=
td align=3D"left" style=3D"vertical-align:top;"><table cellpadding=3D"0" ce=
llspacing=3D"0" border=3D"0" style=3D"border-collapse:collapse;font-size:0;=
color:#7F7F7F;font-style:normal;font-weight:400;white-space:nowrap;"><tr st=
yle=3D"font-size:14.67px;"><td align=3D"left" style=3D"vertical-align:top;f=
ont-family:Calibri,Arial,sans-serif;">Christian</td><td align=3D"left" styl=
e=3D"vertical-align:top;color:#000001;font-family:Calibri,Arial,sans-serif;=
">&nbsp;<br /></td><td align=3D"left" style=3D"vertical-align:top;font-fami=
ly:Calibri,Arial,sans-serif;">Eggers</td></tr></table></td></tr><tr style=
=3D"font-size:0;"><td align=3D"left" style=3D"vertical-align:top;"><table c=
ellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"border-collapse:co=
llapse;font-size:0;color:#7F7F7F;font-style:normal;font-weight:400;white-sp=
ace:nowrap;"><tr style=3D"font-size:14.67px;"><td align=3D"left" style=3D"v=
ertical-align:top;font-family:Calibri,Arial,sans-serif;">Software&nbsp;Engi=
neer</td></tr><tr style=3D"font-size:14.67px;color:#000001;"><td align=3D"l=
eft" style=3D"vertical-align:top;font-family:Calibri,Arial,sans-serif;">&#8=
203;</td></tr></table></td></tr></table></td></tr><tr style=3D"font-size:0;=
"><td align=3D"left" style=3D"vertical-align:top;"><table cellpadding=3D"0"=
 cellspacing=3D"0" border=3D"0" style=3D"border-collapse:collapse;font-size=
:0;"><tr style=3D"font-size:0;"><td align=3D"left" style=3D"vertical-align:=
top;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"bord=
er-collapse:collapse;font-size:0;color:#0E50AD;font-style:normal;font-weigh=
t:400;white-space:nowrap;"><tr style=3D"font-size:13.33px;"><td align=3D"le=
ft" style=3D"vertical-align:top;font-family:&#39;Arial Black&#39;;">ARRI</t=
d></tr><tr style=3D"font-size:10.67px;color:#7F7F7F;"><td align=3D"left" st=
yle=3D"vertical-align:top;font-family:Arial;"><span style=3D"font-size:11px=
;">Arnold&nbsp;&amp;&nbsp;Richter&nbsp;Cine&nbsp;Technik&nbsp;GmbH&nbsp;&am=
p;&nbsp;Co.&nbsp;Betriebs&nbsp;KG</span>&nbsp;<br /></td></tr></table></td>=
</tr><tr style=3D"font-size:0;"><td align=3D"left" style=3D"vertical-align:=
top;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"bord=
er-collapse:collapse;font-size:0;color:#7F7F7F;font-style:normal;font-weigh=
t:400;white-space:nowrap;"><tr style=3D"font-size:10.67px;"><td align=3D"le=
ft" style=3D"vertical-align:top;font-family:Arial;">Arriweg&nbsp;17</td><td=
 align=3D"left" style=3D"vertical-align:top;font-family:Arial;">,&nbsp;<br =
/></td><td align=3D"left" style=3D"vertical-align:middle;font-family:Arial;=
">83071</td><td align=3D"left" style=3D"vertical-align:middle;font-family:A=
rial;">&nbsp;<br /></td><td align=3D"left" style=3D"vertical-align:middle;f=
ont-family:Arial;">Stephanskirchen</td></tr></table></td></tr></table></td>=
</tr><tr style=3D"font-size:0;"><td align=3D"left" style=3D"vertical-align:=
top;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"bord=
er-collapse:collapse;font-size:0;"><tr style=3D"font-size:0;"><td align=3D"=
left" style=3D"vertical-align:top;"><table cellpadding=3D"0" cellspacing=
=3D"0" border=3D"0" style=3D"border-collapse:collapse;font-size:0;color:#15=
32B9;font-style:normal;font-weight:400;white-space:nowrap;"><tr style=3D"fo=
nt-size:11px;"><td align=3D"left" style=3D"vertical-align:top;font-family:A=
rial;"><span style=3D"text-decoration:underline;"><a href=3D"http://www.arr=
i.com/" target=3D"_blank" id=3D"LPlnk689713" style=3D"text-decoration:under=
line;color:#1532B9;">www.arri.com&nbsp;<br /><br /></a></span></td></tr><tr=
 style=3D"font-size:0;"><td align=3D"left" style=3D"vertical-align:top;"><t=
able cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"border-colla=
pse:collapse;font-size:0;color:#858080;font-style:normal;font-weight:400;li=
ne-height:normal;white-space:nowrap;"><tr style=3D"font-size:14.67px;"><td =
align=3D"left" style=3D"padding:0;vertical-align:top;font-size:0;"><img src=
=3D"cid:image545061.png@8CABC667.F6307761" width=3D"20" height=3D"20" borde=
r=3D"0" alt=3D"" style=3D"width:20px;min-width:20px;max-width:20px;height:2=
0px;min-height:20px;max-height:20px;font-size:0;" /></td><td align=3D"left"=
 style=3D"padding:0;vertical-align:top;font-family:Calibri,Arial,sans-serif=
;"><a href=3D"tel:+49%208036%203009-3118" target=3D"_blank" id=3D"LPlnk6897=
13" style=3D"text-decoration:none;color:#858080;">+49&nbsp;8036&nbsp;3009-3=
118</a></td></tr><tr style=3D"font-size:0;"><td align=3D"left" style=3D"pad=
ding:0;vertical-align:top;"></td><td align=3D"left" style=3D"padding:0;vert=
ical-align:top;"></td></tr><tr style=3D"font-size:0;"><td align=3D"left" st=
yle=3D"padding:0;vertical-align:top;"></td><td align=3D"left" style=3D"padd=
ing:0;vertical-align:top;"></td></tr><tr style=3D"font-size:14.67px;"><td a=
lign=3D"left" style=3D"padding:0;vertical-align:top;font-size:0;"><img src=
=3D"cid:image795698.png@F828568C.0CB1F771" width=3D"20" height=3D"20" borde=
r=3D"0" alt=3D"" style=3D"width:20px;min-width:20px;max-width:20px;height:2=
0px;min-height:20px;max-height:20px;font-size:0;" /></td><td align=3D"left"=
 style=3D"padding:0;vertical-align:top;font-family:Calibri,Arial,sans-serif=
;"><a href=3D"mailto:CEggers@arri.de" target=3D"_blank" id=3D"LPlnk689713" =
style=3D"text-decoration:none;color:#858080;">CEggers@arri.de</a></td></tr>=
</table></td></tr></table></td></tr></table></td></tr><tr style=3D"font-siz=
e:14.67px;color:#000001;font-style:normal;font-weight:400;white-space:nowra=
p;"><td align=3D"left" style=3D"vertical-align:top;font-family:Calibri,Aria=
l,sans-serif;"><br />&#8203;</td></tr></table></td></tr><tr style=3D"font-s=
ize:0;line-height:normal;"><td align=3D"left" style=3D"padding:0;vertical-a=
lign:top;"><a href=3D"https://www.arri.com/en/camera-systems/electronic-con=
trol-system/hi-5-sx" target=3D"_blank" id=3D"LPlnk689713" style=3D"text-dec=
oration:none;"><img src=3D"cid:image816352.jpg@64939F8E.C20747B8" width=3D"=
650" height=3D"95" border=3D"0" title=3D"Hi-5 SX" alt=3D"Hi-5 SX" style=3D"=
width:650px;min-width:650px;max-width:650px;height:95px;min-height:95px;max=
-height:95px;font-size:12px;" /></a></td></tr><tr style=3D"font-size:14.67p=
x;color:#000001;font-style:normal;font-weight:400;white-space:nowrap;"><td =
align=3D"left" style=3D"padding:0;vertical-align:top;font-family:Calibri,Ar=
ial,sans-serif;"><br /></td></tr><tr style=3D"font-size:0;"><td align=3D"le=
ft" style=3D"padding:0;vertical-align:top;"><table cellpadding=3D"0" cellsp=
acing=3D"0" border=3D"0" style=3D"border-collapse:collapse;font-size:0;colo=
r:#6A6A6A;font-style:normal;font-weight:400;white-space:nowrap;"><tr style=
=3D"font-size:10px;"><td align=3D"left" style=3D"vertical-align:top;font-fa=
mily:Arial;">Arnold&nbsp;&amp;&nbsp;Richter&nbsp;Cine&nbsp;Technik&nbsp;Gmb=
H&nbsp;&amp;&nbsp;Co.&nbsp;Betriebs&nbsp;KG<br />Sitz:&nbsp;M&#252;nchen&nb=
sp;=E2=80=91&nbsp;Registergericht:&nbsp;Amtsgericht&nbsp;M&#252;nchen&nbsp;=
=E2=80=91&nbsp;Handelsregisternummer:&nbsp;HRA&nbsp;57918<br />Pers&#246;nl=
ich&nbsp;haftender&nbsp;Gesellschafter:&nbsp;Arnold&nbsp;&amp;&nbsp;Richter=
&nbsp;Cine&nbsp;Technik&nbsp;GmbH<br />Sitz:&nbsp;M&#252;nchen&nbsp;=E2=80=
=91&nbsp;Registergericht:&nbsp;Amtsgericht&nbsp;M&#252;nchen&nbsp;=E2=80=
=91&nbsp;Handelsregisternummer:&nbsp;HRB&nbsp;54477<br />Gesch&#228;ftsf&#2=
52;hrer:&nbsp;Dr.&nbsp;Matthias&nbsp;Erb&nbsp;(Chairman);&nbsp;Walter&nbsp;=
Trauninger<br /></td></tr><tr style=3D"font-size:14.67px;color:#000001;"><t=
d align=3D"left" style=3D"vertical-align:top;font-family:Calibri,Arial,sans=
-serif;"><br />&#8203;<br /></td></tr></table></td></tr></table></td></tr><=
/table></div></body></html>
------_=_NextPart_7f9b811e-48ef-4552-8611-14319a450862--

------_=_NextPart_4996921f-6d18-4a08-88ed-e02c2429e54f
Content-Type: image/png;
	name="image545061.png"
Content-Transfer-Encoding: base64
Content-ID: <image545061.png@8CABC667.F6307761>
Content-Description: image545061.png
Content-Disposition: inline;
	creation-date="Wed, 03 Jul 2024 14:05:35 +0000";
	filename=image545061.png;
	modification-date="Wed, 03 Jul 2024 14:05:35 +0000";
	size=528

iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAGlSURBVDhP1ZOxSgNBEIZ3o6QSSWGRwiJFCl9A
iCDEIqKFgo2FYGHjA1hYRZ0sGrURgq0WgkoqEUHQShJMYWFhmcLCwsIHsJBEs/5zmTvvJIE9sPGD
Zf7Zu/tvdndW/TVaogcRDSWVKlilMhvGVGQ6FoEhzAaTWt9AFji31q7C9Jh1HBISFSpbQPDMGK31
NlcsqTOBIRxmRPmkUTGJdubHUKmsxDA5ic6EDV8k+jRa1i6KdiYw/LL2QiTzDrNpY8yb5M4EhlvG
XKNdniXl9pkTHYvwkrlXDkTxIR3tEWUkcyZi2FbqBOGxm6lUR+tT7k/JnYgYYs8+sHfzkP7eTaJ1
LmGaktyjTDSGsSxphMjV89khyqGx7yG96rC3r7g5S5vGNHaJsrb7LI3RwPw6btQDv8f0NGRwTWYT
Wlch/eo+Mc5gPoWPfu9tpVgqrbGIHkoIVHOLQ5qAQVOmuNqVHma8guDK9jVkisY029aOQ/JhcYU9
wbLPRaoBiX2p1+utu1rtqpDPV9FKHVQziiqH5fETzMr40yHe68hcfPaJRnHyI5L+K5T6BsZ9gKi6
xb3hAAAAAElFTkSuQmCC

------_=_NextPart_4996921f-6d18-4a08-88ed-e02c2429e54f
Content-Type: image/png;
	name="image795698.png"
Content-Transfer-Encoding: base64
Content-ID: <image795698.png@F828568C.0CB1F771>
Content-Description: image795698.png
Content-Disposition: inline;
	creation-date="Wed, 03 Jul 2024 14:05:35 +0000";
	filename=image795698.png;
	modification-date="Wed, 03 Jul 2024 14:05:35 +0000";
	size=824

iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAALNSURBVDhPtZQ/SNVRFMfv1Z/S4PCGBoeg1Uih
oaFB8j1wMGgweBJBgUNRUQ2BQaH2e79SaKipwcGhlkioQEiooT++7RUOBkYODg0GgiIOLyi1bp/v
/d3fL8U31hfuO/ec3z3nfM895z7zr2GDbIg4jgutxvQ6Yw5IRy5uGzOfJMmKP9AADQMSaH+LtQ/5
WEaNUutfEHj5t3OXbyfJTDDl2BNwPI7LxtoJthFOD5A1WM0hf7QY04FDB98vohdZjzeduwbjOnuP
piA9QrBnMJjl4KHRJBmD3hJlF5HdW8Z8HU6SqeFKpeScu4BLmUoepd4pcoYqs9XaLwo2UqkMoEfo
YjrIysreNs6dI+kk515b516wf4ptgETPdSBnqDtDRFuUIJ1g0s/jOE3pJ7TQZ30AY9pg4tmyn8E2
AYE29mlmdVMNwInrSFbG4vgq5kvY7lHeLZ0ROFcj0SrbCFYfZNM9N1n7XveLOucZajQQCl6TTsYr
MFv66dyo1wNItoFQg4QF/dAwL0GnfnxAnP2cqZu6S3WSD1MEwLQbnFVpdcpdlM6ZNcSatfaw9Cyg
2Ml5G7bd3ubcJ8md0D2RTEzmU0uOPLEPyM8yIiLqEYIXZMtY7wTJhsI2K1tJ2hHtEPgs3QfcVPdS
HGP5UijhtGSGO3F8EuOw9pmzGNOkSbYbkHkjGxWkGK9UXsGqk7Hp4tBLTN3oU2RcQvahH0VO49DP
XgxF4iyr8Is5zJ6hZyg08TY5XCDY3WbnzgTnMnKEz5FeBgN/ijG5gW1fSKLh7tr5pnOGguaPUjXQ
93l6GhlddlsYl13gmfZzVTXNbTB5NAfp8a5a/Vjq6flO0JsM6yD3sspaf1utruu77qy3WDzeWyo9
4T6HKO8bPunsBuximIHs+kfRo1eThA1KrHM46/w8pV/nzyNrZo6GATNwBRqjPtgeRK2H7i6MJEk+
Nv8ZxvwBPgIhrepF7fMAAAAASUVORK5CYII=

------_=_NextPart_4996921f-6d18-4a08-88ed-e02c2429e54f
Content-Type: image/jpeg;
	name="image816352.jpg"
Content-Transfer-Encoding: base64
Content-ID: <image816352.jpg@64939F8E.C20747B8>
Content-Description: image816352.jpg
Content-Disposition: inline;
	creation-date="Wed, 03 Jul 2024 14:05:35 +0000";
	filename=image816352.jpg;
	modification-date="Wed, 03 Jul 2024 14:05:35 +0000";
	size=85660

/9j/4QEWRXhpZgAATU0AKgAAAAgACAEGAAMAAAABAAIAAAESAAMAAAABAAEAAAEaAAUAAAABAAAA
bgEbAAUAAAABAAAAdgEoAAMAAAABAAIAAAEyAAIAAAAUAAAAfgITAAMAAAABAAEAAIdpAAQAAAAB
AAAAkgAAAAAAAABIAAAAAQAAAEgAAAABMjAyNDowNjowNiAxMTo0NTozMwAACJAAAAcAAAAEMDIz
MZAEAAIAAAAUAAAA+JEBAAcAAAAEAQIDAKAAAAcAAAAEMDEwMKABAAMAAAABAAEAAKACAAQAAAAB
AAAFFKADAAQAAAABAAAAvqQGAAMAAAABAAAAAAAAAAAyMDIzOjA0OjA2IDA4OjU4OjQzAAAA/+0A
ZFBob3Rvc2hvcCAzLjAAOEJJTQQEAAAAAAAsHAFaAAMbJUccAgAAAgACHAI+AAgyMDIzMDQwNhwC
PwALMDg1ODQzKzAyMDA4QklNBCUAAAAAABCr1tpfxKm4VVA1+MnudVH5/9sAhAABAQEBAQECAQEC
AgICAgIDAgICAgMEAwMDAwMEBAQEBAQEBAQEBAQEBAQEBQUFBQUFBgYGBgYHBwcHBwcHBwcHAQEB
AQICAgMCAgMHBQQFBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcH
BwcHBwf/3QAEAFL/wAARCAC+BRQDASIAAhEBAxEB/8QBogAAAQUBAQEBAQEAAAAAAAAAAAECAwQF
BgcICQoLEAACAQMDAgQDBQUEBAAAAX0BAgMABBEFEiExQQYTUWEHInEUMoGRoQgjQrHBFVLR8CQz
YnKCCQoWFxgZGiUmJygpKjQ1Njc4OTpDREVGR0hJSlNUVVZXWFlaY2RlZmdoaWpzdHV2d3h5eoOE
hYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4eLj5OXm
5+jp6vHy8/T19vf4+foBAAMBAQEBAQEBAQEAAAAAAAABAgMEBQYHCAkKCxEAAgECBAQDBAcFBAQA
AQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2
Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOk
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

------_=_NextPart_4996921f-6d18-4a08-88ed-e02c2429e54f--
