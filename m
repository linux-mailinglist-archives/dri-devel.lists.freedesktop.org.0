Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B6758ABE0
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 15:54:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A46A3B59BD;
	Fri,  5 Aug 2022 13:54:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150045.outbound.protection.outlook.com [40.107.15.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 930B0B5941
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Aug 2022 13:53:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JjyhZ0z/CWoKKqzcllnhFa2Sao9NHZkkQOF17hTMdDQD4BrQYuRdH2BUk9dwI8MPIE0OAksONvV95DT0n7mCIU0evRzrDbxcKbSfVPZaJKUINbRGnWUkOpvMAiNeam/vAA5mFkyJ8VzzRRFVnElB/WcuWzPrAsEPTqq0hLMQw/I1u3DaEATvE+2kJ/ZdmkRD85346BWjsC/IGIYutfvDSHqYmplj3U2GFD9jM28hNNXngVpKzvtPlXsOCcojcs3Y7x2eFNShUIY/+Bz9xifi+snzfAwP88307IJ22LPCUjiGfjdp+7YR4NsBxDsymDjvokQspAfVBirWdHHPq6Q18A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pIjN/bnKGnOwlZ4dWOa3LrUcdmoHgjANZK2yYtw9AGE=;
 b=ihxS0uxLHWaWKjzokWnTzocIps10KabczrQ5Hj37nspzDDMNLJpFauNWF5OJEijZK0UGDaAOK9q5v7JGDoXDSb25EAjH3nN66URnR3n9kQOaeURlSMrqNcW0p2LusWdLSPT89MvMrAFjsW8T4056+O/HlI3W1MqDgGXWxuB4DkQCq1v/ksWxRH2huNgiHEw7Morc5bV6EF7o2x9eDpVlWXnkXyaABSl/pd0j7vKIkhunz70b1AI/x7QrhjMP/CGGwobXCq+17z2MBUjIkg6xB3rYGbGGmTCPncHG/CHatrNTKXQwchP6tCppfMrSHgvDqCxvmU7AN7mvUrcp6l4mcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pIjN/bnKGnOwlZ4dWOa3LrUcdmoHgjANZK2yYtw9AGE=;
 b=gIIUr2iqLNm8RmyRU8KZ/p4sl+xZYk/mMTxhCFTwem4aQ6bKSYM8BmEINK/ghM53/DcZUJbETpg2xnyGqsGK4Y0IJiUh9GTWMEQe/krAVJNX/th5lAjsvsjX+BTr/Ax94LD1+q4lds+bcmZARQiJkfi8mhR9b5o0z4Gpuuel4RA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6743.eurprd04.prod.outlook.com (2603:10a6:20b:f1::11)
 by AM6PR04MB5861.eurprd04.prod.outlook.com (2603:10a6:20b:a3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Fri, 5 Aug
 2022 13:53:42 +0000
Received: from AM6PR04MB6743.eurprd04.prod.outlook.com
 ([fe80::4cae:16ea:e349:6532]) by AM6PR04MB6743.eurprd04.prod.outlook.com
 ([fe80::4cae:16ea:e349:6532%3]) with mapi id 15.20.5504.014; Fri, 5 Aug 2022
 13:53:42 +0000
From: Olivier Masse <olivier.masse@nxp.com>
To: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
 Brian.Starkey@arm.com, christian.koenig@amd.com,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] plat-hikey: Add linaro,secure-heap compatible
Date: Fri,  5 Aug 2022 15:53:30 +0200
Message-Id: <20220805135330.970-4-olivier.masse@nxp.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20220805135330.970-1-olivier.masse@nxp.com>
References: <20220805135330.970-1-olivier.masse@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0017.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d0::7) To AM6PR04MB6743.eurprd04.prod.outlook.com
 (2603:10a6:20b:f1::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fae4d13-4e27-4198-dc1d-08da76e9e82b
X-MS-TrafficTypeDiagnostic: AM6PR04MB5861:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ii9nqunIJo5lH9AKYQOCwUEoB+vWW6ZdnjBYr1TVhLwaohoZITLuSgABEEWZwbxEm9LDpLhOPy8jT0T+Bh2MM4j6mcAllJSPedy9o5fWjGfjONOn408E476pmc1vONwYxHa9TW5NmuZz43R2fV68G6Z7RV3gGa7hWTOFyWItCaSUp4KoiHIt4qMI2jt/WALTH6ZmJiBu6IvLQXC0JQypbhgvJppIkYVFXDZWqRsz1APyrOJtfsWDEdB9834YErUc4P2mTMoJFhJf9WmKk4qxDVRDiRxkVjw9J4S+tGuTVidRTEM8d6m8EHRSCtjb4NzL0FmvmcET5iBAONhq2aEc1vFEF+xMzyVs9mph9M7V+Vwjp2dZaw/3cb91w1U0RMQjDX5n5kneII7LechE3c7aQcMHhUuWMLGU713hXRvGIJARyGaikktUjcdIvfoJ7kXE3cvm0rljjNlzMhgZD2fYHSI5BPL6QotmPWMEJ9F2NfUGduM7E74bB57AJ/VTjS1JtExVgLPojXsMkxvEnrj1BGhKRkwsGm1C7Ljew+aV8FWE/ORXUPnHSFRq5t5U4GE0RzGanOXxbBMBrgzpSx0c3Cqm89/KGH+FrzSxhY6eqX7ofqjh1nHJy5CO0S8+ShakQLByHr0MwQ2Hrn9/+9XqoqourT27hrtJqdOy60gRbDnl35fuQPZiBhZkWDMbz1dvChgVVY28pOGHdhmm+CMkZp4GPGhIuwJavxLzvG0zG8ssg1TBwL97yqHcx5Z3m7VBsurPw4PLXip2XnNbyTVryotKcbFis13nBvWxq9uPDw0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB6743.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(366004)(39860400002)(136003)(376002)(86362001)(36756003)(38350700002)(38100700002)(6506007)(6666004)(6512007)(55236004)(2616005)(26005)(41300700001)(1076003)(186003)(478600001)(52116002)(66556008)(316002)(4326008)(66946007)(6486002)(8676002)(66476007)(5660300002)(44832011)(2906002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+lcd11fLU1HYoRb5RPdYVJcO/DgIfiRl/wzruv3vng0O0Mcwa3fiTPoVCzqF?=
 =?us-ascii?Q?tqa2dpHw6jpbBupgtVYNTNg/O6Cgmogd7IOI/iA5c/sf19ZqzqhYlWEbkonl?=
 =?us-ascii?Q?XtXSqNHEee3jdXRTj9hOfRp/6z2Zf5cRDuTvx2j/vgEk1oTFDOUahPHMCWi1?=
 =?us-ascii?Q?9vMIy77lz2ly0XcN82LChFVG7JD0rl1Vflj5EuwjtSz9Bv45lZulzwj+rRdp?=
 =?us-ascii?Q?8L7JPLJwp7WmZlRwX1+SkktFF72vO9zOJn441yG9p+Q8l/1lb6Ai9o9RUFWp?=
 =?us-ascii?Q?1wiVH7O9AxF1kKVMpPqoXKMsnTPVIQjOPMevh0YZsNiZuzMGwwyS6/8b6uHF?=
 =?us-ascii?Q?lmwI78Q7SfmqLCOSQdz2re4ZUIRZnUEpcVND/vzpdVI6tL7sOaQrytminKRw?=
 =?us-ascii?Q?r9vMotQe95A0fZvtlNbfb8/njgCzVntgdqyQyBF+Aqtcj74hcbf42elBYT94?=
 =?us-ascii?Q?CXMRL8ZQAmSApqeIRWjzRDYhtXyWLjPW8REGVS2Nu9uS+E7/s4xILPBME3sH?=
 =?us-ascii?Q?2dY3ptP/gMyGFH8+GaQaLnNhwyVQc9LTTPZ+/4y65D5P/lqEVzfCUu9PLYLA?=
 =?us-ascii?Q?LOLQfX4STElMfTslPqUgfnmuSNaxR52tmppULCRuHQXLOfmmCXnieuFKmpsg?=
 =?us-ascii?Q?Dk0msHERv3dehF5POvTwpEeEMmzoBsnE8oNBEVJA2IW3oPY2D/tXHQI2SAG+?=
 =?us-ascii?Q?5PtORg/pwaKp2HJ3G7YiAmS5xkuALAccn51kGYwn0MdlFo8ktG+eMTxvHtj8?=
 =?us-ascii?Q?2zLFEJSULt7okcwcb8Riq9Rvet8ZlpmWvVbUkUhKmTr4JiCbQyutI1YK1vpT?=
 =?us-ascii?Q?q97CzFyj8VzhKUnHCYuweGHp/9lIRVC/upvpooQACYdMIDzi0JtRYIA4yv94?=
 =?us-ascii?Q?GTt3iYzn1En+ELPo+jCR8WimHbzRx3MzpnkdK88xY/vaRGebjHXApqd0cP8a?=
 =?us-ascii?Q?49FZckRJimKC+JaNwh7dwF4TGbDBNJmDuCLUTme/hPCILknsYrGI2CqC5CO1?=
 =?us-ascii?Q?H9SD3e2+O/2wTZewWvPc7e/y6qT6uEVEgYFFaYc06NIUi7wSR/wCYhFii6AL?=
 =?us-ascii?Q?37GyBXbFqfvLLgwF/dOxS5jQpEsuplJgOEExv9NCtH25GprU3DoAEoKVteqB?=
 =?us-ascii?Q?3QFVEXPte0GFZjLAMs0yJ/EWRUQxlMnq2gRuzYIiTahIa6zb9Vl7v9cepKVj?=
 =?us-ascii?Q?J8QDhroBvvaxLvyJZ+Cdddyv0qUkejahLFrzOX+Zv++Jl7UnsVkG5DmidFfc?=
 =?us-ascii?Q?d/AbGDeTbd5flQI33X8atjLi36FCO+6D/AAddBCcHAcrSUQCamTF/LwLBUmh?=
 =?us-ascii?Q?eXyqJsxV+So8576a6kV8AG5Ivhg/5LsfAwdrh6Z1V2BgO6hmmAMJnFyCZ+Ja?=
 =?us-ascii?Q?ODpwyt0L9IJKW0X0hkoE6cwpq0LPBY7z0ZTY2HlZ5aE9I/y5Fs8mGOmnagCL?=
 =?us-ascii?Q?gujWy5gSPxhFab2IvbQ6ZkhgS5DOHCA0LMPWAJzX4hGG1UJ2Hs2ZUWGskPKc?=
 =?us-ascii?Q?ung4ZkwLemuCaMX+7q+pM9Zo+wX6lSS2uNKxGp56vKnFnVdmcETTvrY6hNdU?=
 =?us-ascii?Q?wp2RuRT49PwG+FkDTvhogk5W0xmgwLO8ni0S3plT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fae4d13-4e27-4198-dc1d-08da76e9e82b
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 13:53:42.2242 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EB4gAADMiOa9dYaOJAp3qxHD/ah3ziWBHa2k3kMwGbxBKlszNpCCUS4n4A0zokc5bM4Vx1ofGrpFBZuldKh+EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5861
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
Cc: clement.faure@nxp.com, olivier.masse@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add DMABUF_HEAPS_SECURE in defconfig

Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
---
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts | 11 +++++++++++
 arch/arm64/configs/defconfig                   |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
index 3df2afb2f637..e4af0d914279 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
@@ -258,6 +258,17 @@ optee {
 		};
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		sdp@3e800000 {
+			compatible = "linaro,secure-heap";
+			no-map;
+			reg = <0 0x3E800000 0 0x00400000>;
+		};
+	};
+
 	sound_card {
 		compatible = "audio-graph-card";
 		dais = <&i2s0_port0>;
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c09b07c22d57..ffdc45acef94 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1465,6 +1465,8 @@ CONFIG_CRYPTO_DEV_HISI_SEC2=m
 CONFIG_CRYPTO_DEV_HISI_ZIP=m
 CONFIG_CRYPTO_DEV_HISI_HPRE=m
 CONFIG_CRYPTO_DEV_HISI_TRNG=m
+CONFIG_DMABUF_HEAPS=y
+CONFIG_DMABUF_HEAPS_SECURE=y
 CONFIG_CMA_SIZE_MBYTES=32
 CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_KERNEL=y
-- 
2.25.0

