Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B25C6793906
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 11:56:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060E810E5C5;
	Wed,  6 Sep 2023 09:56:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB1F10E5C3
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 09:56:26 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3869dYcK017704; Wed, 6 Sep 2023 10:56:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-type:content-transfer-encoding:mime-version; s=
 dk201812; bh=y4NloFe6rZgMPb0WubTQZpO4QE2zi3H+SZXQTuaoEZ4=; b=ZTD
 RYWQoG2UD+pVYZ+wXJ4+LyKy0DvW1c/GOR/R9Ois/tUh/GTJZ+uVAxXSSY/Hjnon
 y0+x3Y/sqvOPSQX9x8fcBiU24cja1d604ziarfWGIPKXTEnKBwZdKP5+ZCp9nh7x
 dPnpzgfPcMPaROywl1T/lNb9JmdOibKk/lPS5+9LVMY1TSBhDTzsfbBbU/RNRjfd
 J6V3euVkhMi3FFgb12dk4bj3wEcwyUeqP/gXy5VH18y0Cw1x2RFijBI8mZ3gIA/L
 4n356VUMCYExdfNaKoLBtCHN/FPO6fF6Us1swULtQEdE7M43ZQ9R438gG/YmrLWM
 SLIMAXnvug6KxousjMg==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3suuanu2rx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 06 Sep 2023 10:56:10 +0100 (BST)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Wed, 6 Sep 2023 10:56:09 +0100
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (104.47.21.53) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31 via Frontend
 Transport; Wed, 6 Sep 2023 10:56:09 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=icKzVl3naJYwNnEd1hw2qQ6WwAf08ydyYbwhMqPi/5SiFzJawHbK9AqyjnkVFLsYo7T0HnL1LUSSIj+wReZnYFlCUgH+tIxnK5IJVd2ob0zihJUFIQnM7LGrROzNdN12kYCFFwtx6/7SYjVxp6r9amvedB9qP3ndgdG8wrpPogYSU+2Qyu+O5PLW34yEtKKEzkQrp+BlZ3VhQKQoYV83odEuVT7jGmUqcp/HERDixcbuNa7bLqX/eDYnWN2+I2XtSB13EijNyULxknOp2fv1eItut52nxRZryRclHm9brugk8weN/vYpGzsFF0Uzs9yAlI2NAtIE2Xd0SLjC1dYnkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y4NloFe6rZgMPb0WubTQZpO4QE2zi3H+SZXQTuaoEZ4=;
 b=S4kMPnP9no57spR7XlQUfSM71rEJhFEaBB+6Q1xh1/r92g4arWwRwNOqeNeKOFFuDWe/Id0uIqsTkq0sT27fEoRIdhR6afFLLs117Uvruc36uUNKVueUmgAr574iDxIo0OMnocitEAajtfcjz4GlKzVqU/VKnEdrilPYqGHWeWORs8Gdj1vwil4/mY+6eh2WDEas5IDhFvZ42KXmW3lEmlvvZI3bAg7+8Lq7LNlj7VyNiolA0cShVjVEMWBXRnaW383pqjOW/o0a7SImSKUzQVScbqlzYPbake99Te5Wv7a35w3tCMhvay6mGE/IodInsVL+khsgSRlJS2qlYLLo2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y4NloFe6rZgMPb0WubTQZpO4QE2zi3H+SZXQTuaoEZ4=;
 b=irg6uV6zdluaA2L39Rftyf+5CYtJlql4n9a/2dqy/vG1gU+34hdwbl5Pc8dJhLEbSGg/g8rThYM1eyUXgREB4wDxvnJe//s87osPwNF34H31uWZLaZwnrycE8+z4hNUaVjNea9S8y3VkJcw3mQwiECnpchr00H7oY/PeE2JFv/0=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by LO2P265MB4992.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:22f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 09:56:06 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::b3c:3f6:e3d0:a81b]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::b3c:3f6:e3d0:a81b%6]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 09:56:06 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 05/20] drm/imagination: Add skeleton PowerVR driver
Date: Wed,  6 Sep 2023 10:55:27 +0100
Message-Id: <20230906095542.3280699-6-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230906095542.3280699-1-sarah.walker@imgtec.com>
References: <20230906095542.3280699-1-sarah.walker@imgtec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0279.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::18) To CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:170::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB4817:EE_|LO2P265MB4992:EE_
X-MS-Office365-Filtering-Correlation-Id: 32f7d42f-6f3b-415c-5d70-08dbaebf7cbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZrfviCrm/1NQc9ByjYxYN9nqgOgg9oyhp8dTQwa5joyNiOmKPahYk3V4NjmxoJnoahpdOd6tUmB+vR18dtUrASgS/fLdNPRjw5XXcV2jhW74g+VcDA9sz2u+NACxO5KX1/OY1ho7gRyTyY66n110p2O40elavgVIy3v2++PkxjnAsj/HWGiZehEHOEiVw9/PXr5z41Ku4MoaX7tJ/d+8kxmf+yMVk7CqqoIUALWpXq935ZpOzcY8nG/ZYxT5xBWczvmJE2ZlIPzFDnjsg6chMDfFquEzFOzGoq8QhM35S+BBkjhbSDaI8UGNdZHezuQPLUdfAnPpGdyj8mGaWVbwg7fmvka5BW0raWAH/BPOQJglkMy5aWXLCYrzzNpGBrXgJo3eEPGd90fV030GcsgrEXuCxJ1rpwyYTdN0XE/iLJT8E7up6NE8aevkpCMfeqhVO80ItdPtv929v8KfFVcQsHWglKEI9fnaUFfWMmD4VozG7sWeUx+1Idh4IesZEZDzwhswy/xXaeSXY12imFnEScP2xyWW+CRsHknxAd3uiJC1x1CdSnT5ftlVOil3Zj0YaY9oTuW1NPEzVJTxaQIzmjBclKxTa7hySbCBw3g/509cHLM7OZyVgVcADerAE2Oc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(396003)(39850400004)(376002)(136003)(1800799009)(451199024)(186009)(8676002)(44832011)(8936002)(6506007)(5660300002)(6486002)(4326008)(6666004)(30864003)(7416002)(66476007)(316002)(66556008)(66946007)(6916009)(41300700001)(478600001)(52116002)(6512007)(2906002)(26005)(1076003)(2616005)(83380400001)(38100700002)(38350700002)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmFTYWVFZmZaOHBmS2dTTDQxVlUyU0c4NlJ1eDA1ZXl1dkxJVmZQTlhmWjBs?=
 =?utf-8?B?ZGxjOGJHUG1wYUU2RjA0ZWRaMVVNWDNMK1JTdS9PVXJoRE51cy9JMndxUkda?=
 =?utf-8?B?TGNvWkFxOHU4bXJheklyWUlyWE1BTFVkd1pPMkxXbm5MR1BHN0w0bDFzOXYr?=
 =?utf-8?B?K0JSd2QvRDM5UTEySERyV2ZSY3JGODloemJuYkpya0NOcWFyZzRhejF3ek9o?=
 =?utf-8?B?SEFqaUR6SkNmTHlsYnYxNGxPL2c2YmI0Wm45VVNRMUhaUi9zVUJMTitVTGZV?=
 =?utf-8?B?dENheFpZM04yWWlyV3lWT1RRWEZIV0E3cVQ1YXNyVENoVU52alJ6elhwaHVG?=
 =?utf-8?B?VEtGREN2K0t1UFIwVHZuQmFZcEg3V1Fha3M5eFBYSGZlLzhPYWovNTNmZHhQ?=
 =?utf-8?B?dldyeFRaRGdsNGpGWnZUMHBRbXl2ZXo2ZDFDZWpSWlQ3Z0JCNXowN0NNbjBk?=
 =?utf-8?B?emtoY0NjRXcyWFBmNmh2RWNHSWFueHJ6ZG1BOEhTTVYvTFV2R1Y3UXVqNGl4?=
 =?utf-8?B?RzVtQ0owUlYwZG96TzAySjk0SXZBQ0twZUFRYTFTSjA2WXg4K3hwcHl2bURl?=
 =?utf-8?B?STk3K2ZtK0pKMGtHWU5PN2E3NnlYRG5qNE5Mc3dBUmptT1NDYTIyeW52SzBl?=
 =?utf-8?B?dkNvUisybG9ZMnVCczhFT0NkRjJETUhkSVpiTnhMdG9jRkxLdTBDMnlZUkds?=
 =?utf-8?B?UDJQZDBsc285NVBrTm92bWtkNFJtZU1rNjllbm1uUWZSNXZTcHFORER3R3Vs?=
 =?utf-8?B?Qk51V3MvY2wzUHVTQndiaHJZN0RIbWJyb0E4YjNmTEV6OGsrV1oxM0w0ZXcx?=
 =?utf-8?B?cGNBbzcyNEJ5bitzcitnQ1E1dnVZZE1UeklndXg4WEg0RGFxRXQzcDgyODJi?=
 =?utf-8?B?TG1UWXlmazFTL21ncXNGMVJia0lKY0xTWS9xb0NaWW9oNzQzWmRWT1MxQW8x?=
 =?utf-8?B?ODE3T3hQQms4bWxNcXpCSzdoZG81bTJVZzlPQ3M0djNZZnoxenVHSmhUVnlY?=
 =?utf-8?B?UXBOMEFkendxWDlDVExPNExyWGVnNFVmR3poZk5rWTQ5SDUyMnRuRWMwOUZp?=
 =?utf-8?B?NjFJS3FsZU5DWmJuUldJQURMMXc2bFpZRUg0RUlzNjBOQitmUllhbUk4YWdX?=
 =?utf-8?B?TUtNL2xsaEllVVQ0U3g2RkpqNHNTQyttdlVSbmxRanlwbzh5R0xJQWpscHpB?=
 =?utf-8?B?OXc0QVc3NWlvQkZ3Y2lmM01GRUNYdC81WW50YWZFNW51VTY5MEREZVdTWDVQ?=
 =?utf-8?B?WmRZRzFyNCszOWZveGhvaXN6N2pUZmxkSzNxUUxKZnFpekxKZWl1bFZoTzho?=
 =?utf-8?B?cnV3K0lGa2RtQnZKYXYzMm9CajFHOW5ScTJ1ZTI5WVgrMDJHd0pDNmZrK2gr?=
 =?utf-8?B?SFZ0c0tDaEZKVnVXMWZ6NnlVQjNYNDFOZzBqRktoSjlubTFIZDZKNG9mQ2lU?=
 =?utf-8?B?MklOYmpjVU94Vi9MV0lHNGtqVjVnY2VIUHprKzllM01EZm01NDIyaDdaRCtT?=
 =?utf-8?B?SktvdTIzNDA0T0NTbmRKSmpkZmlFQ1F6cCtJaHovUGdISjRVWWU4cXlFcDNO?=
 =?utf-8?B?VmtKVFp1aG1mVndLZjUva0IzdTlycVlGZEFFaGh4ZXZiK0NjblJRSHY3MXhX?=
 =?utf-8?B?NUVZdmV2NTI3N3NLVFZsbUpwYmtOc3pUakgzOWxkUmNFNXBFRDRGZ3VGNm9p?=
 =?utf-8?B?U1M2SVNqT2lTMlNKRzZSei9Ja3ZRN0FlREorU04xT2Npcll1ZEJYTDc1VWdu?=
 =?utf-8?B?SnJvVlBpeDIwcUUvamMzQlNPNDZDa1pPTVVxNnB1c2x2Y042NEhzU0lhd2dw?=
 =?utf-8?B?b1UybldlTXVtQVNUaXRjWkdJMk1GQTFDLzdrTGVmTGp2Vld1RDhSeE4yUXRS?=
 =?utf-8?B?ajdKUTJBVVoxQnhaVE12a0I3TWJIK0RuSmFtVnlWb2N3c0VVYlpNcGF0b1FO?=
 =?utf-8?B?aW9Pby9NakExeXV6Nm1lT3ZUNHpmbXJ4ZGtCdVIzY1ozc2tibXQwaTlQTU10?=
 =?utf-8?B?eWRQekc0MU5BazZObE5NNGw0VjRLTlZ3K1pCaG4rRlNrK1B2K3hNQ1M2UEVV?=
 =?utf-8?B?QlVGbTFUSldxYlFuU2swTHBPRjFwYTFQREtZN0QrVTc2YmJJTzM3UmdUL2lk?=
 =?utf-8?Q?YUPb51CJiLkf5biC63dUj65P0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32f7d42f-6f3b-415c-5d70-08dbaebf7cbf
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 09:56:06.6759 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AGwwW32T5Cox2JCHIee/hJYJCLu5QjryXr3B0KZuGAd6xEbhloBqAId1JJxHRrsxagy3TyXmmxWUmnJI5oiKAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB4992
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: fNxpikB5tuyReMhd2SHBGh0x2ckveqKP
X-Proofpoint-ORIG-GUID: fNxpikB5tuyReMhd2SHBGh0x2ckveqKP
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
Cc: linux-doc@vger.kernel.org, hns@goldelico.com,
 krzysztof.kozlowski+dt@linaro.org, matthew.brost@intel.com, corbet@lwn.net,
 luben.tuikov@amd.com, dakr@redhat.com, donald.robson@imgtec.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, mripard@kernel.org,
 matt.coster@imgtec.com, robh+dt@kernel.org, faith.ekstrand@collabora.com,
 linux-kernel@vger.kernel.org, afd@ti.com, boris.brezillon@collabora.com,
 tzimmermann@suse.de, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds the basic skeleton of the driver. The driver registers
itself with DRM on probe. Ioctl handlers are currently implemented
as stubs.

Changes since v5:
- Update compatible string & description to match marketing name
- Checkpatch fixes in to/from_pvr_device/file macros

Changes since v3:
- Clarify supported GPU generations in driver description
- Use drm_dev_unplug() when removing device
- Change from_* and to_* functions to macros
- Fix IS_PTR/PTR_ERR confusion in pvr_probe()
- Remove err_out labels in favour of direct returning
- Remove specific am62 compatible match string
- Drop MODULE_FIRMWARE()

Co-developed-by: Frank Binns <frank.binns@imgtec.com>
Signed-off-by: Frank Binns <frank.binns@imgtec.com>
Co-developed-by: Matt Coster <matt.coster@imgtec.com>
Signed-off-by: Matt Coster <matt.coster@imgtec.com>
Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
---
 MAINTAINERS                              |   1 +
 drivers/gpu/drm/Kconfig                  |   2 +
 drivers/gpu/drm/Makefile                 |   1 +
 drivers/gpu/drm/imagination/Kconfig      |  15 +
 drivers/gpu/drm/imagination/Makefile     |   9 +
 drivers/gpu/drm/imagination/pvr_device.h | 153 +++++++
 drivers/gpu/drm/imagination/pvr_drv.c    | 509 +++++++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_drv.h    |  22 +
 8 files changed, 712 insertions(+)
 create mode 100644 drivers/gpu/drm/imagination/Kconfig
 create mode 100644 drivers/gpu/drm/imagination/Makefile
 create mode 100644 drivers/gpu/drm/imagination/pvr_device.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_drv.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_drv.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 3e0cee6814a0..9b2144511a5b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10146,6 +10146,7 @@ M:	Sarah Walker <sarah.walker@imgtec.com>
 M:	Donald Robson <donald.robson@imgtec.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/gpu/img,powervr.yaml
+F:	drivers/gpu/drm/imagination/
 F:	include/uapi/drm/pvr_drm.h
 
 IMON SOUNDGRAPH USB IR RECEIVER
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index ab9ef1c20349..be36ac4d0baa 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -387,6 +387,8 @@ source "drivers/gpu/drm/solomon/Kconfig"
 
 source "drivers/gpu/drm/sprd/Kconfig"
 
+source "drivers/gpu/drm/imagination/Kconfig"
+
 config DRM_HYPERV
 	tristate "DRM Support for Hyper-V synthetic video device"
 	depends on DRM && PCI && MMU && HYPERV
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 215e78e79125..3255e7d4504a 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -198,3 +198,4 @@ obj-$(CONFIG_DRM_HYPERV) += hyperv/
 obj-y			+= solomon/
 obj-$(CONFIG_DRM_SPRD) += sprd/
 obj-$(CONFIG_DRM_LOONGSON) += loongson/
+obj-$(CONFIG_DRM_POWERVR) += imagination/
diff --git a/drivers/gpu/drm/imagination/Kconfig b/drivers/gpu/drm/imagination/Kconfig
new file mode 100644
index 000000000000..e9aaa5313485
--- /dev/null
+++ b/drivers/gpu/drm/imagination/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0 OR MIT
+# Copyright (c) 2023 Imagination Technologies Ltd.
+
+config DRM_POWERVR
+	tristate "Imagination Technologies PowerVR (Series 6 and later) & IMG Graphics"
+	depends on ARM64
+	depends on DRM
+	select DRM_GEM_SHMEM_HELPER
+	select DRM_SCHED
+	select FW_LOADER
+	help
+	  Choose this option if you have a system that has an Imagination
+	  Technologies PowerVR (Series 6 or later) or IMG GPU.
+
+	  If "M" is selected, the module will be called powervr.
diff --git a/drivers/gpu/drm/imagination/Makefile b/drivers/gpu/drm/imagination/Makefile
new file mode 100644
index 000000000000..19b40c2d7356
--- /dev/null
+++ b/drivers/gpu/drm/imagination/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0 OR MIT
+# Copyright (c) 2023 Imagination Technologies Ltd.
+
+subdir-ccflags-y := -I$(srctree)/$(src)
+
+powervr-y := \
+	pvr_drv.o \
+
+obj-$(CONFIG_DRM_POWERVR) += powervr.o
diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
new file mode 100644
index 000000000000..53b1cdb5a6a6
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -0,0 +1,153 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
+
+#ifndef PVR_DEVICE_H
+#define PVR_DEVICE_H
+
+#include <drm/drm_device.h>
+#include <drm/drm_file.h>
+#include <drm/drm_mm.h>
+
+#include <linux/bits.h>
+#include <linux/compiler_attributes.h>
+#include <linux/compiler_types.h>
+#include <linux/kernel.h>
+#include <linux/types.h>
+#include <linux/wait.h>
+
+/**
+ * struct pvr_device - powervr-specific wrapper for &struct drm_device
+ */
+struct pvr_device {
+	/**
+	 * @base: The underlying &struct drm_device.
+	 *
+	 * Do not access this member directly, instead call
+	 * from_pvr_device().
+	 */
+	struct drm_device base;
+};
+
+/**
+ * struct pvr_file - powervr-specific data to be assigned to &struct
+ * drm_file.driver_priv
+ */
+struct pvr_file {
+	/**
+	 * @file: A reference to the parent &struct drm_file.
+	 *
+	 * Do not access this member directly, instead call from_pvr_file().
+	 */
+	struct drm_file *file;
+
+	/**
+	 * @pvr_dev: A reference to the powervr-specific wrapper for the
+	 *           associated device. Saves on repeated calls to
+	 *           to_pvr_device().
+	 */
+	struct pvr_device *pvr_dev;
+};
+
+#define from_pvr_device(pvr_dev) (&(pvr_dev)->base)
+
+#define to_pvr_device(drm_dev) container_of_const(drm_dev, struct pvr_device, base)
+
+#define from_pvr_file(pvr_file) ((pvr_file)->file)
+
+#define to_pvr_file(file) ((file)->driver_priv)
+
+/**
+ * DOC: IOCTL validation helpers
+ *
+ * To validate the constraints imposed on IOCTL argument structs, a collection
+ * of macros and helper functions exist in ``pvr_device.h``.
+ *
+ * Of the current helpers, it should only be necessary to call
+ * PVR_IOCTL_UNION_PADDING_CHECK() directly. This macro should be used once in
+ * every code path which extracts a union member from a struct passed from
+ * userspace.
+ */
+
+/**
+ * pvr_ioctl_union_padding_check() - Validate that the implicit padding between
+ * the end of a union member and the end of the union itself is zeroed.
+ * @instance: Pointer to the instance of the struct to validate.
+ * @union_offset: Offset into the type of @instance of the target union. Must
+ * be 64-bit aligned.
+ * @union_size: Size of the target union in the type of @instance. Must be
+ * 64-bit aligned.
+ * @member_size: Size of the target member in the target union specified by
+ * @union_offset and @union_size. It is assumed that the offset of the target
+ * member is zero relative to @union_offset. Must be 64-bit aligned.
+ *
+ * You probably want to use PVR_IOCTL_UNION_PADDING_CHECK() instead of calling
+ * this function directly, since that macro abstracts away much of the setup,
+ * and also provides some static validation. See its docs for details.
+ *
+ * Return:
+ *  * %true if every byte between the end of the used member of the union and
+ *    the end of that union is zeroed, or
+ *  * %false otherwise.
+ */
+static __always_inline bool
+pvr_ioctl_union_padding_check(void *instance, size_t union_offset,
+			      size_t union_size, size_t member_size)
+{
+	/*
+	 * void pointer arithmetic is technically illegal - cast to a byte
+	 * pointer so this addition works safely.
+	 */
+	void *padding_start = ((u8 *)instance) + union_offset + member_size;
+	size_t padding_size = union_size - member_size;
+
+	return !memchr_inv(padding_start, 0, padding_size);
+}
+
+/**
+ * PVR_STATIC_ASSERT_64BIT_ALIGNED() - Inline assertion for 64-bit alignment.
+ * @static_expr_: Target expression to evaluate.
+ *
+ * If @static_expr_ does not evaluate to a constant integer which would be a
+ * 64-bit aligned address (i.e. a multiple of 8), compilation will fail.
+ *
+ * Return:
+ * The value of @static_expr_.
+ */
+#define PVR_STATIC_ASSERT_64BIT_ALIGNED(static_expr_)                     \
+	({                                                                \
+		static_assert(((static_expr_) & (sizeof(u64) - 1)) == 0); \
+		(static_expr_);                                           \
+	})
+
+/**
+ * PVR_IOCTL_UNION_PADDING_CHECK() - Validate that the implicit padding between
+ * the end of a union member and the end of the union itself is zeroed.
+ * @struct_instance_: An expression which evaluates to a pointer to a UAPI data
+ * struct.
+ * @union_: The name of the union member of @struct_instance_ to check. If the
+ * union member is nested within the type of @struct_instance_, this may
+ * contain the member access operator (".").
+ * @member_: The name of the member of @union_ to assess.
+ *
+ * This is a wrapper around pvr_ioctl_union_padding_check() which performs
+ * alignment checks and simplifies things for the caller.
+ *
+ * Return:
+ *  * %true if every byte in @struct_instance_ between the end of @member_ and
+ *    the end of @union_ is zeroed, or
+ *  * %false otherwise.
+ */
+#define PVR_IOCTL_UNION_PADDING_CHECK(struct_instance_, union_, member_)     \
+	({                                                                   \
+		typeof(struct_instance_) __instance = (struct_instance_);    \
+		size_t __union_offset = PVR_STATIC_ASSERT_64BIT_ALIGNED(     \
+			offsetof(typeof(*__instance), union_));              \
+		size_t __union_size = PVR_STATIC_ASSERT_64BIT_ALIGNED(       \
+			sizeof(__instance->union_));                         \
+		size_t __member_size = PVR_STATIC_ASSERT_64BIT_ALIGNED(      \
+			sizeof(__instance->union_.member_));                 \
+		pvr_ioctl_union_padding_check(__instance, __union_offset,    \
+					      __union_size, __member_size);  \
+	})
+
+#endif /* PVR_DEVICE_H */
diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
new file mode 100644
index 000000000000..a23bef62b52b
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -0,0 +1,509 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
+
+#include "pvr_device.h"
+#include "pvr_drv.h"
+
+#include <uapi/drm/pvr_drm.h>
+
+#include <drm/drm_device.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_file.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_ioctl.h>
+
+#include <linux/err.h>
+#include <linux/export.h>
+#include <linux/fs.h>
+#include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/of_device.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+
+/**
+ * DOC: PowerVR (Series 6 and later) and IMG Graphics Driver
+ *
+ * This driver supports the following PowerVR/IMG graphics cores from Imagination Technologies:
+ *
+ * * AXE-1-16M (found in Texas Instruments AM62)
+ */
+
+/**
+ * pvr_ioctl_create_bo() - IOCTL to create a GEM buffer object.
+ * @drm_dev: [IN] Target DRM device.
+ * @raw_args: [IN/OUT] Arguments passed to this IOCTL. This must be of type
+ * &struct drm_pvr_ioctl_create_bo_args.
+ * @file: [IN] DRM file-private data.
+ *
+ * Called from userspace with %DRM_IOCTL_PVR_CREATE_BO.
+ *
+ * Return:
+ *  * 0 on success,
+ *  * -%EINVAL if the value of &drm_pvr_ioctl_create_bo_args.size is zero
+ *    or wider than &typedef size_t,
+ *  * -%EINVAL if any bits in &drm_pvr_ioctl_create_bo_args.flags that are
+ *    reserved or undefined are set,
+ *  * -%EINVAL if any padding fields in &drm_pvr_ioctl_create_bo_args are not
+ *    zero,
+ *  * Any error encountered while creating the object (see
+ *    pvr_gem_object_create()), or
+ *  * Any error encountered while transferring ownership of the object into a
+ *    userspace-accessible handle (see pvr_gem_object_into_handle()).
+ */
+static int
+pvr_ioctl_create_bo(struct drm_device *drm_dev, void *raw_args,
+		    struct drm_file *file)
+{
+	return -ENOTTY;
+}
+
+/**
+ * pvr_ioctl_get_bo_mmap_offset() - IOCTL to generate a "fake" offset to be
+ * used when calling mmap() from userspace to map the given GEM buffer object
+ * @drm_dev: [IN] DRM device (unused).
+ * @raw_args: [IN/OUT] Arguments passed to this IOCTL. This must be of type
+ *                     &struct drm_pvr_ioctl_get_bo_mmap_offset_args.
+ * @file: [IN] DRM file private data.
+ *
+ * Called from userspace with %DRM_IOCTL_PVR_GET_BO_MMAP_OFFSET.
+ *
+ * This IOCTL does *not* perform an mmap. See the docs on
+ * &struct drm_pvr_ioctl_get_bo_mmap_offset_args for details.
+ *
+ * Return:
+ *  * 0 on success,
+ *  * -%ENOENT if the handle does not reference a valid GEM buffer object,
+ *  * -%EINVAL if any padding fields in &struct
+ *    drm_pvr_ioctl_get_bo_mmap_offset_args are not zero, or
+ *  * Any error returned by drm_gem_create_mmap_offset().
+ */
+static int
+pvr_ioctl_get_bo_mmap_offset(struct drm_device *drm_dev, void *raw_args,
+			     struct drm_file *file)
+{
+	return -ENOTTY;
+}
+
+/**
+ * pvr_ioctl_dev_query() - IOCTL to copy information about a device
+ * @drm_dev: [IN] DRM device.
+ * @raw_args: [IN/OUT] Arguments passed to this IOCTL. This must be of type
+ *                     &struct drm_pvr_ioctl_dev_query_args.
+ * @file: [IN] DRM file private data.
+ *
+ * Called from userspace with %DRM_IOCTL_PVR_DEV_QUERY.
+ * If the given receiving struct pointer is NULL, or the indicated size is too
+ * small, the expected size of the struct type will be returned in the size
+ * argument field.
+ *
+ * Return:
+ *  * 0 on success or when fetching the size with args->pointer == NULL, or
+ *  * -%E2BIG if the indicated size of the receiving struct is less than is
+ *    required to contain the copied data, or
+ *  * -%EINVAL if the indicated struct type is unknown, or
+ *  * -%ENOMEM if local memory could not be allocated, or
+ *  * -%EFAULT if local memory could not be copied to userspace.
+ */
+static int
+pvr_ioctl_dev_query(struct drm_device *drm_dev, void *raw_args,
+		    struct drm_file *file)
+{
+	return -ENOTTY;
+}
+
+/**
+ * pvr_ioctl_create_context() - IOCTL to create a context
+ * @drm_dev: [IN] DRM device.
+ * @raw_args: [IN/OUT] Arguments passed to this IOCTL. This must be of type
+ *                     &struct drm_pvr_ioctl_create_context_args.
+ * @file: [IN] DRM file private data.
+ *
+ * Called from userspace with %DRM_IOCTL_PVR_CREATE_CONTEXT.
+ *
+ * Return:
+ *  * 0 on success, or
+ *  * -%EINVAL if provided arguments are invalid, or
+ *  * -%EFAULT if arguments can't be copied from userspace, or
+ *  * Any error returned by pvr_create_render_context().
+ */
+static int
+pvr_ioctl_create_context(struct drm_device *drm_dev, void *raw_args,
+			 struct drm_file *file)
+{
+	return -ENOTTY;
+}
+
+/**
+ * pvr_ioctl_destroy_context() - IOCTL to destroy a context
+ * @drm_dev: [IN] DRM device.
+ * @raw_args: [IN/OUT] Arguments passed to this IOCTL. This must be of type
+ *                     &struct drm_pvr_ioctl_destroy_context_args.
+ * @file: [IN] DRM file private data.
+ *
+ * Called from userspace with %DRM_IOCTL_PVR_DESTROY_CONTEXT.
+ *
+ * Return:
+ *  * 0 on success, or
+ *  * -%EINVAL if context not in context list.
+ */
+static int
+pvr_ioctl_destroy_context(struct drm_device *drm_dev, void *raw_args,
+			  struct drm_file *file)
+{
+	return -ENOTTY;
+}
+
+/**
+ * pvr_ioctl_create_free_list() - IOCTL to create a free list
+ * @drm_dev: [IN] DRM device.
+ * @raw_args: [IN/OUT] Arguments passed to this IOCTL. This must be of type
+ *                     &struct drm_pvr_ioctl_create_free_list_args.
+ * @file: [IN] DRM file private data.
+ *
+ * Called from userspace with %DRM_IOCTL_PVR_CREATE_FREE_LIST.
+ *
+ * Return:
+ *  * 0 on success, or
+ *  * Any error returned by pvr_free_list_create().
+ */
+static int
+pvr_ioctl_create_free_list(struct drm_device *drm_dev, void *raw_args,
+			   struct drm_file *file)
+{
+	return -ENOTTY;
+}
+
+/**
+ * pvr_ioctl_destroy_free_list() - IOCTL to destroy a free list
+ * @drm_dev: [IN] DRM device.
+ * @raw_args: [IN] Arguments passed to this IOCTL. This must be of type
+ *                 &struct drm_pvr_ioctl_destroy_free_list_args.
+ * @file: [IN] DRM file private data.
+ *
+ * Called from userspace with %DRM_IOCTL_PVR_DESTROY_FREE_LIST.
+ *
+ * Return:
+ *  * 0 on success, or
+ *  * -%EINVAL if free list not in object list.
+ */
+static int
+pvr_ioctl_destroy_free_list(struct drm_device *drm_dev, void *raw_args,
+			    struct drm_file *file)
+{
+	return -ENOTTY;
+}
+
+/**
+ * pvr_ioctl_create_hwrt_dataset() - IOCTL to create a HWRT dataset
+ * @drm_dev: [IN] DRM device.
+ * @raw_args: [IN/OUT] Arguments passed to this IOCTL. This must be of type
+ *                     &struct drm_pvr_ioctl_create_hwrt_dataset_args.
+ * @file: [IN] DRM file private data.
+ *
+ * Called from userspace with %DRM_IOCTL_PVR_CREATE_HWRT_DATASET.
+ *
+ * Return:
+ *  * 0 on success, or
+ *  * Any error returned by pvr_hwrt_dataset_create().
+ */
+static int
+pvr_ioctl_create_hwrt_dataset(struct drm_device *drm_dev, void *raw_args,
+			      struct drm_file *file)
+{
+	return -ENOTTY;
+}
+
+/**
+ * pvr_ioctl_destroy_hwrt_dataset() - IOCTL to destroy a HWRT dataset
+ * @drm_dev: [IN] DRM device.
+ * @raw_args: [IN] Arguments passed to this IOCTL. This must be of type
+ *                 &struct drm_pvr_ioctl_destroy_hwrt_dataset_args.
+ * @file: [IN] DRM file private data.
+ *
+ * Called from userspace with %DRM_IOCTL_PVR_DESTROY_HWRT_DATASET.
+ *
+ * Return:
+ *  * 0 on success, or
+ *  * -%EINVAL if HWRT dataset not in object list.
+ */
+static int
+pvr_ioctl_destroy_hwrt_dataset(struct drm_device *drm_dev, void *raw_args,
+			       struct drm_file *file)
+{
+	return -ENOTTY;
+}
+
+/**
+ * pvr_ioctl_create_vm_context() - IOCTL to create a VM context
+ * @drm_dev: [IN] DRM device.
+ * @raw_args: [IN/OUT] Arguments passed to this IOCTL. This must be of type
+ *                     &struct drm_pvr_ioctl_create_vm_context_args.
+ * @file: [IN] DRM file private data.
+ *
+ * Called from userspace with %DRM_IOCTL_PVR_CREATE_VM_CONTEXT.
+ *
+ * Return:
+ *  * 0 on success, or
+ *  * Any error returned by pvr_vm_create_context().
+ */
+static int
+pvr_ioctl_create_vm_context(struct drm_device *drm_dev, void *raw_args,
+			    struct drm_file *file)
+{
+	return -ENOTTY;
+}
+
+/**
+ * pvr_ioctl_destroy_vm_context() - IOCTL to destroy a VM context
+￼* @drm_dev: [IN] DRM device.
+￼* @raw_args: [IN] Arguments passed to this IOCTL. This must be of type
+￼*                 &struct drm_pvr_ioctl_destroy_vm_context_args.
+￼* @file: [IN] DRM file private data.
+￼*
+￼* Called from userspace with %DRM_IOCTL_PVR_DESTROY_VM_CONTEXT.
+￼*
+￼* Return:
+￼*  * 0 on success, or
+￼*  * -%EINVAL if object not in object list.
+ */
+static int
+pvr_ioctl_destroy_vm_context(struct drm_device *drm_dev, void *raw_args,
+			     struct drm_file *file)
+{
+	return -ENOTTY;
+}
+
+/**
+ * pvr_ioctl_vm_map() - IOCTL to map buffer to GPU address space.
+ * @drm_dev: [IN] DRM device.
+ * @raw_args: [IN] Arguments passed to this IOCTL. This must be of type
+ *                 &struct drm_pvr_ioctl_vm_map_args.
+ * @file: [IN] DRM file private data.
+ *
+ * Called from userspace with %DRM_IOCTL_PVR_VM_MAP.
+ *
+ * Return:
+ *  * 0 on success,
+ *  * -%EINVAL if &drm_pvr_ioctl_vm_op_map_args.flags is not zero,
+ *  * -%EINVAL if the bounds specified by &drm_pvr_ioctl_vm_op_map_args.offset
+ *    and &drm_pvr_ioctl_vm_op_map_args.size are not valid or do not fall
+ *    within the buffer object specified by
+ *    &drm_pvr_ioctl_vm_op_map_args.handle,
+ *  * -%EINVAL if the bounds specified by
+ *    &drm_pvr_ioctl_vm_op_map_args.device_addr and
+ *    &drm_pvr_ioctl_vm_op_map_args.size do not form a valid device-virtual
+ *    address range which falls entirely within a single heap, or
+ *  * -%ENOENT if &drm_pvr_ioctl_vm_op_map_args.handle does not refer to a
+ *    valid PowerVR buffer object.
+ */
+static int
+pvr_ioctl_vm_map(struct drm_device *drm_dev, void *raw_args,
+		 struct drm_file *file)
+{
+	return -ENOTTY;
+}
+
+/**
+ * pvr_ioctl_vm_unmap() - IOCTL to unmap buffer from GPU address space.
+ * @drm_dev: [IN] DRM device.
+ * @raw_args: [IN] Arguments passed to this IOCTL. This must be of type
+ *                 &struct drm_pvr_ioctl_vm_unmap_args.
+ * @file: [IN] DRM file private data.
+ *
+ * Called from userspace with %DRM_IOCTL_PVR_VM_UNMAP.
+ *
+ * Return:
+ *  * 0 on success,
+ *  * -%EINVAL if &drm_pvr_ioctl_vm_op_unmap_args.device_addr is not a valid
+ *    device page-aligned device-virtual address, or
+ *  * -%ENOENT if there is currently no PowerVR buffer object mapped at
+ *    &drm_pvr_ioctl_vm_op_unmap_args.device_addr.
+ */
+static int
+pvr_ioctl_vm_unmap(struct drm_device *drm_dev, void *raw_args,
+		   struct drm_file *file)
+{
+	return -ENOTTY;
+}
+
+/*
+ * pvr_ioctl_submit_job() - IOCTL to submit a job to the GPU
+ * @drm_dev: [IN] DRM device.
+ * @raw_args: [IN] Arguments passed to this IOCTL. This must be of type
+ *                 &struct drm_pvr_ioctl_submit_job_args.
+ * @file: [IN] DRM file private data.
+ *
+ * Called from userspace with %DRM_IOCTL_PVR_SUBMIT_JOB.
+ *
+ * Return:
+ *  * 0 on success, or
+ *  * -%EINVAL if arguments are invalid.
+ */
+static int
+pvr_ioctl_submit_jobs(struct drm_device *drm_dev, void *raw_args,
+		      struct drm_file *file)
+{
+	return -ENOTTY;
+}
+
+#define DRM_PVR_IOCTL(_name, _func, _flags) \
+	DRM_IOCTL_DEF_DRV(PVR_##_name, pvr_ioctl_##_func, _flags)
+
+/* clang-format off */
+
+static const struct drm_ioctl_desc pvr_drm_driver_ioctls[] = {
+	DRM_PVR_IOCTL(DEV_QUERY, dev_query, DRM_RENDER_ALLOW),
+	DRM_PVR_IOCTL(CREATE_BO, create_bo, DRM_RENDER_ALLOW),
+	DRM_PVR_IOCTL(GET_BO_MMAP_OFFSET, get_bo_mmap_offset, DRM_RENDER_ALLOW),
+	DRM_PVR_IOCTL(CREATE_VM_CONTEXT, create_vm_context, DRM_RENDER_ALLOW),
+	DRM_PVR_IOCTL(DESTROY_VM_CONTEXT, destroy_vm_context, DRM_RENDER_ALLOW),
+	DRM_PVR_IOCTL(VM_MAP, vm_map, DRM_RENDER_ALLOW),
+	DRM_PVR_IOCTL(VM_UNMAP, vm_unmap, DRM_RENDER_ALLOW),
+	DRM_PVR_IOCTL(CREATE_CONTEXT, create_context, DRM_RENDER_ALLOW),
+	DRM_PVR_IOCTL(DESTROY_CONTEXT, destroy_context, DRM_RENDER_ALLOW),
+	DRM_PVR_IOCTL(CREATE_FREE_LIST, create_free_list, DRM_RENDER_ALLOW),
+	DRM_PVR_IOCTL(DESTROY_FREE_LIST, destroy_free_list, DRM_RENDER_ALLOW),
+	DRM_PVR_IOCTL(CREATE_HWRT_DATASET, create_hwrt_dataset, DRM_RENDER_ALLOW),
+	DRM_PVR_IOCTL(DESTROY_HWRT_DATASET, destroy_hwrt_dataset, DRM_RENDER_ALLOW),
+	DRM_PVR_IOCTL(SUBMIT_JOBS, submit_jobs, DRM_RENDER_ALLOW),
+};
+
+/* clang-format on */
+
+#undef DRM_PVR_IOCTL
+
+/**
+ * pvr_drm_driver_open() - Driver callback when a new &struct drm_file is opened
+ * @drm_dev: [IN] DRM device.
+ * @file: [IN] DRM file private data.
+ *
+ * Allocates powervr-specific file private data (&struct pvr_file).
+ *
+ * Registered in &pvr_drm_driver.
+ *
+ * Return:
+ *  * 0 on success,
+ *  * -%ENOMEM if the allocation of a &struct ipvr_file fails, or
+ *  * Any error returned by pvr_memory_context_init().
+ */
+static int
+pvr_drm_driver_open(struct drm_device *drm_dev, struct drm_file *file)
+{
+	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
+	struct pvr_file *pvr_file;
+
+	pvr_file = kzalloc(sizeof(*pvr_file), GFP_KERNEL);
+	if (!pvr_file)
+		return -ENOMEM;
+
+	/*
+	 * Store reference to base DRM file private data for use by
+	 * from_pvr_file.
+	 */
+	pvr_file->file = file;
+
+	/*
+	 * Store reference to powervr-specific outer device struct in file
+	 * private data for convenient access.
+	 */
+	pvr_file->pvr_dev = pvr_dev;
+
+	/*
+	 * Store reference to powervr-specific file private data in DRM file
+	 * private data.
+	 */
+	file->driver_priv = pvr_file;
+
+	return 0;
+}
+
+/**
+ * pvr_drm_driver_postclose() - One of the driver callbacks when a &struct
+ * drm_file is closed.
+ * @drm_dev: [IN] DRM device (unused).
+ * @file: [IN] DRM file private data.
+ *
+ * Frees powervr-specific file private data (&struct pvr_file).
+ *
+ * Registered in &pvr_drm_driver.
+ */
+static void
+pvr_drm_driver_postclose(__always_unused struct drm_device *drm_dev,
+			 struct drm_file *file)
+{
+	struct pvr_file *pvr_file = to_pvr_file(file);
+
+	kfree(pvr_file);
+	file->driver_priv = NULL;
+}
+
+DEFINE_DRM_GEM_FOPS(pvr_drm_driver_fops);
+
+static struct drm_driver pvr_drm_driver = {
+	.driver_features = DRIVER_RENDER,
+	.open = pvr_drm_driver_open,
+	.postclose = pvr_drm_driver_postclose,
+	.ioctls = pvr_drm_driver_ioctls,
+	.num_ioctls = ARRAY_SIZE(pvr_drm_driver_ioctls),
+	.fops = &pvr_drm_driver_fops,
+
+	.name = PVR_DRIVER_NAME,
+	.desc = PVR_DRIVER_DESC,
+	.date = PVR_DRIVER_DATE,
+	.major = PVR_DRIVER_MAJOR,
+	.minor = PVR_DRIVER_MINOR,
+	.patchlevel = PVR_DRIVER_PATCHLEVEL,
+
+};
+
+static int
+pvr_probe(struct platform_device *plat_dev)
+{
+	struct pvr_device *pvr_dev;
+	struct drm_device *drm_dev;
+
+	pvr_dev = devm_drm_dev_alloc(&plat_dev->dev, &pvr_drm_driver,
+				     struct pvr_device, base);
+	if (IS_ERR(pvr_dev))
+		return PTR_ERR(pvr_dev);
+
+	drm_dev = &pvr_dev->base;
+
+	platform_set_drvdata(plat_dev, drm_dev);
+
+	return drm_dev_register(drm_dev, 0);
+}
+
+static int
+pvr_remove(struct platform_device *plat_dev)
+{
+	struct drm_device *drm_dev = platform_get_drvdata(plat_dev);
+
+	drm_dev_unplug(drm_dev);
+
+	return 0;
+}
+
+static const struct of_device_id dt_match[] = {
+	{ .compatible = "img,img-axe", .data = NULL },
+	{}
+};
+MODULE_DEVICE_TABLE(of, dt_match);
+
+static struct platform_driver pvr_driver = {
+	.probe = pvr_probe,
+	.remove = pvr_remove,
+	.driver = {
+		.name = PVR_DRIVER_NAME,
+		.of_match_table = dt_match,
+	},
+};
+module_platform_driver(pvr_driver);
+
+MODULE_AUTHOR("Imagination Technologies Ltd.");
+MODULE_DESCRIPTION(PVR_DRIVER_DESC);
+MODULE_LICENSE("Dual MIT/GPL");
+MODULE_IMPORT_NS(DMA_BUF);
diff --git a/drivers/gpu/drm/imagination/pvr_drv.h b/drivers/gpu/drm/imagination/pvr_drv.h
new file mode 100644
index 000000000000..ecd8f6011ae9
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_drv.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
+
+#ifndef PVR_DRV_H
+#define PVR_DRV_H
+
+#include "linux/compiler_attributes.h"
+#include <uapi/drm/pvr_drm.h>
+
+#define PVR_DRIVER_NAME "powervr"
+#define PVR_DRIVER_DESC "Imagination PowerVR (Series 6 and later) & IMG Graphics"
+#define PVR_DRIVER_DATE "20230904"
+
+/*
+ * Driver interface version:
+ *  - 1.0: Initial interface
+ */
+#define PVR_DRIVER_MAJOR 1
+#define PVR_DRIVER_MINOR 0
+#define PVR_DRIVER_PATCHLEVEL 0
+
+#endif /* PVR_DRV_H */
-- 
2.42.0

