Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEEFD00A0A
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 03:15:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 422F210E2FC;
	Thu,  8 Jan 2026 02:15:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4QbjUTdb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010049.outbound.protection.outlook.com [52.101.61.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 359DC10E2F6;
 Thu,  8 Jan 2026 02:15:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VgLJ/lFEdhjsdPgT+16ImpB11J8oOFj/mQvWd9ztKkr5xibpZV2iRUBRUcN9Wf/Dfi0Opf2y1837BMhZTe2VHM3Q6KemrrDup2QaEMhvltuIkSZwQbmhzsLlrJ4G5xBs0NNAhZDND3g2vNIRsMFHzw+Wr05bA+hyyPs7gAMIKkBFXBotHfTlP7U2pi0LPydjkXtMHuxZGVVJAVCQIezvsSKfBvTvDu8WuKDZIjz1BNZOrF5KvSTnLL+1I3oa94yjAB7GsABmhLLnP7LrMd0QfamF+r1ynGyUo6+EZ3wgsMOn55fgy9bCSSY8V7Y4vTmo/fUK9GbEc0U6DTZOXoINhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RlymhprFDeoFcZcAbjESDVQzcJLvqUupJS72f2C/M7w=;
 b=ux9fihkONXLc/Myf66Q1YBPa+Y4rkJ+2bp6c0p9oHvflzJYBfZQWCVavkjG6GJRfHCG+S/D+aTFjEVh578WrIW+3yWck+HJ/x2jwha5yAsTBbCaI9dpYxLrmPInSgvejIMYHamj8gXLQfujSSe9I2JxhugcWbss0BwvROBfP1IfgvKsmdUdq9DVtMZpY4W8LEci/mbHLFaLDs7WThT7A92speHjv2wVKdM/FZ/NZcyWvKdH5dEZA2evg0dLG9er6MttHuHhLJkZcNHhIPvbIR0igVuAucrOwbSvabME2Qs3glBVIgkvGqEtyVjBmGq+znmZv1u844Som6UN0WSRH9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RlymhprFDeoFcZcAbjESDVQzcJLvqUupJS72f2C/M7w=;
 b=4QbjUTdbZCks9tqfYdcnoZCQ6KQbcJiQljjlamg4w1M6wleMcv+1X9gvms1K1SskU+xba5Dz4yjbNRIMB7oAUuZrOfIKxqq6JBUTFBr+5u1QsN1i51rJ3llcAAsTe4pneHQmFF6XmcHtWwCwsI0d9nEzfKTKInc6xPzwxkbS4NQ=
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by CH3PR12MB9124.namprd12.prod.outlook.com (2603:10b6:610:1a7::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 02:15:13 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::80e5:1810:92cf:f2f7]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::80e5:1810:92cf:f2f7%5]) with mapi id 15.20.9478.004; Thu, 8 Jan 2026
 02:15:12 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>, "Kuehling, Felix"
 <Felix.Kuehling@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>
CC: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH v2] drm/amdkfd: fix a memory leak in
 device_queue_manager_init()
Thread-Topic: [PATCH v2] drm/amdkfd: fix a memory leak in
 device_queue_manager_init()
Thread-Index: AQHcfq/aIk28yetizkWab3LcHFfKubVHi2Mw
Date: Thu, 8 Jan 2026 02:15:12 +0000
Message-ID: <BYAPR12MB3176BA15327312EC21B8ED228085A@BYAPR12MB3176.namprd12.prod.outlook.com>
References: <20260106015731.1906738-1-lihaoxiang@isrc.iscas.ac.cn>
In-Reply-To: <20260106015731.1906738-1-lihaoxiang@isrc.iscas.ac.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2026-01-08T02:13:29.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB3176:EE_|CH3PR12MB9124:EE_
x-ms-office365-filtering-correlation-id: 3e2c9fce-eeb3-4ad3-e330-08de4e5bc18e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?Z/uXLG6fjfux1pONykQmMikJctHqwFzVsY0fbTz2AaKMeFsFqfzgrwFqKfJD?=
 =?us-ascii?Q?Cay7rAOUaR3ey0Mbv4PvW7QcTXKlpe0pRXZ5hJI2mxs6lbDmKJ9D9X6BLTrL?=
 =?us-ascii?Q?Hm5ndqucC3UxCqrDBAIjXEePDy+yYYs7CN6iGw625QD49X1jY2pvhpDqqTUq?=
 =?us-ascii?Q?eANuME+xH8TzMLKoo/i6ST7Blu3AzUAIQtWIILtnMQS1N1zvSMw6YqNjfsiP?=
 =?us-ascii?Q?MjuGZ+OyUR8UHw0oOh0RHMmXYWa2j+LLprGMcepPwPGp+bxHEAIO9aQzlnzz?=
 =?us-ascii?Q?NvZcxK10K/A9ZXB0UXhcLzPp8TwbwSkhjN9kETLXbeAugC1Pgql+v3D8EGdN?=
 =?us-ascii?Q?rmXjel21bw8LUNsdll2POKB2KdkfqPeT/DJKC+ZEA6fe5R1z+3DMEIO1kEFn?=
 =?us-ascii?Q?blcNj9DV3Xl6ezSrbBDIVAa9LP8Rs4xntZ12+AeBLsJZoG7FGcRtRHScmKyZ?=
 =?us-ascii?Q?C2FWdiXgSkAQuV8zggU6yxAaAq/Vvz/tS+In9kTztdxc96mF0E2mvb30LOcf?=
 =?us-ascii?Q?mnKdMamjYG+R/oLxa3J3ldEI5GsZFVUELxDl8jvC6/BwmkW+KN2+xFgqUtm4?=
 =?us-ascii?Q?QloNToqHIyDBKAb3gr0wpimBkn5BDnqy7ZiBXohYPfMgn88+Q1JCScpQbtk4?=
 =?us-ascii?Q?bNrj75F7t+iQoQ1wWHJxGtUV5MQa38iZqV9L8Wfcy3zuisRtXqavo5fe2rt7?=
 =?us-ascii?Q?vcLKCaBwNq239+XxZRfSy8tm6O7LK5qDFHt5BWxSVgJLrJJHZOpVUTxKMShA?=
 =?us-ascii?Q?fYw6yflLdt137b9ntaq8Ygwee2aMbXDjoKvQxyPH95Hff7gkxmCVOUsX+dy5?=
 =?us-ascii?Q?xlnlOwi/KqK1ciPX/FjT1IeNYXhhp2aJHNhZNnBh27oHtA+QOPmmDK+zckQX?=
 =?us-ascii?Q?/rhgP2r+3b/Q7Fdz5Q4qBQWdDsH4MzmsnCzdetxXbVl1UiJ2StB5fOcPLNUH?=
 =?us-ascii?Q?2YGpLdUiVQkmYiZnhX08V9Jt/v+gjwuED1BKeBH5k7B1FnIYnz6Q/N7TMGUD?=
 =?us-ascii?Q?tiGXo8lhfS0GqhMNvtftqkjP5vr1adieSt0Ek/KQvkisp9PKFtK5y0fQt7aW?=
 =?us-ascii?Q?ZTT83iYAmawWgmrFdq5c7p1GnPKsT5lxl5kbsvobbsAw6hnCb0QHyh4clHfO?=
 =?us-ascii?Q?cLyQ4Ec68/4udUyK/iEO6GpC5RAw9RD3cav2Bak0A9FRLJqIIpRRiS8BPrCf?=
 =?us-ascii?Q?OfuE/D3PdHLYwYcGOUYKJYyBjr2UeOuJbwkN74acxuca1TAAVL/4M3XB8ONq?=
 =?us-ascii?Q?bBm5IEWGTGHMPGQWFgjCCZXut/xeD9ShXto100Hs2m5/nhxx+XK1dyGf14V5?=
 =?us-ascii?Q?Q5ub5vz9H7BVxTHLnL+XLc3cX7F6d5RmfEY45qdBWP/+dRsAh6N7Pc7nEteg?=
 =?us-ascii?Q?18zaFFNLZBEH7b/rAzenemyTQULJCl0jRe7uLg4Azrk57TPpN14ry5rDQX60?=
 =?us-ascii?Q?9HzyfPRHxaC0w5BGaJ902Gx1FAIgCJ8mduY/kTUXhB8+gJpvq6lOppXwMcc9?=
 =?us-ascii?Q?6BQjSSy2ujZp9vgLSCdNX3QcbW7QWFDNFuy1?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8J76oi0rb6o5IyQRkdeCOuyxZ9DTRowmULKyYmbtknyXewi4NqwuTNMcpYxL?=
 =?us-ascii?Q?nctqA5xTEyIiVuJzpjhVsfdnnPa75JFgTThEqqJsrJDC2kQOK3Bq/Z9Ah77Q?=
 =?us-ascii?Q?Beq+Y1ePF82/ei9OQUyKVWAsNQimPLHHI85/+PXo9iG3iP7nikYmeLvasGkP?=
 =?us-ascii?Q?CyKeZQAr4iJQYyWJ/cAvRaFom+m13VLPTaZoYrC8YGdXOh6ZKbkIMTmCOzHe?=
 =?us-ascii?Q?qlxnhv4EsYE+B1MQ6LFYC70ZsAiQ09tDHUCU1vjAB+Bj0OOp5MtS5LUs+r5Y?=
 =?us-ascii?Q?YvmkPqQi/MSwSjdJGsjj1VP9JNQOQhAlMjI2TLHJ22vH60G5MYzyWPQUfs8n?=
 =?us-ascii?Q?WxbB3R17seYwIRdK3xfADWIdZv8kjBj+O/LrsNbwtk4gmxdFOv+y0FqUZOvV?=
 =?us-ascii?Q?0UUSamVZwT+Tj1d2jlUjCXyR+4w609R94W61mDevTil9SpawsiWLZx0Aowws?=
 =?us-ascii?Q?+GCwAi9gB2+HU1DG0czKpRdjSsQqHHOHqSO41HzaZMC2LSqc2cSgl1di+bOZ?=
 =?us-ascii?Q?3O6tvptJbPycW2lF+JCGC87QZRdAubDUuk6t9p1ab86ljFZylx+g3ENfroLL?=
 =?us-ascii?Q?b8nHwghWchoKiVz5wgFRY6wmADT8ZpYefIr2oUz4Iw4/rC/Yo8ga4k2NvUmb?=
 =?us-ascii?Q?+gWZiX9VCwnQ7AdzGtmcNdyRMUYrS+g6fYgsiLNI1WWgG9attJtULNJe0IBW?=
 =?us-ascii?Q?rW0RPENc9C55xYtlLitpOfVNHs3Ao/H4aS9Z1GPdV08Eb/XGaDJ4j2Um69wL?=
 =?us-ascii?Q?j8OF1sGPQGTDqdavb8OqHXu9FC7yBKtihRy9PzAliFBv/xqJDxEexZhCcghh?=
 =?us-ascii?Q?7DC9a1jUknR/VJcVzltD/Plprdy88qpVfs+m5niHfkaevojJLUSUlvZ3iRsb?=
 =?us-ascii?Q?RoCf2fQ7cbUKQlgfDsTbyOEM5uyiZt144SU9EABAuGHNrnRUmik5TGNTQ/Lo?=
 =?us-ascii?Q?4daSdtVoTNK3JAaH1eV8DxeGqlBVVOrC2qAIX/g2UHIASEuK1ySR0D2itd1g?=
 =?us-ascii?Q?BnyW8Ui4hgtU+gfgji+1ZuX+BxiJIA9iDn33ZcnhrTzIN4H8ay7CUFIgFC6J?=
 =?us-ascii?Q?vYf59uKXrbMVsTf2kIXgjcbLaLt+Lv1eGJZ9Ws3jAvxxSwXN1cAJFIVik/sv?=
 =?us-ascii?Q?lcCyNdI13oGXxLW0WP2kduLwkwkrmSphlxm0Ha6A4iOBivmxygZ5Xzk5Q9+o?=
 =?us-ascii?Q?MSQ+ywdUFETqHgfONAHSPKUxmD4K3k/3K3He4K0KOsZl4uMuWFi6k4Z2yNeQ?=
 =?us-ascii?Q?nu97p5+eoJRMfZVjJxdPTSwmLK9Qi/K85wVudrSwXsixuT2LCUd+fQ2RmCuh?=
 =?us-ascii?Q?U+5Zb6Rho3vxmVHrkvEleVm+dDVpahJYK6ryjzjByBJIvLzbB+NPHOBNIepG?=
 =?us-ascii?Q?2QvNYvvSbkZD5AODdU8BJnAPKke8xyPQezQ6yfuZr8gtrxws2BT8SsGAFqU+?=
 =?us-ascii?Q?U8dzxHNxOmoJLAELAGtGoVs8WDVEXqgHGcpHDn4Eihi3jKmQ3kPR8OALWKh1?=
 =?us-ascii?Q?oRTGxiPUXvz6z7ebgB6M7zyX/jLKjQ1CXV1zr/CcoQJUKPpZ17Q4uReDV4kA?=
 =?us-ascii?Q?z8NtGdhV6Niu4CEIUM1IjBE0MClC17FbZ9btvclB3GMbbmX8/HKOQxLhx7zX?=
 =?us-ascii?Q?/w03f1a8sy5xmBwFlQ8DRI59GXity6EC1b+5+9OP4eAd0giRkBtFhlYVseNF?=
 =?us-ascii?Q?P/wX/UGetxuf2japY+2LGdN7woQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e2c9fce-eeb3-4ad3-e330-08de4e5bc18e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2026 02:15:12.8962 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: whKoAHao4ty8OhSJlKlwYa84zTIEL/50WJKyKPYTx5KYvcG9GXJDh3pSjdo9AJKk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9124
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

-----Original Message-----
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Sent: Monday, January 5, 2026 8:58 PM
To: Kuehling, Felix <Felix.Kuehling@amd.com>; Deucher, Alexander <Alexander=
.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; airlied@gm=
ail.com; simona@ffwll.ch; Zeng, Oak <Oak.Zeng@amd.com>
Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-k=
ernel@vger.kernel.org; Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>; stable@vg=
er.kernel.org
Subject: [PATCH v2] drm/amdkfd: fix a memory leak in device_queue_manager_i=
nit()

Caution: This message originated from an External Source. Use proper cautio=
n when opening attachments, clicking links, or responding.


If dqm->ops.initialize() fails, add deallocate_hiq_sdma_mqd() to release th=
e memory allocated by allocate_hiq_sdma_mqd().
Move deallocate_hiq_sdma_mqd() up to ensure proper function visibility at t=
he point of use.

Fixes: 11614c36bc8f ("drm/amdkfd: Allocate MQD trunk for HIQ and SDMA")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
---
Changes in v2:
- Move deallocate_hiq_sdma_mqd() up. Thanks, Felix!
- Add a Fixes tag.
---
 .../drm/amd/amdkfd/kfd_device_queue_manager.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/driver=
s/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index d7a2e7178ea9..8af0929ca40a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -2919,6 +2919,14 @@ static int allocate_hiq_sdma_mqd(struct device_queue=
_manager *dqm)
        return retval;
 }

+static void deallocate_hiq_sdma_mqd(struct kfd_node *dev,
+                                   struct kfd_mem_obj *mqd) {
+       WARN(!mqd, "No hiq sdma mqd trunk to free");
+
+       amdgpu_amdkfd_free_gtt_mem(dev->adev, &mqd->gtt_mem); }

} in last line should be in a new line.

Other than that, patch lgtm. Reviewed-by: Oak.Zeng@amd.com
+
 struct device_queue_manager *device_queue_manager_init(struct kfd_node *de=
v)  {
        struct device_queue_manager *dqm; @@ -3042,19 +3050,14 @@ struct de=
vice_queue_manager *device_queue_manager_init(struct kfd_node *dev)
                return dqm;
        }

+       if (!dev->kfd->shared_resources.enable_mes)
+               deallocate_hiq_sdma_mqd(dev, &dqm->hiq_sdma_mqd);
+
 out_free:
        kfree(dqm);
        return NULL;
 }

-static void deallocate_hiq_sdma_mqd(struct kfd_node *dev,
-                                   struct kfd_mem_obj *mqd)
-{
-       WARN(!mqd, "No hiq sdma mqd trunk to free");
-
-       amdgpu_amdkfd_free_gtt_mem(dev->adev, &mqd->gtt_mem);
-}
-
 void device_queue_manager_uninit(struct device_queue_manager *dqm)  {
        dqm->ops.stop(dqm);
--
2.25.1

