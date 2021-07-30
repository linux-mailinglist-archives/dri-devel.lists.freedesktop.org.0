Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AD53DBFEF
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 22:41:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFFB06F4A1;
	Fri, 30 Jul 2021 20:41:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2071.outbound.protection.outlook.com [40.107.220.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E4416F4A1;
 Fri, 30 Jul 2021 20:41:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G7UgbCEm+qC4AfB/IpU3E6MuxlfVfX9J6unjC9WvjcJlQDJGteCySbz90a6i2tE9Hcx8a+9V5D5Qq29ASeptw9f5mEgoigyjXTE+zgwZr5oX38sUTVlOpkFPS3L5valWSkYmps+BNWx+ov8hHKKG0SjgH1wIESeP313tbKiovMAO49chNgIjkWS++2I4SpnjlfctKDXS/qAtiElA7MHzaoXfjo6Asl7k+nrACO0m4b9glhqB7zeogE+SCBbrppzm+5ujU0Xtzmug3TLzyKjYjnfRiOSVooSWGQjd3FtNwPQcAv0FPdahHqfpsdGK/+QAwyJ34Uy/bUueS4fqeNhi0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jCZM+Ts3lWnIYEoH2ejPy2joEe7/6ZCKGb6WiZT7hTA=;
 b=nvAfjAQEI3jhe8yLBs6mDtNkKphG2I/c/EHK53Si7fSgKJZQL4l5gSUmGh2o13gl36MFYfHW28zZiSfCQViovIou32z+zynm/nLX72m4X6M3nQ5cWRca3rJYNcpM304xDymPyWzdfLeM6a3IqMd5++Uy/OHud2zwpBHcBWdNAEviZb39P4sJ/mXP020ZTLNrGwVK1aHdntSoAA/CS+eWuGZkUpDIAsQeFQFjdsf2kV3hUThlTJNGfuxBZPp5TWI0/v7KT7Qk9My8ZMDr1qe5jrjhjGLcxuWYEv+ktXOg8jZJtsSfYxyiaIXm1u0nApGzdbeix9pxeH7KPRktbkBuNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jCZM+Ts3lWnIYEoH2ejPy2joEe7/6ZCKGb6WiZT7hTA=;
 b=IYe//c+kKi/rtBjokUXFfFyFS1T/qi2UhVvXEAIQM1ZnqXkQQQl/R76OjkRTbuAbks8T6x/uyW+BMgmTy4+thMtT6e6wlim6hdfwQnL/Mv7qF6ovqMFvsJWZOvnBoZkbMAe6IyKkfbIEutGEf8jnrjdKgEb2DLdU8g98+83NyHM=
Received: from MW4PR03CA0032.namprd03.prod.outlook.com (2603:10b6:303:8e::7)
 by BYAPR12MB3624.namprd12.prod.outlook.com (2603:10b6:a03:aa::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.22; Fri, 30 Jul
 2021 20:41:41 +0000
Received: from CO1NAM11FT035.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8e:cafe::15) by MW4PR03CA0032.outlook.office365.com
 (2603:10b6:303:8e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.22 via Frontend
 Transport; Fri, 30 Jul 2021 20:41:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT035.mail.protection.outlook.com (10.13.175.36) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4373.18 via Frontend Transport; Fri, 30 Jul 2021 20:41:40 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Fri, 30 Jul
 2021 15:41:39 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Fri, 30 Jul
 2021 13:41:39 -0700
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.12 via Frontend
 Transport; Fri, 30 Jul 2021 15:41:38 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <ppaalanen@gmail.com>, <sebastian@sebastianwick.net>, <mcasas@google.com>,
 <jshargo@google.com>, <Shashank.Sharma@amd.com>
CC: <Deepak.Sharma@amd.com>, <Shirish.S@amd.com>, <Vitaly.Prosyak@amd.com>,
 <aric.cyr@amd.com>, <Bhawanpreet.Lakha@amd.com>, <Krunoslav.Kovac@amd.com>,
 <hersenxs.wu@amd.com>, <Nicholas.Kazlauskas@amd.com>,
 <laurentiu.palcu@oss.nxp.com>, <ville.syrjala@linux.intel.com>, "Harry
 Wentland" <harry.wentland@amd.com>
Subject: [RFC PATCH v3 1/6] drm/doc: Color Management and HDR10 RFC
Date: Fri, 30 Jul 2021 16:41:29 -0400
Message-ID: <20210730204134.21769-2-harry.wentland@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210730204134.21769-1-harry.wentland@amd.com>
References: <20210730204134.21769-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06ce0f2c-12d9-4532-ec2a-08d9539a6f89
X-MS-TrafficTypeDiagnostic: BYAPR12MB3624:
X-Microsoft-Antispam-PRVS: <BYAPR12MB36244CC2BF0CC1BFAD07C4E18CEC9@BYAPR12MB3624.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g4NV6P1o9dtQa5He8uJliNIF0kFxTymy/piI8wpIIEdRLRI6BZT6lWLbER7GyjacJ/G7zrCCKVW4R4TEBnuTIp8htnLGBvjZbPkBrG+fCLnCeKQfYXn8+xAhjN2euxghNEc2FmqcoSqNcK8O7kmxmaWS2B/0kxsrds1XoZUbur6CQcZJjM7e8sQPuqPvpA9GC6p0FgqSQenPxhIrrnB7k2lLr78WDLqzu64pxOoqnyVHew4e72Eh/esJd47C0VCmiC1Km9yWA0v+yBAAxcUEIPO8WtmEiE01WRu33d+BZvO6jWG2/ueccGzsJev3arDYllf/YWK/brmIPBR8NrUzWXHYGSlxEFcUQKC6xjBwccGb4kPSwNOMcygn3Wo316ANZdSJqJlUEasBnT+EmqpnD4oIkufhSY2ZEg7Z+kY6FCj/N+oThcFqkEOCJIunJwCgAbrKN0Vn/BB/fYvLtPAlTpMVqhx+UqY+bP8vSNhL9W0FdHDfZPeuw5WFw+WaliXs9QWOBH9HCRdIhMirdI7BzSxN9B/coDhYY3PgN/vF5VTHI7AI/tEYk9yZjEHu3AsXHaWswm/72KggYkhkEU7P+xHOUz957Y/viyVIWdfAU68ozXkvFB1VITD5xE9brsO2EhW2JQWwZRbKm9dKD1y3YTn9lxNXiigO83RhrTU432y7+KWgA/6z9XT70YbrLmcvI3dGrUGGeypRbDUP/pUC203x4YglGFydXs2nIAJu5NqdGu1Te3QBhIn7+H7WjFxNqy2uPO7Sml/a52T2zuRDomT9I5VhXJJ38JaM8qfp9pWaF9LS5PViPIZgGaMoqo2xBP6zxsDtaSS4wSCYYQZQpzqPucfBkPk50Hai0xNBBd8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(376002)(346002)(396003)(36840700001)(46966006)(1076003)(336012)(70206006)(19627235002)(30864003)(966005)(5660300002)(2616005)(47076005)(8676002)(478600001)(2906002)(36756003)(83380400001)(7696005)(166002)(4326008)(6666004)(6636002)(8936002)(26005)(316002)(426003)(86362001)(54906003)(44832011)(82740400003)(186003)(70586007)(356005)(82310400003)(36860700001)(110136005)(81166007)(36900700001)(579004)(559001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2021 20:41:40.9375 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06ce0f2c-12d9-4532-ec2a-08d9539a6f89
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT035.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3624
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

Use the new DRM RFC doc section to capture the RFC previously only
described in the cover letter at
https://patchwork.freedesktop.org/series/89506/

v3:
 * Add sections on single-plane and multi-plane HDR
 * Describe approach to define HW details vs approach to define SW intentio=
ns
 * Link Jeremy Cline's excellent HDR summaries
 * Outline intention behind overly verbose doc
 * Describe FP16 use-case
 * Clean up links

v2: create this doc

v1: n/a

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 Documentation/gpu/rfc/color_intentions.drawio |   1 +
 Documentation/gpu/rfc/color_intentions.svg    |   3 +
 Documentation/gpu/rfc/colorpipe               |   1 +
 Documentation/gpu/rfc/colorpipe.svg           |   3 +
 Documentation/gpu/rfc/hdr-wide-gamut.rst      | 580 ++++++++++++++++++
 Documentation/gpu/rfc/index.rst               |   1 +
 6 files changed, 589 insertions(+)
 create mode 100644 Documentation/gpu/rfc/color_intentions.drawio
 create mode 100644 Documentation/gpu/rfc/color_intentions.svg
 create mode 100644 Documentation/gpu/rfc/colorpipe
 create mode 100644 Documentation/gpu/rfc/colorpipe.svg
 create mode 100644 Documentation/gpu/rfc/hdr-wide-gamut.rst

diff --git a/Documentation/gpu/rfc/color_intentions.drawio b/Documentation/=
gpu/rfc/color_intentions.drawio
new file mode 100644
index 000000000000..d62f3b24e1ec
--- /dev/null
+++ b/Documentation/gpu/rfc/color_intentions.drawio
@@ -0,0 +1 @@
+<mxfile host=3D"Electron" modified=3D"2021-07-27T17:06:00.446Z" agent=3D"5=
.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) draw.io/14.6.=
13 Chrome/91.0.4472.124 Electron/13.1.7 Safari/537.36" etag=3D"5FhBvRxDzJPI=
4Jsj_73y" version=3D"14.6.13" type=3D"device"><diagram id=3D"5iAH_SKWfpT4d7=
aif5q5" name=3D"Page-1">7VhJl9owDP41OTIvC2E5DjDQvravtMybGY6GmMR9Tpw6Dkt/fZX=
EWUwgw1CWSy8QfbZkWfokBTRr6G8nHIXeN+Zgqpm6s9WskWaatt2HzwTYZYBhtK0McTlxJFYCM/=
IHS1CXaEwcHCkbBWNUkFAFlywI8FIoGOKcbdRtK0bVU0Pk4howWyJaR1+JI7z8GrpeLnzCxPXk0=
T1bLvgo3yyByEMO21Qg60mzhpwxkT352yGmSfDyuGR64yOrhWMcB+IUhcfJ5y/0ZUKC53AxfYnm=
r31j1TJkNtaIxvLG0luxy0OAHYiIFAMWwNeAszhwcGJYB4lx4TGXBYh+ZSwE0ADwFxZiJ/OJYsE=
A8oRP5Sr4zHdvif4DxCwH5gC09Ae9REZbeUYm7arSFHPiY4G5BDPHE2+PRkhCEYv5EjeFRTINcR=
eLhn3dIo9QAJiBN3wHehxTJMha9QNJJrrFvkJ1ygh4aOqyavqSMXnN5AzKLWRuSaUy4/BQ8aKEU=
h58hBMHKNGhEIaBQ9YKNTq/44S9A4G3ooUocQPNekyKEQIOaSnW4cmV36mdKERBjo058vEiXq1S=
BZptG1d3VODUARU9AMV0H6GkyYWfk0Hv/bPrNpqtRmD2HKsA1i+wf/e9ElXrceMRgWchSim+gb6=
s1p5M1IjiVWlsjTlksblw6kSXCm2VsLm4qTTMvF961V6pH68MhdQfZbDVvk0T2xKR9TBbSvPKSt=
m6EiHvXBdsUtdpPoatJrOWpSt3n26t+wwoDhwSuP/G+svT3OjVeV5M+yrPO9fiudG7+/Tudrv70=
9vu3Ht69+86vot313vN736NFQeG7IKfNjZPGPfpIKkN+6mexOGd8Xm+9R/Xsz14NnWz2fe9IX3n=
xmR0zhvABXj5CWzXODgiUUhR4vX3WISxuBkR4T3sPxNvxUT9yNvDNagIYvnzOeue5Z8Q1tNf</d=
iagram></mxfile>
\ No newline at end of file
diff --git a/Documentation/gpu/rfc/color_intentions.svg b/Documentation/gpu=
/rfc/color_intentions.svg
new file mode 100644
index 000000000000..2f6b5f5813a3
--- /dev/null
+++ b/Documentation/gpu/rfc/color_intentions.svg
@@ -0,0 +1,3 @@
+<?xml version=3D"1.0" encoding=3D"UTF-8"?>
+<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics=
/SVG/1.1/DTD/svg11.dtd">
+<svg xmlns=3D"http://www.w3.org/2000/svg" xmlns:xlink=3D"http://www.w3.org=
/1999/xlink" version=3D"1.1" width=3D"242px" height=3D"362px" viewBox=3D"-0=
.5 -0.5 242 362" content=3D"&lt;mxfile host=3D&quot;Electron&quot; modified=
=3D&quot;2021-07-27T15:46:56.623Z&quot; agent=3D&quot;5.0 (X11; Linux x86_6=
4) AppleWebKit/537.36 (KHTML, like Gecko) draw.io/14.6.13 Chrome/91.0.4472.=
124 Electron/13.1.7 Safari/537.36&quot; etag=3D&quot;yRHplrf8g5DRVJVrDlPI&q=
uot; version=3D&quot;14.6.13&quot; type=3D&quot;device&quot;&gt;&lt;diagram=
 id=3D&quot;5iAH_SKWfpT4d7aif5q5&quot; name=3D&quot;Page-1&quot;&gt;7Vhbl5o=
wEP41PLqHy+LlcdXV9rQ9td09u+tjlAjpCYSGoNhf3wHCJaKsa7289EWYL5nJMPPNDKhZIz+Zch=
R635iDqWbqTqJZY800bXsAvymwzYG+ZeeAy4mTQ0YFPJE/WIK6RGPi4EjZKBijgoQquGRBgJdCw=
RDnbKNuWzGqnhoiFzeApyWiTfSVOMKTqKHr1cInTFxPHt235YKPis0SiDzksE0Nsh41a8QZE/md=
n4wwTWNXxCXXmxxYLR3jOBDHKDxMP3+hL1MSPIeL2Us0fx0Yq45h5WbWiMbyiaW3YluEADsQESk=
GLIDLkLM4cHBqWAeJceExlwWIfmUsBNAA8BcWYivziWLBAPKET+Uq+My3b6n+HcSsAOYAdPQ7vU=
LGiTwjl7Z1aYY58bHAXIK546m3ByMkoYjFfInbwiKZhriLRcu+XplH4D9m4A3fgh7HFAmyVv1Ak=
oluua9UnTECHpq6LJqBZIwsGaNgUGEhd0sqVRmHm5oXFZTx4COc2EOJLoUwDB2yVqjR/R2n7B0K=
nIgOosQNNOshLUYIOKSlXIc7V14zO1GIggKbcOTjRbxaZQo03zap76jBmQMqugeK6S5CSZsLP6f=
D/vtnN220W43A7ClWAWw+wO6z75SoWo8bjwj8FKKM4htoy2rtyUSNKV5VxtaYQxbbC6dJdKlwrx=
K2EDe1hln0S6/eK/XDlaGQ+qMMtu6v08QSIvIeZktpXlupWlcqFJ3rjE3qMs3HsNVkNrJ04e7Ta=
3SfIcWBQwL331h/fpob/SbPy2lf53n3Ujw3+jef3r1eb3d6291bT+/BTcd3+e56q/k9aLBiz5Bd=
8OPG5hHjPhskjWE/09M4vDM+T7f+43K2h8+mbrb7vjOkb9yYjO5pA7gEzz+B7QYHxyQKKUq9/h6=
LMBZXIyK8h/1n4rWYqB94e7gEFUGsPp/z7ln9B2E9/gU=3D&lt;/diagram&gt;&lt;/mxfile&=
gt;" style=3D"background-color: rgb(255, 255, 255);"><defs/><g><path d=3D"M=
 58.07 88 L 58.15 139.95" fill=3D"none" stroke=3D"#000000" stroke-miterlimi=
t=3D"10" pointer-events=3D"stroke"/><path d=3D"M 58.16 145.2 L 54.65 138.21=
 L 58.15 139.95 L 61.65 138.2 Z" fill=3D"#000000" stroke=3D"#000000" stroke=
-miterlimit=3D"10" pointer-events=3D"all"/><rect x=3D"8" y=3D"8" width=3D"1=
00" height=3D"80" fill=3D"#ffffff" stroke=3D"#000000" pointer-events=3D"all=
"/><g transform=3D"translate(-0.5 -0.5)"><switch><foreignObject style=3D"ov=
erflow: visible; text-align: left;" pointer-events=3D"none" width=3D"100%" =
height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Exte=
nsibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: fl=
ex; align-items: unsafe center; justify-content: unsafe flex-start; width: =
98px; height: 1px; padding-top: 48px; margin-left: 10px;"><div style=3D"box=
-sizing: border-box; font-size: 0; text-align: left; "><div style=3D"displa=
y: inline-block; font-size: 12px; font-family: Helvetica; color: #000000; l=
ine-height: 1.2; pointer-events: all; white-space: normal; word-wrap: norma=
l; "><div style=3D"text-align: center"><span>Framebuffer</span></div><div><=
ul><li><span>RGB8</span></li><li><span>sRGB</span></li></ul></div></div></d=
iv></div></foreignObject><text x=3D"10" y=3D"52" fill=3D"#000000" font-fami=
ly=3D"Helvetica" font-size=3D"12px">Framebuffer...</text></switch></g><path=
 d=3D"M 118 208 L 118 241.63" fill=3D"none" stroke=3D"#000000" stroke-miter=
limit=3D"10" pointer-events=3D"stroke"/><path d=3D"M 118 246.88 L 114.5 239=
.88 L 118 241.63 L 121.5 239.88 Z" fill=3D"#000000" stroke=3D"#000000" stro=
ke-miterlimit=3D"10" pointer-events=3D"all"/><rect x=3D"8" y=3D"148" width=
=3D"220" height=3D"60" fill=3D"#ffffff" stroke=3D"#000000" pointer-events=
=3D"all"/><g transform=3D"translate(-0.5 -0.5)"><switch><foreignObject styl=
e=3D"overflow: visible; text-align: left;" pointer-events=3D"none" width=3D=
"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/featu=
re#Extensibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"disp=
lay: flex; align-items: unsafe center; justify-content: unsafe center; widt=
h: 218px; height: 1px; padding-top: 178px; margin-left: 9px;"><div style=3D=
"box-sizing: border-box; font-size: 0; text-align: center; "><div style=3D"=
display: inline-block; font-size: 12px; font-family: Helvetica; color: #000=
000; line-height: 1.2; pointer-events: all; white-space: normal; word-wrap:=
 normal; ">Blending</div></div></div></foreignObject><text x=3D"118" y=3D"1=
82" fill=3D"#000000" font-family=3D"Helvetica" font-size=3D"12px" text-anch=
or=3D"middle">Blending</text></switch></g><path d=3D"M 178.54 108 L 178.87 =
138.27" fill=3D"none" stroke=3D"#000000" stroke-miterlimit=3D"10" pointer-e=
vents=3D"stroke"/><path d=3D"M 178.93 143.52 L 175.35 136.56 L 178.87 138.2=
7 L 182.35 136.48 Z" fill=3D"#000000" stroke=3D"#000000" stroke-miterlimit=
=3D"10" pointer-events=3D"all"/><rect x=3D"128" y=3D"8" width=3D"100" heigh=
t=3D"100" fill=3D"#ffffff" stroke=3D"#000000" pointer-events=3D"all"/><g tr=
ansform=3D"translate(-0.5 -0.5)"><switch><foreignObject style=3D"overflow: =
visible; text-align: left;" pointer-events=3D"none" width=3D"100%" height=
=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibil=
ity"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; al=
ign-items: unsafe center; justify-content: unsafe center; width: 98px; heig=
ht: 1px; padding-top: 58px; margin-left: 129px;"><div style=3D"box-sizing: =
border-box; font-size: 0; text-align: center; "><div style=3D"display: inli=
ne-block; font-size: 12px; font-family: Helvetica; color: #000000; line-hei=
ght: 1.2; pointer-events: all; white-space: normal; word-wrap: normal; ">Fr=
amebuffer<br /><ul><li style=3D"text-align: left">P010</li><li style=3D"tex=
t-align: left">PQ</li><li style=3D"text-align: left">BT2020</li></ul></div>=
</div></div></foreignObject><text x=3D"178" y=3D"62" fill=3D"#000000" font-=
family=3D"Helvetica" font-size=3D"12px" text-anchor=3D"middle">Framebuffer.=
..</text></switch></g><rect x=3D"68" y=3D"248" width=3D"100" height=3D"100"=
 fill=3D"#ffffff" stroke=3D"#000000" pointer-events=3D"all"/><g transform=
=3D"translate(-0.5 -0.5)"><switch><foreignObject style=3D"overflow: visible=
; text-align: left;" pointer-events=3D"none" width=3D"100%" height=3D"100%"=
 requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><div=
 xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-items=
: unsafe center; justify-content: unsafe center; width: 98px; height: 1px; =
padding-top: 298px; margin-left: 69px;"><div style=3D"box-sizing: border-bo=
x; font-size: 0; text-align: center; "><div style=3D"display: inline-block;=
 font-size: 12px; font-family: Helvetica; color: #000000; line-height: 1.2;=
 pointer-events: all; white-space: normal; word-wrap: normal; ">Display Out=
put<br /><ul><li style=3D"text-align: left">RGB10</li><li style=3D"text-ali=
gn: left">PQ</li><li style=3D"text-align: left">BT2020</li></ul></div></div=
></div></foreignObject><text x=3D"118" y=3D"302" fill=3D"#000000" font-fami=
ly=3D"Helvetica" font-size=3D"12px" text-anchor=3D"middle">Display Output..=
.</text></switch></g></g><switch><g requiredFeatures=3D"http://www.w3.org/T=
R/SVG11/feature#Extensibility"/><a transform=3D"translate(0,-5)" xlink:href=
=3D"https://www.diagrams.net/doc/faq/svg-export-text-problems" target=3D"_b=
lank"><text text-anchor=3D"middle" font-size=3D"10px" x=3D"50%" y=3D"100%">=
Viewer does not support full SVG 1.1</text></a></switch></svg>
\ No newline at end of file
diff --git a/Documentation/gpu/rfc/colorpipe b/Documentation/gpu/rfc/colorp=
ipe
new file mode 100644
index 000000000000..2d12490eddec
--- /dev/null
+++ b/Documentation/gpu/rfc/colorpipe
@@ -0,0 +1 @@
+<mxfile host=3D"Electron" modified=3D"2021-07-27T14:17:36.119Z" agent=3D"5=
.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) draw.io/14.6.=
13 Chrome/91.0.4472.124 Electron/13.1.7 Safari/537.36" etag=3D"Gs2TTWVtoGmk=
a55_Cxxx" version=3D"14.6.13" type=3D"device"><diagram id=3D"5iAH_SKWfpT4d7=
aif5q5" name=3D"Page-1">7ZpdU+IwFIZ/DTPuhUyb9AMuFZXdWZ1xBtTlMtLQdqdtOiEI7K/=
f1Cb9ICrdUUkclgtoTptwes7zpsmBHhylmzFFeXRDApz0gBVsevCiB4DrDvl7YdiWhgF0S0NI46=
A02bVhEv/BwmgJ6yoO8LJ1ISMkYXHeNs5JluE5a9kQpWTdvmxBkva35ijEimEyR4lqfYgDFgmrb=
Vn1ie84DiPx1QNXnEiRvFgYlhEKyLphgpc9OKKEsPIo3YxwUsROxqXsd/XK2coxijPWpcPZ+MfP=
5H4cZ9P88fZ+OXsY2otTG5bDPKFkJe5YeMu2MgQ44BERzYxk/OOcklUW4GJgi7cIZREJSYaSa0J=
ybrS58TdmbCvyiVaMcFPE0kSc5T7T7a+if9+VzZkY7rlxsWm1tqJVOld49GoUhGlJVnSO37p1QR=
OiIWZvXAeqXHHGMUkx94f3ozhBLH5q+4EEbWF1XZ0QfiBy8i/5UdJzRVGKH1eLBaZKptppWUcxw=
5McPUdhzdXZToEYGVOGN28HU7152UGyLcRtO6K9bkhFKiVqqESK5OPj5R4tz6Ajz45OnoGSngCf=
zu7uywmTxhvjmK7m731MO5/GtHO0TDsdmXZ1Mq2m54RDPUZpir71gJdwx88f+WTthcXR9d3UPMa=
H2hn3DoP0JmYNonlr1jhT81w0tk249crA7SgDT6cM1CfvaHrTK0i74u+jycg47KGnHXv/K2DPA9=
ACv2/Zzh74n1u3mMY8Tnyh+uGK8DoqwtepCE9RxJQnNEV5HmehcWpw5M5cmxqg8xXUoOsh4HdEH=
lovp/0wzPsK8+cJzgITgXctdfqvVvtN4L1Pm/4HSrQOowD9NNvDjji/ltQD1V+GSoZMKsBUc7Ex=
BRipnyNEuqpP70Ua6kRaDmxwDWYXa/01GEnxMWINu2KttQoD1F8yTC/DKJhrL8OA/yvwvYB3UYL=
WbScwvxKzS77+Sgz4EgVI3/dNq8SArvvS92pCdL0lMXexJmkw7INBCya+r+sPHKt6yd8E5aClp2=
KcHWwqx95BkroFNqnssys9/WUfoO6xjmVtBa2O4oFA5xMFqpu6kwbThi6v7MFOvUf78graSlAMf=
MhoEwPoKgat+2fppsHLq13yPe3LK/jC7szkrdluBP1PfEryZv0vwHIVUv+VEl7+BQ=3D=3D</di=
agram></mxfile>
\ No newline at end of file
diff --git a/Documentation/gpu/rfc/colorpipe.svg b/Documentation/gpu/rfc/co=
lorpipe.svg
new file mode 100644
index 000000000000..f6b8ece2499d
--- /dev/null
+++ b/Documentation/gpu/rfc/colorpipe.svg
@@ -0,0 +1,3 @@
+<?xml version=3D"1.0" encoding=3D"UTF-8"?>
+<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics=
/SVG/1.1/DTD/svg11.dtd">
+<svg xmlns=3D"http://www.w3.org/2000/svg" xmlns:xlink=3D"http://www.w3.org=
/1999/xlink" version=3D"1.1" width=3D"241px" height=3D"657px" viewBox=3D"-0=
.5 -0.5 241 657" content=3D"&lt;mxfile host=3D&quot;Electron&quot; modified=
=3D&quot;2021-07-27T14:17:39.137Z&quot; agent=3D&quot;5.0 (X11; Linux x86_6=
4) AppleWebKit/537.36 (KHTML, like Gecko) draw.io/14.6.13 Chrome/91.0.4472.=
124 Electron/13.1.7 Safari/537.36&quot; etag=3D&quot;ffS0jb-Ry8iliDxn_T30&q=
uot; version=3D&quot;14.6.13&quot; type=3D&quot;device&quot;&gt;&lt;diagram=
 id=3D&quot;5iAH_SKWfpT4d7aif5q5&quot; name=3D&quot;Page-1&quot;&gt;7ZpdU+I=
wFIZ/DTPuhUyb9AMuFZXdWZ1xBtTlMtLQdqdtOiEI7K/f1Cb9ICrdUUkclgtoTptwes7zpsmBHh=
ylmzFFeXRDApz0gBVsevCiB4DrDvl7YdiWhgF0S0NI46A02bVhEv/BwmgJ6yoO8LJ1ISMkYXHeN=
s5JluE5a9kQpWTdvmxBkva35ijEimEyR4lqfYgDFgmrbVn1ie84DiPx1QNXnEiRvFgYlhEKyLph=
gpc9OKKEsPIo3YxwUsROxqXsd/XK2coxijPWpcPZ+MfP5H4cZ9P88fZ+OXsY2otTG5bDPKFkJe5=
YeMu2MgQ44BERzYxk/OOcklUW4GJgi7cIZREJSYaSa0JybrS58TdmbCvyiVaMcFPE0kSc5T7T7a=
+if9+VzZkY7rlxsWm1tqJVOld49GoUhGlJVnSO37p1QROiIWZvXAeqXHHGMUkx94f3ozhBLH5q+=
4EEbWF1XZ0QfiBy8i/5UdJzRVGKH1eLBaZKptppWUcxw5McPUdhzdXZToEYGVOGN28HU7152UGy=
LcRtO6K9bkhFKiVqqESK5OPj5R4tz6Ajz45OnoGSngCfzu7uywmTxhvjmK7m731MO5/GtHO0TDs=
dmXZ1Mq2m54RDPUZpir71gJdwx88f+WTthcXR9d3UPMaH2hn3DoP0JmYNonlr1jhT81w0tk249c=
rA7SgDT6cM1CfvaHrTK0i74u+jycg47KGnHXv/K2DPA9ACv2/Zzh74n1u3mMY8Tnyh+uGK8Doqw=
tepCE9RxJQnNEV5HmehcWpw5M5cmxqg8xXUoOsh4HdEHlovp/0wzPsK8+cJzgITgXctdfqvVvtN=
4L1Pm/4HSrQOowD9NNvDjji/ltQD1V+GSoZMKsBUc7ExBRipnyNEuqpP70Ua6kRaDmxwDWYXa/0=
1GEnxMWINu2KttQoD1F8yTC/DKJhrL8OA/yvwvYB3UYLWbScwvxKzS77+Sgz4EgVI3/dNq8SArv=
vS92pCdL0lMXexJmkw7INBCya+r+sPHKt6yd8E5aClp2KcHWwqx95BkroFNqnssys9/WUfoO6xj=
mVtBa2O4oFA5xMFqpu6kwbThi6v7MFOvUf78graSlAMfMhoEwPoKgat+2fppsHLq13yPe3LK/jC=
7szkrdluBP1PfEryZv0vwHIVUv+VEl7+BQ=3D=3D&lt;/diagram&gt;&lt;/mxfile&gt;" st=
yle=3D"background-color: rgb(255, 255, 255);"><defs/><g><path d=3D"M 58 58 =
L 58 81.63" fill=3D"none" stroke=3D"#000000" stroke-miterlimit=3D"10" point=
er-events=3D"stroke"/><path d=3D"M 58 86.88 L 54.5 79.88 L 58 81.63 L 61.5 =
79.88 Z" fill=3D"#000000" stroke=3D"#000000" stroke-miterlimit=3D"10" point=
er-events=3D"all"/><rect x=3D"8" y=3D"8" width=3D"100" height=3D"50" fill=
=3D"#ffffff" stroke=3D"#000000" pointer-events=3D"all"/><g transform=3D"tra=
nslate(-0.5 -0.5)"><switch><foreignObject style=3D"overflow: visible; text-=
align: left;" pointer-events=3D"none" width=3D"100%" height=3D"100%" requir=
edFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=
=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsa=
fe center; justify-content: unsafe center; width: 98px; height: 1px; paddin=
g-top: 33px; margin-left: 9px;"><div style=3D"box-sizing: border-box; font-=
size: 0; text-align: center; "><div style=3D"display: inline-block; font-si=
ze: 12px; font-family: Helvetica; color: #000000; line-height: 1.2; pointer=
-events: all; white-space: normal; word-wrap: normal; ">Framebuffer</div></=
div></div></foreignObject><text x=3D"58" y=3D"37" fill=3D"#000000" font-fam=
ily=3D"Helvetica" font-size=3D"12px" text-anchor=3D"middle">Framebuffer</te=
xt></switch></g><path d=3D"M 58 128 L 58 151.63" fill=3D"none" stroke=3D"#0=
00000" stroke-miterlimit=3D"10" pointer-events=3D"stroke"/><path d=3D"M 58 =
156.88 L 54.5 149.88 L 58 151.63 L 61.5 149.88 Z" fill=3D"#000000" stroke=
=3D"#000000" stroke-miterlimit=3D"10" pointer-events=3D"all"/><rect x=3D"8"=
 y=3D"88" width=3D"100" height=3D"40" fill=3D"#ffffff" stroke=3D"#000000" p=
ointer-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)"><switch><forei=
gnObject style=3D"overflow: visible; text-align: left;" pointer-events=3D"n=
one" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/T=
R/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" =
style=3D"display: flex; align-items: unsafe center; justify-content: unsafe=
 center; width: 98px; height: 1px; padding-top: 108px; margin-left: 9px;"><=
div style=3D"box-sizing: border-box; font-size: 0; text-align: center; "><d=
iv style=3D"display: inline-block; font-size: 12px; font-family: Helvetica;=
 color: #000000; line-height: 1.2; pointer-events: all; white-space: normal=
; word-wrap: normal; ">de-YUV matrix</div></div></div></foreignObject><text=
 x=3D"58" y=3D"112" fill=3D"#000000" font-family=3D"Helvetica" font-size=3D=
"12px" text-anchor=3D"middle">de-YUV matrix</text></switch></g><path d=3D"M=
 58 198 L 58 221.63" fill=3D"none" stroke=3D"#000000" stroke-miterlimit=3D"=
10" pointer-events=3D"stroke"/><path d=3D"M 58 226.88 L 54.5 219.88 L 58 22=
1.63 L 61.5 219.88 Z" fill=3D"#000000" stroke=3D"#000000" stroke-miterlimit=
=3D"10" pointer-events=3D"all"/><rect x=3D"8" y=3D"158" width=3D"100" heigh=
t=3D"40" fill=3D"#ffffff" stroke=3D"#000000" pointer-events=3D"all"/><g tra=
nsform=3D"translate(-0.5 -0.5)"><switch><foreignObject style=3D"overflow: v=
isible; text-align: left;" pointer-events=3D"none" width=3D"100%" height=3D=
"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility=
"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align=
-items: unsafe center; justify-content: unsafe center; width: 98px; height:=
 1px; padding-top: 178px; margin-left: 9px;"><div style=3D"box-sizing: bord=
er-box; font-size: 0; text-align: center; "><div style=3D"display: inline-b=
lock; font-size: 12px; font-family: Helvetica; color: #000000; line-height:=
 1.2; pointer-events: all; white-space: normal; word-wrap: normal; ">(de-Ga=
mma)<br />LUT</div></div></div></foreignObject><text x=3D"58" y=3D"182" fil=
l=3D"#000000" font-family=3D"Helvetica" font-size=3D"12px" text-anchor=3D"m=
iddle">(de-Gamma)...</text></switch></g><path d=3D"M 58 268 L 58 296.63" fi=
ll=3D"none" stroke=3D"#000000" stroke-miterlimit=3D"10" pointer-events=3D"s=
troke"/><path d=3D"M 58 301.88 L 54.5 294.88 L 58 296.63 L 61.5 294.88 Z" f=
ill=3D"#000000" stroke=3D"#000000" stroke-miterlimit=3D"10" pointer-events=
=3D"all"/><rect x=3D"8" y=3D"228" width=3D"100" height=3D"40" fill=3D"#ffff=
ff" stroke=3D"#000000" pointer-events=3D"all"/><g transform=3D"translate(-0=
.5 -0.5)"><switch><foreignObject style=3D"overflow: visible; text-align: le=
ft;" pointer-events=3D"none" width=3D"100%" height=3D"100%" requiredFeature=
s=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http:/=
/www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe center;=
 justify-content: unsafe center; width: 98px; height: 1px; padding-top: 248=
px; margin-left: 9px;"><div style=3D"box-sizing: border-box; font-size: 0; =
text-align: center; "><div style=3D"display: inline-block; font-size: 12px;=
 font-family: Helvetica; color: #000000; line-height: 1.2; pointer-events: =
all; white-space: normal; word-wrap: normal; ">CTM / CSC</div></div></div><=
/foreignObject><text x=3D"58" y=3D"252" fill=3D"#000000" font-family=3D"Hel=
vetica" font-size=3D"12px" text-anchor=3D"middle">CTM / CSC</text></switch>=
</g><path d=3D"M 58 343 L 57.46 362.47" fill=3D"none" stroke=3D"#000000" st=
roke-miterlimit=3D"10" pointer-events=3D"stroke"/><path d=3D"M 57.31 367.72=
 L 54.01 360.63 L 57.46 362.47 L 61 360.82 Z" fill=3D"#000000" stroke=3D"#0=
00000" stroke-miterlimit=3D"10" pointer-events=3D"all"/><rect x=3D"8" y=3D"=
303" width=3D"100" height=3D"40" fill=3D"#ffffff" stroke=3D"#000000" pointe=
r-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)"><switch><foreignObj=
ect style=3D"overflow: visible; text-align: left;" pointer-events=3D"none" =
width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG=
11/feature#Extensibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=
=3D"display: flex; align-items: unsafe center; justify-content: unsafe cent=
er; width: 98px; height: 1px; padding-top: 323px; margin-left: 9px;"><div s=
tyle=3D"box-sizing: border-box; font-size: 0; text-align: center; "><div st=
yle=3D"display: inline-block; font-size: 12px; font-family: Helvetica; colo=
r: #000000; line-height: 1.2; pointer-events: all; white-space: normal; wor=
d-wrap: normal; ">Tonemapping</div></div></div></foreignObject><text x=3D"5=
8" y=3D"327" fill=3D"#000000" font-family=3D"Helvetica" font-size=3D"12px" =
text-anchor=3D"middle">Tonemapping</text></switch></g><path d=3D"M 118 428 =
L 118 451.63" fill=3D"none" stroke=3D"#000000" stroke-miterlimit=3D"10" poi=
nter-events=3D"stroke"/><path d=3D"M 118 456.88 L 114.5 449.88 L 118 451.63=
 L 121.5 449.88 Z" fill=3D"#000000" stroke=3D"#000000" stroke-miterlimit=3D=
"10" pointer-events=3D"all"/><rect x=3D"8" y=3D"368" width=3D"220" height=
=3D"60" fill=3D"#ffffff" stroke=3D"#000000" pointer-events=3D"all"/><g tran=
sform=3D"translate(-0.5 -0.5)"><switch><foreignObject style=3D"overflow: vi=
sible; text-align: left;" pointer-events=3D"none" width=3D"100%" height=3D"=
100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"=
><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-=
items: unsafe center; justify-content: unsafe center; width: 218px; height:=
 1px; padding-top: 398px; margin-left: 9px;"><div style=3D"box-sizing: bord=
er-box; font-size: 0; text-align: center; "><div style=3D"display: inline-b=
lock; font-size: 12px; font-family: Helvetica; color: #000000; line-height:=
 1.2; pointer-events: all; white-space: normal; word-wrap: normal; ">Blendi=
ng</div></div></div></foreignObject><text x=3D"118" y=3D"402" fill=3D"#0000=
00" font-family=3D"Helvetica" font-size=3D"12px" text-anchor=3D"middle">Ble=
nding</text></switch></g><path d=3D"M 178 58 L 178 81.63" fill=3D"none" str=
oke=3D"#000000" stroke-miterlimit=3D"10" pointer-events=3D"stroke"/><path d=
=3D"M 178 86.88 L 174.5 79.88 L 178 81.63 L 181.5 79.88 Z" fill=3D"#000000"=
 stroke=3D"#000000" stroke-miterlimit=3D"10" pointer-events=3D"all"/><rect =
x=3D"128" y=3D"8" width=3D"100" height=3D"50" fill=3D"#ffffff" stroke=3D"#0=
00000" pointer-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)"><switc=
h><foreignObject style=3D"overflow: visible; text-align: left;" pointer-eve=
nts=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.=
w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.org/1999=
/xhtml" style=3D"display: flex; align-items: unsafe center; justify-content=
: unsafe center; width: 98px; height: 1px; padding-top: 33px; margin-left: =
129px;"><div style=3D"box-sizing: border-box; font-size: 0; text-align: cen=
ter; "><div style=3D"display: inline-block; font-size: 12px; font-family: H=
elvetica; color: #000000; line-height: 1.2; pointer-events: all; white-spac=
e: normal; word-wrap: normal; ">Framebuffer</div></div></div></foreignObjec=
t><text x=3D"178" y=3D"37" fill=3D"#000000" font-family=3D"Helvetica" font-=
size=3D"12px" text-anchor=3D"middle">Framebuffer</text></switch></g><path d=
=3D"M 178 128 L 178 151.63" fill=3D"none" stroke=3D"#000000" stroke-miterli=
mit=3D"10" pointer-events=3D"stroke"/><path d=3D"M 178 156.88 L 174.5 149.8=
8 L 178 151.63 L 181.5 149.88 Z" fill=3D"#000000" stroke=3D"#000000" stroke=
-miterlimit=3D"10" pointer-events=3D"all"/><rect x=3D"128" y=3D"88" width=
=3D"100" height=3D"40" fill=3D"#ffffff" stroke=3D"#000000" pointer-events=
=3D"all"/><g transform=3D"translate(-0.5 -0.5)"><switch><foreignObject styl=
e=3D"overflow: visible; text-align: left;" pointer-events=3D"none" width=3D=
"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/featu=
re#Extensibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"disp=
lay: flex; align-items: unsafe center; justify-content: unsafe center; widt=
h: 98px; height: 1px; padding-top: 108px; margin-left: 129px;"><div style=
=3D"box-sizing: border-box; font-size: 0; text-align: center; "><div style=
=3D"display: inline-block; font-size: 12px; font-family: Helvetica; color: =
#000000; line-height: 1.2; pointer-events: all; white-space: normal; word-w=
rap: normal; ">de-YUV matrix</div></div></div></foreignObject><text x=3D"17=
8" y=3D"112" fill=3D"#000000" font-family=3D"Helvetica" font-size=3D"12px" =
text-anchor=3D"middle">de-YUV matrix</text></switch></g><path d=3D"M 178 19=
8 L 178 221.63" fill=3D"none" stroke=3D"#000000" stroke-miterlimit=3D"10" p=
ointer-events=3D"stroke"/><path d=3D"M 178 226.88 L 174.5 219.88 L 178 221.=
63 L 181.5 219.88 Z" fill=3D"#000000" stroke=3D"#000000" stroke-miterlimit=
=3D"10" pointer-events=3D"all"/><rect x=3D"128" y=3D"158" width=3D"100" hei=
ght=3D"40" fill=3D"#ffffff" stroke=3D"#000000" pointer-events=3D"all"/><g t=
ransform=3D"translate(-0.5 -0.5)"><switch><foreignObject style=3D"overflow:=
 visible; text-align: left;" pointer-events=3D"none" width=3D"100%" height=
=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibil=
ity"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; al=
ign-items: unsafe center; justify-content: unsafe center; width: 98px; heig=
ht: 1px; padding-top: 178px; margin-left: 129px;"><div style=3D"box-sizing:=
 border-box; font-size: 0; text-align: center; "><div style=3D"display: inl=
ine-block; font-size: 12px; font-family: Helvetica; color: #000000; line-he=
ight: 1.2; pointer-events: all; white-space: normal; word-wrap: normal; ">(=
de-Gamma)<br />LUT</div></div></div></foreignObject><text x=3D"178" y=3D"18=
2" fill=3D"#000000" font-family=3D"Helvetica" font-size=3D"12px" text-ancho=
r=3D"middle">(de-Gamma)...</text></switch></g><path d=3D"M 178 268 L 178 29=
6.63" fill=3D"none" stroke=3D"#000000" stroke-miterlimit=3D"10" pointer-eve=
nts=3D"stroke"/><path d=3D"M 178 301.88 L 174.5 294.88 L 178 296.63 L 181.5=
 294.88 Z" fill=3D"#000000" stroke=3D"#000000" stroke-miterlimit=3D"10" poi=
nter-events=3D"all"/><rect x=3D"128" y=3D"228" width=3D"100" height=3D"40" =
fill=3D"#ffffff" stroke=3D"#000000" pointer-events=3D"all"/><g transform=3D=
"translate(-0.5 -0.5)"><switch><foreignObject style=3D"overflow: visible; t=
ext-align: left;" pointer-events=3D"none" width=3D"100%" height=3D"100%" re=
quiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><div xm=
lns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: u=
nsafe center; justify-content: unsafe center; width: 98px; height: 1px; pad=
ding-top: 248px; margin-left: 129px;"><div style=3D"box-sizing: border-box;=
 font-size: 0; text-align: center; "><div style=3D"display: inline-block; f=
ont-size: 12px; font-family: Helvetica; color: #000000; line-height: 1.2; p=
ointer-events: all; white-space: normal; word-wrap: normal; ">CTM / CSC</di=
v></div></div></foreignObject><text x=3D"178" y=3D"252" fill=3D"#000000" fo=
nt-family=3D"Helvetica" font-size=3D"12px" text-anchor=3D"middle">CTM / CSC=
</text></switch></g><path d=3D"M 178 343 L 178.71 362.48" fill=3D"none" str=
oke=3D"#000000" stroke-miterlimit=3D"10" pointer-events=3D"stroke"/><path d=
=3D"M 178.9 367.72 L 175.15 360.85 L 178.71 362.48 L 182.14 360.6 Z" fill=
=3D"#000000" stroke=3D"#000000" stroke-miterlimit=3D"10" pointer-events=3D"=
all"/><rect x=3D"128" y=3D"303" width=3D"100" height=3D"40" fill=3D"#ffffff=
" stroke=3D"#000000" pointer-events=3D"all"/><g transform=3D"translate(-0.5=
 -0.5)"><switch><foreignObject style=3D"overflow: visible; text-align: left=
;" pointer-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=
=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://=
www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe center; =
justify-content: unsafe center; width: 98px; height: 1px; padding-top: 323p=
x; margin-left: 129px;"><div style=3D"box-sizing: border-box; font-size: 0;=
 text-align: center; "><div style=3D"display: inline-block; font-size: 12px=
; font-family: Helvetica; color: #000000; line-height: 1.2; pointer-events:=
 all; white-space: normal; word-wrap: normal; ">Tonemapping</div></div></di=
v></foreignObject><text x=3D"178" y=3D"327" fill=3D"#000000" font-family=3D=
"Helvetica" font-size=3D"12px" text-anchor=3D"middle">Tonemapping</text></s=
witch></g><path d=3D"M 118 498 L 118 521.63" fill=3D"none" stroke=3D"#00000=
0" stroke-miterlimit=3D"10" pointer-events=3D"stroke"/><path d=3D"M 118 526=
.88 L 114.5 519.88 L 118 521.63 L 121.5 519.88 Z" fill=3D"#000000" stroke=
=3D"#000000" stroke-miterlimit=3D"10" pointer-events=3D"all"/><rect x=3D"68=
" y=3D"458" width=3D"100" height=3D"40" fill=3D"#ffffff" stroke=3D"#000000"=
 pointer-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)"><switch><for=
eignObject style=3D"overflow: visible; text-align: left;" pointer-events=3D=
"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org=
/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.org/1999/xhtml=
" style=3D"display: flex; align-items: unsafe center; justify-content: unsa=
fe center; width: 98px; height: 1px; padding-top: 478px; margin-left: 69px;=
"><div style=3D"box-sizing: border-box; font-size: 0; text-align: center; "=
><div style=3D"display: inline-block; font-size: 12px; font-family: Helveti=
ca; color: #000000; line-height: 1.2; pointer-events: all; white-space: nor=
mal; word-wrap: normal; ">(Tonemapping)<br />LUT</div></div></div></foreign=
Object><text x=3D"118" y=3D"482" fill=3D"#000000" font-family=3D"Helvetica"=
 font-size=3D"12px" text-anchor=3D"middle">(Tonemapping)...</text></switch>=
</g><path d=3D"M 118 568 L 118 596.63" fill=3D"none" stroke=3D"#000000" str=
oke-miterlimit=3D"10" pointer-events=3D"stroke"/><path d=3D"M 118 601.88 L =
114.5 594.88 L 118 596.63 L 121.5 594.88 Z" fill=3D"#000000" stroke=3D"#000=
000" stroke-miterlimit=3D"10" pointer-events=3D"all"/><rect x=3D"68" y=3D"5=
28" width=3D"100" height=3D"40" fill=3D"#ffffff" stroke=3D"#000000" pointer=
-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)"><switch><foreignObje=
ct style=3D"overflow: visible; text-align: left;" pointer-events=3D"none" w=
idth=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG1=
1/feature#Extensibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=
=3D"display: flex; align-items: unsafe center; justify-content: unsafe cent=
er; width: 98px; height: 1px; padding-top: 548px; margin-left: 69px;"><div =
style=3D"box-sizing: border-box; font-size: 0; text-align: center; "><div s=
tyle=3D"display: inline-block; font-size: 12px; font-family: Helvetica; col=
or: #000000; line-height: 1.2; pointer-events: all; white-space: normal; wo=
rd-wrap: normal; ">CTM / CSC</div></div></div></foreignObject><text x=3D"11=
8" y=3D"552" fill=3D"#000000" font-family=3D"Helvetica" font-size=3D"12px" =
text-anchor=3D"middle">CTM / CSC</text></switch></g><rect x=3D"68" y=3D"603=
" width=3D"100" height=3D"40" fill=3D"#ffffff" stroke=3D"#000000" pointer-e=
vents=3D"all"/><g transform=3D"translate(-0.5 -0.5)"><switch><foreignObject=
 style=3D"overflow: visible; text-align: left;" pointer-events=3D"none" wid=
th=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/=
feature#Extensibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D=
"display: flex; align-items: unsafe center; justify-content: unsafe center;=
 width: 98px; height: 1px; padding-top: 623px; margin-left: 69px;"><div sty=
le=3D"box-sizing: border-box; font-size: 0; text-align: center; "><div styl=
e=3D"display: inline-block; font-size: 12px; font-family: Helvetica; color:=
 #000000; line-height: 1.2; pointer-events: all; white-space: normal; word-=
wrap: normal; ">(Gamma)<br />LUT</div></div></div></foreignObject><text x=
=3D"118" y=3D"627" fill=3D"#000000" font-family=3D"Helvetica" font-size=3D"=
12px" text-anchor=3D"middle">(Gamma)...</text></switch></g></g><switch><g r=
equiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"/><a tr=
ansform=3D"translate(0,-5)" xlink:href=3D"https://www.diagrams.net/doc/faq/=
svg-export-text-problems" target=3D"_blank"><text text-anchor=3D"middle" fo=
nt-size=3D"10px" x=3D"50%" y=3D"100%">Viewer does not support full SVG 1.1<=
/text></a></switch></svg>
\ No newline at end of file
diff --git a/Documentation/gpu/rfc/hdr-wide-gamut.rst b/Documentation/gpu/r=
fc/hdr-wide-gamut.rst
new file mode 100644
index 000000000000..e463670191ab
--- /dev/null
+++ b/Documentation/gpu/rfc/hdr-wide-gamut.rst
@@ -0,0 +1,580 @@
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
+HDR & Wide Color Gamut Support
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
+
+.. role:: wy-text-strike
+
+ToDo
+=3D=3D=3D=3D
+
+* :wy-text-strike:`Reformat as RST kerneldoc` - done
+* :wy-text-strike:`Don't use color_encoding for color_space definitions` -=
 done
+* :wy-text-strike:`Update SDR luminance description and reasoning` - done
+* :wy-text-strike:`Clarify 3D LUT required for some color space transforma=
tions` - done
+* :wy-text-strike:`Highlight need for named color space and EOTF definitio=
ns` - done
+* :wy-text-strike:`Define transfer function API` - done
+* :wy-text-strike:`Draft upstream plan` - done
+* :wy-text-strike:`Reference to wayland plan` - done
+* Reference to Chrome plans
+* Sketch view of HW pipeline for couple of HW implementations
+
+
+Upstream Plan
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+* Reach consensus on DRM/KMS API
+* Implement support in amdgpu
+* Implement IGT tests
+* Add API support to Weston, ChromiumOS, or other canonical open-source pr=
oject interested in HDR
+* Merge user-space
+* Merge kernel patches
+
+
+History
+=3D=3D=3D=3D=3D=3D=3D
+
+v3:
+
+* Add sections on single-plane and multi-plane HDR
+* Describe approach to define HW details vs approach to define SW intentio=
ns
+* Link Jeremy Cline's excellent HDR summaries
+* Outline intention behind overly verbose doc
+* Describe FP16 use-case
+* Clean up links
+
+v2: create this doc
+
+v1: n/a
+
+
+Introduction
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+We are looking to enable HDR support for a couple of single-plane and
+multi-plane scenarios. To do this effectively we recommend new interfaces
+to drm_plane. Below I'll give a bit of background on HDR and why we
+propose these interfaces.
+
+As an RFC doc this document is more verbose than what we would want from
+an eventual uAPI doc. This is intentional in order to ensure interested
+parties are all on the same page and to facilitate discussion if there
+is disagreement on aspects of the intentions behind the proposed uAPI.
+
+
+Overview and background
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+I highly recommend you read `Jeremy Cline's HDR primer`_
+
+Jeremy Cline did a much better job describing this. I highly recommend
+you read it at [1]:
+
+.. _Jeremy Cline's HDR primer: https://www.jcline.org/blog/fedora/graphics=
/hdr/2021/05/07/hdr-in-linux-p1.html
+
+Defining a pixel's luminance
+----------------------------
+
+The luminance space of pixels in a framebuffer/plane presented to the
+display is not well defined in the DRM/KMS APIs. It is usually assumed to
+be in a 2.2 or 2.4 gamma space and has no mapping to an absolute luminance
+value; it is interpreted in relative terms.
+
+Luminance can be measured and described in absolute terms as candela
+per meter squared, or cd/m2, or nits. Even though a pixel value can be
+mapped to luminance in a linear fashion to do so without losing a lot of
+detail requires 16-bpc color depth. The reason for this is that human
+perception can distinguish roughly between a 0.5-1% luminance delta. A
+linear representation is suboptimal, wasting precision in the highlights
+and losing precision in the shadows.
+
+A gamma curve is a decent approximation to a human's perception of
+luminance, but the `PQ (perceptual quantizer) function`_ improves on
+it. It also defines the luminance values in absolute terms, with the
+highest value being 10,000 nits and the lowest 0.0005 nits.
+
+Using a content that's defined in PQ space we can approximate the real
+world in a much better way.
+
+Here are some examples of real-life objects and their approximate
+luminance values:
+
+
+.. _PQ (perceptual quantizer) function: https://en.wikipedia.org/wiki/High=
-dynamic-range_video#Perceptual_Quantizer
+
+.. flat-table::
+   :header-rows: 1
+
+   * - Object
+     - Luminance in nits
+
+   *  - Fluorescent light
+      - 10,000
+
+   *  - Highlights
+      - 1,000 - sunlight
+
+   *  - White Objects
+      - 250 - 1,000
+
+   *  - Typical Objects
+      - 1 - 250
+
+   *  - Shadows
+      - 0.01 - 1
+
+   *  - Ultra Blacks
+      - 0 - 0.0005
+
+
+Transfer functions
+------------------
+
+Traditionally we used the terms gamma and de-gamma to describe the
+encoding of a pixel's luminance value and the operation to transfer from
+a linear luminance space to the non-linear space used to encode the
+pixels. Since some newer encodings don't use a gamma curve I suggest
+we refer to non-linear encodings using the terms `EOTF, and OETF`_, or
+simply as transfer function in general.
+
+The EOTF (Electro-Optical Transfer Function) describes how to transfer
+from an electrical signal to an optical signal. This was traditionally
+done by the de-gamma function.
+
+The OETF (Opto Electronic Transfer Function) describes how to transfer
+from an optical signal to an electronic signal. This was traditionally
+done by the gamma function.
+
+More generally we can name the transfer function describing the transform
+between scanout and blending space as the **input transfer function**, and
+the transfer function describing the transform from blending space to the
+output space as **output transfer function**.
+
+
+.. _EOTF, and OETF: https://en.wikipedia.org/wiki/Transfer_functions_in_im=
aging
+
+Mastering Luminances
+--------------------
+
+Even though we are able to describe the absolute luminance of a pixel
+using the PQ 2084 EOTF we are presented with physical limitations of the
+display technologies on the market today. Here are a few examples of
+luminance ranges of displays.
+
+.. flat-table::
+   :header-rows: 1
+
+   * - Display
+     - Luminance range in nits
+
+   *  - Typical PC display
+      - 0.3 - 200
+
+   *  - Excellent LCD HDTV
+      - 0.3 - 400
+
+   *  - HDR LCD w/ local dimming
+      - 0.05 - 1,500
+
+Since no display can currently show the full 0.0005 to 10,000 nits
+luminance range of PQ the display will need to tone-map the HDR content,
+i.e to fit the content within a display's capabilities. To assist
+with tone-mapping HDR content is usually accompanied by a metadata
+that describes (among other things) the minimum and maximum mastering
+luminance, i.e. the maximum and minimum luminance of the display that
+was used to master the HDR content.
+
+The HDR metadata is currently defined on the drm_connector via the
+hdr_output_metadata blob property.
+
+It might be useful to define per-plane hdr metadata, as different planes
+might have been mastered differently.
+
+.. _SDR Luminance:
+
+SDR Luminance
+-------------
+
+Traditional SDR content's maximum white luminance is not well defined.
+Some like to define it at 80 nits, others at 200 nits. It also depends
+to a large extent on the environmental viewing conditions. In practice
+this means that we need to define the maximum SDR white luminance, either
+in nits, or as a ratio.
+
+`One Windows API`_ defines it as a ratio against 80 nits.
+
+`Another Windows API`_ defines it as a nits value.
+
+The `Wayland color management proposal`_ uses Apple's definition of EDR as=
 a
+ratio of the HDR range vs SDR range.
+
+If a display's maximum HDR white level is correctly reported it is trivial
+to convert between all of the above representations of SDR white level. If
+it is not, defining SDR luminance as a nits value, or a ratio vs a fixed
+nits value is preferred, assuming we are blending in linear space.
+
+It is our experience that many HDR displays do not report maximum white
+level correctly
+
+.. _One Windows API: https://docs.microsoft.com/en-us/windows-hardware/dri=
vers/ddi/dispmprt/ns-dispmprt-_dxgkarg_settargetadjustedcolorimetry2
+.. _Another Windows API: https://docs.microsoft.com/en-us/uwp/api/windows.=
graphics.display.advancedcolorinfo.sdrwhitelevelinnits?view=3Dwinrt-20348
+.. _Wayland color management proposal: https://gitlab.freedesktop.org/swic=
k/wayland-protocols/-/blob/color/unstable/color-management/color.rst#id8
+
+Let There Be Color
+------------------
+
+So far we've only talked about luminance, ignoring colors altogether. Just
+like in the luminance space, traditionally the color space of display
+outputs has not been well defined. Similar to how an EOTF defines a
+mapping of pixel data to an absolute luminance value, the color space
+maps color information for each pixel onto the CIE 1931 chromaticity
+space. This can be thought of as a mapping to an absolute, real-life,
+color value.
+
+A color space is defined by its primaries and white point. The primaries
+and white point are expressed as coordinates in the CIE 1931 color
+space. Think of the red primary as the reddest red that can be displayed
+within the color space. Same for green and blue.
+
+Examples of color spaces are:
+
+.. flat-table::
+   :header-rows: 1
+
+   * - Color Space
+     - Description
+
+   *  - BT 601
+      - similar to BT 709
+
+   *  - BT 709
+      - used by sRGB content; ~53% of BT 2020
+
+   *  - DCI-P3
+      - used by most HDR displays; ~72% of BT 2020
+
+   *  - BT 2020
+      - standard for most HDR content
+
+
+
+Color Primaries and White Point
+-------------------------------
+
+Just like displays can currently not represent the entire 0.0005 -
+10,000 nits HDR range of the PQ 2084 EOTF, they are currently not capable
+of representing the entire BT.2020 color Gamut. For this reason video
+content will often specify the color primaries and white point used to
+master the video, in order to allow displays to be able to map the image
+as best as possible onto the display's gamut.
+
+
+Displays and Tonemapping
+------------------------
+
+External displays are able to do their own tone and color mapping, based
+on the mastering luminance, color primaries, and white space defined in
+the HDR metadata.
+
+Some internal panels might not include the complex HW to do tone and color
+mapping on their own and will require the display driver to perform
+appropriate mapping.
+
+
+How are we solving the problem?
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
+
+Single-plane
+------------
+
+If a single drm_plane is used no further work is required. The compositor
+will provide one HDR plane alongside a drm_connector's hdr_output_metadata
+and the display HW will output this plane without further processing if
+no CRTC LUTs are provided.
+
+If desired a compositor can use the CRTC LUTs for HDR content but without
+support for PWL or multi-segmented LUTs the quality of the operation is
+expected to be subpar for HDR content.
+
+
+Multi-plane
+-----------
+
+In multi-plane configurations we need to solve the problem of blending
+HDR and SDR content. This blending should be done in linear space and
+therefore requires framebuffer data that is presented in linear space
+or a way to convert non-linear data to linear space. Additionally
+we need a way to define the luminance of any SDR content in relation
+to the HDR content.
+
+In order to present framebuffer data in linear space without losing a
+lot of precision it needs to be presented using 16 bpc precision.
+
+
+Defining HW Details
+-------------------
+
+One way to take full advantage of modern HW's color pipelines is by
+defining a "generic" pipeline that matches all capable HW. Something
+like this, which I took `from Uma Shankar`_ and expanded on:
+
+.. _from Uma Shankar: https://patchwork.freedesktop.org/series/90826/
+
+.. kernel-figure::  colorpipe.svg
+
+I intentionally put de-Gamma, and Gamma in parentheses in my graph
+as they describe the intention of the block but not necessarily a
+strict definition of how a userspace implementation is required to
+use them.
+
+De-Gamma and Gamma blocks are named LUT, but they could be non-programmable
+LUTs in some HW implementations with no programmable LUT available. See
+the definitions for AMD's `latest dGPU generation`_ as an example.
+
+.. _latest dGPU generation: https://git.kernel.org/pub/scm/linux/kernel/gi=
t/stable/linux.git/tree/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource=
.c?h=3Dv5.13#n2586
+
+I renamed the "Plane Gamma LUT" and "CRTC De-Gamma LUT" to "Tonemapping"
+as we generally don't want to re-apply gamma before blending, or do
+de-gamma post blending. These blocks tend generally to be intended for
+tonemapping purposes.
+
+Tonemapping in this case could be a simple nits value or `EDR`_ to describe
+how to scale the :ref:`SDR luminance`.
+
+Tonemapping could also include the ability to use a 3D LUT which might be
+accompanied by a 1D shaper LUT. The shaper LUT is required in order to
+ensure a 3D LUT with limited entries (e.g. 9x9x9, or 17x17x17) operates
+in perceptual (non-linear) space, so as to evenly spread the limited
+entries evenly across the perceived space.
+
+.. _EDR: https://gitlab.freedesktop.org/swick/wayland-protocols/-/blob/col=
or/unstable/color-management/color.rst#id8
+
+Creating a model that is flexible enough to define color pipelines for
+a wide variety of HW is challenging, though not impossible. Implementing
+support for such a flexible definition in userspace, though, amounts
+to essentially writing color pipeline drivers for each HW.
+
+
+Defining SW Intentions
+----------------------
+
+An alternative to describing the HW color pipeline in enough detail to
+be useful for color management and HDR purposes is to instead define
+SW intentions.
+
+.. kernel-figure::  color_intentions.svg
+
+This greatly simplifies the API and lets the driver do what a driver
+does best: figure out how to program the HW to achieve the desired
+effect.
+
+The above diagram could include white point, primaries, and maximum
+peak and average white levels in order to facilitate tone mapping.
+
+At this point I suggest to keep tonemapping (other than an SDR luminance
+adjustment) out of the current DRM/KMS API. Most HDR displays are capable
+of tonemapping. If for some reason tonemapping is still desired on
+a plane, a shader might be a better way of doing that instead of relying
+on display HW.
+
+In some ways this mirrors how various userspace APIs treat HDR:
+ * Gstreamer's `GstVideoTransferFunction`_
+ * EGL's `EGL_EXT_gl_colorspace_bt2020_pq`_ extension
+ * Vulkan's `VkColorSpaceKHR`_
+
+.. _GstVideoTransferFunction: https://gstreamer.freedesktop.org/documentat=
ion/video/video-color.html?gi-language=3Dc#GstVideoTransferFunction
+.. _EGL_EXT_gl_colorspace_bt2020_pq: https://www.khronos.org/registry/EGL/=
extensions/EXT/EGL_EXT_gl_colorspace_bt2020_linear.txt
+.. _VkColorSpaceKHR: https://www.khronos.org/registry/vulkan/specs/1.2-ext=
ensions/html/vkspec.html#VkColorSpaceKHR
+
+
+A hybrid approach to the API
+----------------------------
+
+Our current approach attempts a hybrid approach, defining API to specify
+input and output transfer functions, as well as an SDR boost, and a
+input color space definition.
+
+We would like to solicit feedback and encourage discussion around the
+merits and weaknesses of these approaches. This question is at the core
+of defining a good API and we'd like to get it right.
+
+
+Input and Output Transfer functions
+-----------------------------------
+
+We define an input transfer function on drm_plane to describe the
+transform from framebuffer to blending space.
+
+We define an output transfer function on drm_crtc to describe the
+transform from blending space to display space.
+
+The transfer function can be a pre-defined function, such as PQ EOTF, or
+a custom LUT. A driver will be able to specify support for specific
+transfer functions, including custom ones.
+
+Defining the transfer function in this way allows us to support in on HW
+that uses ROMs to support these transforms, as well as on HW that use
+LUT definitions that are complex and don't map easily onto a standard LUT
+definition.
+
+We will not define per-plane LUTs in this patchset as the scope of our
+current work only deals with pre-defined transfer functions. This API has
+the flexibility to add custom 1D or 3D LUTs at a later date.
+
+In order to support the existing 1D de-gamma and gamma LUTs on the drm_crtc
+we will include a "custom 1D" enum value to indicate that the custom gamma=
 and
+de-gamma 1D LUTs should be used.
+
+Possible transfer functions:
+
+.. flat-table::
+   :header-rows: 1
+
+   * - Transfer Function
+     - Description
+
+   *  - Gamma 2.2
+      - a simple 2.2 gamma function
+
+   *  - sRGB
+      - 2.4 gamma with small initial linear section
+
+   *  - PQ 2084
+      - SMPTE ST 2084; used for HDR video and allows for up to 10,000 nit =
support
+
+   *  - Linear
+      - Linear relationship between pixel value and luminance value
+
+   *  - Custom 1D
+      - Custom 1D de-gamma and gamma LUTs; one LUT per color
+
+   *  - Custom 3D
+      - Custom 3D LUT (to be defined)
+
+
+Describing SDR Luminance
+------------------------------
+
+Since many displays do no correctly advertise the HDR white level we
+propose to define the SDR white level in nits.
+
+We define a new drm_plane property to specify the white level of an SDR
+plane.
+
+
+Defining the color space
+------------------------
+
+We propose to add a new color space property to drm_plane to define a
+plane's color space.
+
+While some color space conversions can be performed with a simple color
+transformation matrix (CTM) others require a 3D LUT.
+
+
+Defining mastering color space and luminance
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+ToDo
+
+
+
+Pixel Formats
+~~~~~~~~~~~~~
+
+The pixel formats, such as ARGB8888, ARGB2101010, P010, or FP16 are
+unrelated to color space and EOTF definitions. HDR pixels can be formatted
+in different ways but in order to not lose precision HDR content requires
+at least 10 bpc precision. For this reason ARGB2101010, P010, and FP16 are
+the obvious candidates for HDR. ARGB2101010 and P010 have the advantage
+of requiring only half the bandwidth as FP16, while FP16 has the advantage
+of enough precision to operate in a linear space, i.e. without EOTF.
+
+
+Use Cases
+=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+RGB10 HDR plane - composited HDR video & desktop
+------------------------------------------------
+
+A single, composited plane of HDR content. The use-case is a video player
+on a desktop with the compositor owning the composition of SDR and HDR
+content. The content shall be PQ BT.2020 formatted. The drm_connector's
+hdr_output_metadata shall be set.
+
+
+P010 HDR video plane + RGB8 SDR desktop plane
+---------------------------------------------
+A normal 8bpc desktop plane, with a P010 HDR video plane underlayed. The
+HDR plane shall be PQ BT.2020 formatted. The desktop plane shall specify
+an SDR boost value. The drm_connector's hdr_output_metadata shall be set.
+
+
+One XRGB8888 SDR Plane - HDR output
+-----------------------------------
+
+In order to support a smooth transition we recommend an OS that supports
+HDR output to provide the hdr_output_metadata on the drm_connector to
+configure the output for HDR, even when the content is only SDR. This will
+allow for a smooth transition between SDR-only and HDR content. In this
+use-case the SDR max luminance value should be provided on the drm_plane.
+
+In DCN we will de-PQ or de-Gamma all input in order to blend in linear
+space. For SDR content we will also apply any desired boost before
+blending. After blending we will then re-apply the PQ EOTF and do RGB
+to YCbCr conversion if needed.
+
+FP16 HDR linear planes
+----------------------
+
+These will require a transformation into the display's encoding (e.g. PQ)
+using the CRTC LUT. Current CRTC LUTs are lacking the precision in the
+dark areas to do the conversion without losing detail.
+
+One of the newly defined output transfer functions or a PWL or `multi-segm=
ented
+LUT`_ can be used to facilitate the conversion to PQ, HLG, or another
+encoding supported by displays.
+
+.. _multi-segmented LUT: https://patchwork.freedesktop.org/series/90822/
+
+
+User Space
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Gnome & GStreamer
+-----------------
+
+See Jeremy Cline's `HDR in Linux\: Part 2`_.
+
+.. _HDR in Linux\: Part 2: https://www.jcline.org/blog/fedora/graphics/hdr=
/2021/06/28/hdr-in-linux-p2.html
+
+
+Wayland
+-------
+
+See `Wayland Color Management and HDR Design Goals`_.
+
+.. _Wayland Color Management and HDR Design Goals: https://gitlab.freedesk=
top.org/swick/wayland-protocols/-/blob/color/unstable/color-management/colo=
r.rst
+
+
+ChromeOS Ozone
+--------------
+
+ToDo
+
+
+HW support
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+ToDo, describe pipeline on a couple different HW platforms
+
+
+Further Reading
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+* https://gitlab.freedesktop.org/swick/wayland-protocols/-/blob/color/unst=
able/color-management/color.rst
+* http://downloads.bbc.co.uk/rd/pubs/whp/whp-pdf-files/WHP309.pdf
+* https://app.spectracal.com/Documents/White%20Papers/HDR_Demystified.pdf
+* https://www.jcline.org/blog/fedora/graphics/hdr/2021/05/07/hdr-in-linux-=
p1.html
+* https://www.jcline.org/blog/fedora/graphics/hdr/2021/06/28/hdr-in-linux-=
p2.html
+
+
diff --git a/Documentation/gpu/rfc/index.rst b/Documentation/gpu/rfc/index.=
rst
index 05670442ca1b..8d8430cfdde1 100644
--- a/Documentation/gpu/rfc/index.rst
+++ b/Documentation/gpu/rfc/index.rst
@@ -19,3 +19,4 @@ host such documentation:
 .. toctree::
=20
     i915_gem_lmem.rst
+    hdr-wide-gamut.rst
--=20
2.32.0

