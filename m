Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EC7B49B38
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 22:48:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A35C110E5D7;
	Mon,  8 Sep 2025 20:48:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=keysight.com header.i=@keysight.com header.b="Ccivwo58";
	dkim=pass (1024-bit key; unprotected) header.d=keysight.com header.i=@keysight.com header.b="B5/so5Ft";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 677 seconds by postgrey-1.36 at gabe;
 Mon, 08 Sep 2025 20:48:35 UTC
Received: from mx0a-003cac01.pphosted.com (mx0a-003cac01.pphosted.com
 [205.220.161.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B991510E209
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 20:48:35 +0000 (UTC)
Received: from pps.filterd (m0187212.ppops.net [127.0.0.1])
 by mx0b-003cac01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588Au9V4006259;
 Mon, 8 Sep 2025 13:36:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=ppfeb2020; bh=
 Iz5PD2mMZr+BAzeTvIerfZslEtrsG+fvv0+eLyfatIU=; b=Ccivwo58oQaBYK2w
 L3E22h7sz+FfquNHGOYJOtg9WZ/dD4Nu5XNuZrcNTrDPSjO+M1KO3IVo9abrl0ZE
 zEyQB5uBEqi/YkubQ3ij9MQikMFWxuHX/U/zZucicg7qeOBfCpd7oiQvHHum05Ct
 McYKZ0/ZhSW42OeuapSUdvZ8a5By6p9GrSAH+QYwOSBXCVpDJ4JRrekoob0YmcEQ
 KpIaA6N6CH7/HuC1lzs6034fF06EO4kOH/DPUpiLA0hbOvZuW83GBDpppSRxAzs3
 P2mzsiViQ8v1Cjz8AHMsEfpEeEWXJwTJR7OI0zi/W8zLTRQj/48Igk+2eRPY8Yzv
 8HLezg==
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2044.outbound.protection.outlook.com [40.107.102.44])
 by mx0b-003cac01.pphosted.com (PPS) with ESMTPS id 490vuc3p3y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Sep 2025 13:36:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J8W0Xzcaql+EzEyeXEw1FGat/uZGWpU14ZlVb8LTFyNqg6/kFDFTLZ2KCUrBuMnrlzefrlqgc14JU90Vu34hqrLb3vtah9FO0BhQ9jH0ieroZElRJKGVcoakls2JtZY3QCjFMDDrgq8+TfV/Th2Mp775OX+7oulZPeBd9gWK7pfLw3gI90UsK5d543+LyrWcvhF3wCkltEMeN9C4r1JoR3HF82m41OgE7tM461Q+R3SYi1//fEL67mF7lKWaF6zcLuIUE1/Hcwr6LfIXakG3TqgTXbsY/bQTKn6/2MhYujwlKWHiwYmafZ/o2pjbTcwDLpRgyNti/RoeQ7wMX8jOfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iz5PD2mMZr+BAzeTvIerfZslEtrsG+fvv0+eLyfatIU=;
 b=KkqzlbcobleUlFfUDiSj9e1SY9NrT++bwdCNRWejtINiow7CDrWz2J5kLOjoYUo4JMjp4/yqG1vk94X5qpbrGwkqD4B9RAVO1MfMMhvxHQuZFqFcBJ5alnPeBjuJh+vUkmijFDGkYiYmFke2eqt/GT9VhDEselHRIQA3oJfPm2LbpWJ4/yReHhPC96cdzBu2lc4AKzmzovbs/lu8KVieYknEt468r3plMEaopRlpwTe3O52xWubwelI5F0GryE6Y0EZiybJz2k+NjtmDEc469E6TBh3hJPA5vhKQO7TClU5+Zmq3CBLvoUYUjrRMev3lPeXRxSEY64+2XrEP9I4zjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iz5PD2mMZr+BAzeTvIerfZslEtrsG+fvv0+eLyfatIU=;
 b=B5/so5Ft5iAQVUBYcYvxtIvk0BUR9fr4Oyg/FfikhOZyKRSU8KbfyHjfYIpmNdZRVth1WD+ANxmxANBGbfVJ8MjpPVcQ3IYL9X6I78+SjALP7u2J9ET439srMptR0KE5fsa4fhCJy6WzD2mzzBBiNbWgnOrJuz0PFWtPl74+ShE=
Received: from PH7PR17MB6130.namprd17.prod.outlook.com (2603:10b6:510:1f5::17)
 by MW4PR17MB4603.namprd17.prod.outlook.com (2603:10b6:303:100::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 8 Sep
 2025 20:36:55 +0000
Received: from PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::54bb:3a4f:5f80:a51e]) by PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::54bb:3a4f:5f80:a51e%5]) with mapi id 15.20.9073.026; Mon, 8 Sep 2025
 20:36:55 +0000
From: John Ripple <john.ripple@keysight.com>
To: dianders@chromium.org
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 andrzej.hajda@intel.com, dri-devel@lists.freedesktop.org,
 jernej.skrabec@gmail.com, john.ripple@keysight.com, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, neil.armstrong@linaro.org, rfoss@kernel.org,
 simona@ffwll.ch, tzimmermann@suse.de, blake.vermeer@keysight.com,
 matt_laubhan@keysight.com
Subject: [PATCH V2] drm/bridge: ti-sn65dsi86: Add support for DisplayPort mode
 with HPD
Date: Mon,  8 Sep 2025 14:36:27 -0600
Message-ID: <20250908203627.3750794-1-john.ripple@keysight.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <CAD=FV=WiORm+rawNZoinXFZWdt_yqKQfTFWCiBcJFyJKXj4spQ@mail.gmail.com>
References: <CAD=FV=WiORm+rawNZoinXFZWdt_yqKQfTFWCiBcJFyJKXj4spQ@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:510:339::16) To PH7PR17MB6130.namprd17.prod.outlook.com
 (2603:10b6:510:1f5::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR17MB6130:EE_|MW4PR17MB4603:EE_
X-MS-Office365-Filtering-Correlation-Id: 3473a753-31be-49aa-8304-08ddef177319
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?g2bdzAKfRQC0MuJfdlw469Gwr+lB4qBD4YwBJzZC4L5M2dmpcAi3rpnFCKxq?=
 =?us-ascii?Q?ZIqMeZefCB7SakaQ3UWZqvkQtLflNI59U/t3Wka2q4/TKDtHzLGzxzPEcJOS?=
 =?us-ascii?Q?CeSX59o2nsWyyM7RV3Q0UzNd/CQHQV5d/CSsZT220L1w2YDlZ2sT+di4az62?=
 =?us-ascii?Q?j9STppsnw/giZ2QJm6UhdERQ08Sv15he7BrMwengaJlf/J2BPk6Cossv1fnr?=
 =?us-ascii?Q?aiD0GJy93WzqxM6bAxw2GB0QLjZ9XHSf9UTIT0w+KMw+RponKrKMSpM856dB?=
 =?us-ascii?Q?Z6OoSOV44nIGNhob+2D6nRyqDpZbgYGTo+AMOoUpw273SvNijdbTfWv7smTQ?=
 =?us-ascii?Q?DKMBQ3IwgSB5u5yK/wxm3DQ+HjkCcZaDWRaExwfOsfXz35xgfKy6Es/vBXnK?=
 =?us-ascii?Q?s2tLS74T8Vkthszt2MnBqxP9nAzUKLfY2ApZ8KRiE4XxYXKyYouF/pDdU/dK?=
 =?us-ascii?Q?aQmBcuTFPQpecHMwgOXKeQa0eKTGtpL6rPmDgb2ygw1L8GswRIIj1VofgvJ9?=
 =?us-ascii?Q?W5kCRGyfltdEQepKYRNVpOQpRZTQATorjXdzjw2KDl14z5Yg+UVt0CZ0gfyX?=
 =?us-ascii?Q?gnQWbbbI0p9rLrAMAHN+Vn4kr+Y91D/6L2OvcScdBRxfdBJxQWl1c2XAsD6u?=
 =?us-ascii?Q?Jvof3fpQqWuwgGwR6GTPHGh5eWiu4MpMdPWK7+oLvtNsYJjN65YoVC5n2v6Y?=
 =?us-ascii?Q?SRtSqf3dXdeJKHWhEpC3TwEr5sOOD5pEUn12lvw3lBrMjkoVNs7zWOs16Lvz?=
 =?us-ascii?Q?sdezUgtDcS2iYAq8okosFzASNf+xG761Ndr3XjiPyTvWR90Mm1nnSvy0X+Rf?=
 =?us-ascii?Q?lm3LsM39Eh+KCvKZJORtNo3rKjsri4AZsGL6RW8YCuHHyOfIjKp6IK+Amj7K?=
 =?us-ascii?Q?Wq6jA6fLak/LPbQGXnTC15FmB6cjCpgXmlCyA7x6ECkdwyoMQEjjgNOoyx84?=
 =?us-ascii?Q?8kgoKZyDz1FrviX+dCBbqxGySbVKhGscVvT+C0J+wgB0U0tWalB9PF4yGXgf?=
 =?us-ascii?Q?FaCDAjH2DJ3LMHq7UHdU5UKw63ULdyzAZnBmBREUQWnfSO9+/Y6OtLM4bm2o?=
 =?us-ascii?Q?UKIYdHIZUImtsRuoaGeCxaHMrRojChwHPDznBh6ZZIAPY/WrylRTrPeJKlGt?=
 =?us-ascii?Q?gOuu2ajg43aHRKwFV5aQwPUoVvk/R/hF3Sq7tVxgt3cfU/nkvA0/66jjXGkN?=
 =?us-ascii?Q?kMwgc5tzv5aGWcUTclLvEM0NUpZT9dDuByBAgVZyUtI6lPCvRV44hGrd/sPS?=
 =?us-ascii?Q?siGEu+wsTIpOmmulgph3RALjL7s3etBgVbYRW3l0IIel3oBWkfD5GhYBRmxN?=
 =?us-ascii?Q?PUGkaT2gXGhTJvsE/I8/WUBTiecc8/rc6GpXuQ8c3SWgNOlNyECK/0F6dxtC?=
 =?us-ascii?Q?0BXtvFy9oirFOTHqrhBwtT7FfUO+/sn9tH0RofMPMv/vjGcJ2PTXKEclLSid?=
 =?us-ascii?Q?+7l9A2FIWH4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR17MB6130.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cklpwFEYvn9fM2zOUbf+Wx42BgT1gvlc/Q5aGjqiwY3ZVxCYAcMMz5GszeG9?=
 =?us-ascii?Q?JpNxmAObrZNQwIHPiETK6GM1UodJ7AF3Rx0lY/uGa43ShNdWIL0YnlVK5AHK?=
 =?us-ascii?Q?IwEnDTWEuXhUYtGJQLFPyyqng+O25QkfNqeUkMBefzkuBftYIVoe3PUxAXxb?=
 =?us-ascii?Q?mwghjSDyUGps97gaAIB51HwRDBq2zzRk44gTYQKNk/vDko3ZfcR8+7rQANKs?=
 =?us-ascii?Q?Wt4TqlhyvDHAMOTWRs6Z9MroahsnBMmLFPTUoGCaF3QyKOe5LGLVeH43p4s/?=
 =?us-ascii?Q?ESI41EL5R22dW79RJ2pIWxzOhNfkSdtVpttOT/yrcxTrTAZuyjKZFGloyA/p?=
 =?us-ascii?Q?YykBxytptOpF3UxH9IB7jrsH66SQ3XyFUeQFiWp7sZW8ePRxUo6W1EX/56kC?=
 =?us-ascii?Q?K14b2MNEmTyQZV93G2G+Wi6gHkdtNILVK7I4wMzMmHBc7XL3Dean8z98QNtp?=
 =?us-ascii?Q?rrPuWE5zzkB5WINJTLoqLLG4X3HwCxRIWakZ3lnq1MbF9r3XmIRU4kyUNcHP?=
 =?us-ascii?Q?zYAMt+72nZWcLEbI2e9q0mDOZ7LzQu0xjxhBixY7J+bK/aqtFrPNuUMJbxxp?=
 =?us-ascii?Q?pj+Tfsn4P173lB4GCVpR2Exqwm0x18ugE5AtCC+tCii3JgBbpDtmaVc7ahFa?=
 =?us-ascii?Q?Uia7DCe64tjY7Lx4iFWwTMtyZSeoiU5dgdqitz5A452lEzit62hfDwr4OZyO?=
 =?us-ascii?Q?mlSnbuQu2H+rad9Gm4PKGf+cOxwxXS1MnN79qTYyw298vGw7OWQIag0qLL7J?=
 =?us-ascii?Q?4K3SJjgThWN2LxV0E0p3F2LG3WDd8f9xsA7aDUxoW20SmrDzGTdFCqgNwcrC?=
 =?us-ascii?Q?Qyh71Hmg1tRhErbR3jMbFbzzYBF7kAS1Ljwqv1viARAVJ6urK8COLVEfQH6W?=
 =?us-ascii?Q?1yTSorMxD9nzjirUSNaoiwBhHqiG5THRsyDUEBa5wB6GgvFigCeVJbCnnutw?=
 =?us-ascii?Q?QZz2RQsDFy25vc7ASNkgWgfQC4NMF3DuOk6vam1ZCoHfVHrEv7MyijcK1sbM?=
 =?us-ascii?Q?n4PXbghew0IjTzsHtcSo9EcDqBDVMKhrCy7CgPLXJojKT8Tg8WRHg4KC7Bvf?=
 =?us-ascii?Q?UdrWflTv9/yMFAGzWCJj2PLQb2HKqsN5sAEVlred7yDPu+RhlDgx20PCCOng?=
 =?us-ascii?Q?+yb2kl11nxE1Z74txVFax7/xkaQQspzi/391GQeF1aHKayXku3EWVYWCXK/D?=
 =?us-ascii?Q?q652xIJXlZ3GBKNJbuewBDpYjAOli38bZUJkxPUUvKNT08FXFyKOfPaxK2es?=
 =?us-ascii?Q?vfgPsYEbjJj8167pvCvTO1lw8JzvWKMxCLzJxtnBDQaJubfovKqabbSWlXi8?=
 =?us-ascii?Q?T5/OwzrPNFWDks0ZUUKU04wvqN0frAiHPvEOb4cUTlqna0bHXj0mGymYpxaW?=
 =?us-ascii?Q?CDWl7IXtpjpnxVGkcjdWoNRpIPJbwEQ6TDQ+8+sHh5F9oVPB8BidgYryIe5X?=
 =?us-ascii?Q?oLSXMPmVeBboTuhI7drAg6Y/wol//BAGcZgpaDkAxSH8sGib/+ruJAxnBzj6?=
 =?us-ascii?Q?ggr0cV4d3Kf52JKr/Tptz/9J+c4OvMNYHNWP/uY2++A441yNM6X7pQdb8guI?=
 =?us-ascii?Q?fVipKWJuK7yuLpko/K0JzXd54bI5x28elqd/45meIcbUR1cn226YRNfiB5J2?=
 =?us-ascii?Q?Sg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: TX6LRLSjLHKv3CdFPPV711hrThi2nbEZNGs7/6zJKUYVLMOhBJyuMEJWBHUB9r34TNZjdTYpKd/55j28ovVNPannVx1KAyZ5s+zZZ4LM1TNkoK9o8DYgv4OV3SLxXx/6qIE9nULHfYo26H7MthCzlYN+OusIKVXP+t6R/NcufMXGZies1WOjaRVOUJfwGJdTRHmEnUHQM/e1AFN1QMD7/UV0SMqJkkN9xb6qwF1GELZ4ax7w+8WNlUqlJvcVvE/4dmNjtkXkK9J3+rix1sjQnM02yP4/sctA3eTSP5/q3oVvXYaaEIubXvOGGsMNZZUXRgacjeaLO9++8gdMe79lz4pDgB1tFFOYVThcnbyJqDYd/bNUdDu+1O6G2LXA5jamTSn1Vk0AkIfvgYe6f8lzpEEULAELjVUZ6JttpyPCsnfnYkekN1PGD/71UYp0vAAclPpRiXiZEppY5SOSNAXyM265mSXI3nY9akEju1kjcCNakC3h8zhYRgcv+u9zdPNi9XQVqyaSPrxU9GOCNJ6NrJO1JlqIE8jK+VRCZnTD0nuwaCN1fdkMiZko59FPz2OcSnCwO7bNKtFqFBqGgWAIHY3aKQcu/okJrCS8X5fQeEBy92JEklVdMj6BaW57RLiU
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3473a753-31be-49aa-8304-08ddef177319
X-MS-Exchange-CrossTenant-AuthSource: PH7PR17MB6130.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 20:36:55.2559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q0WMIlZ8p74FW922+dzEdhQ+dWV9DOgsimBHcipln/jgiZ8cTZdb54Za3QhNlWYYWW451qawc5JBA4lWpM1o3MoA6P0yrPqR8Qw5BVNz9M4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR17MB4603
X-Proofpoint-ORIG-GUID: lSBTz4C1tPnkB-jJ5BlNiIHgOcrxSB8R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDIwOSBTYWx0ZWRfXyYm9F4Hakj8z
 dAC/oat/J5f5QxYqKjHczyassMwbW6JTi+w5NZQk4Cnr7T1Balvg1rSggkavbFEL6gUwqyltCp6
 i8+GwFra8ov26RXCZvUNjzIuM/WzsBTVEHavBEKiKZilA+AWs17vKG48JDHo9gQU/YzDWRvCXaJ
 sfGGJtcHQKXcvaYwBgXhDblW25dBykwCLfxqhMT3TffMvZSnaCjzdUbxr8fNg1mPaBQ0J6hhxp2
 0Dgyal3DPmp3sjImt2UCxrbhWrT0hqJaCL0hAbfKsvgu93sc7qpPYIChFDhYLZ4xhepjhpHWoci
 SOTRPTOl6O+Rz9kCbCft4BKp+zXuEKbjhz7ZoH+zm7TCms5tz4+uDRd7vob1zdfvaFynF0P4mkP
 EWU5gXBo
X-Proofpoint-GUID: lSBTz4C1tPnkB-jJ5BlNiIHgOcrxSB8R
X-Authority-Analysis: v=2.4 cv=AK4OiUyy c=1 sm=1 tr=0 ts=68bf3e6a cx=c_pps
 a=QWqdXKTD4x5QpoVJet23Jw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=vu2TTH8h0NUA:10 a=F6MVbVVLAAAA:8
 a=orcqaJynPNwP7jjD-jAA:9 a=6mxfPxaA-CAxv1z-Kq-J:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060209
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

Add support for DisplayPort to the bridge, which entails the following:
- Get and use an interrupt for HPD;
- Properly clear all status bits in the interrupt handler;

Signed-off-by: John Ripple <john.ripple@keysight.com>
---
V1 -> V2: Cleaned up coding style and addressed review comments

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 93 +++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index ae0d08e5e960..ad0393212279 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -106,10 +106,24 @@
 #define SN_PWM_EN_INV_REG			0xA5
 #define  SN_PWM_INV_MASK			BIT(0)
 #define  SN_PWM_EN_MASK				BIT(1)
+
+#define SN_IRQ_EN_REG				0xE0
+#define  IRQ_EN					BIT(0)
+
+#define SN_IRQ_EVENTS_EN_REG			0xE6
+#define  IRQ_HPD_EN				BIT(0)
+#define  HPD_INSERTION_EN			BIT(1)
+#define  HPD_REMOVAL_EN				BIT(2)
+#define  HPD_REPLUG_EN				BIT(3)
+#define  PLL_UNLOCK_EN				BIT(5)
+
 #define SN_AUX_CMD_STATUS_REG			0xF4
 #define  AUX_IRQ_STATUS_AUX_RPLY_TOUT		BIT(3)
 #define  AUX_IRQ_STATUS_AUX_SHORT		BIT(5)
 #define  AUX_IRQ_STATUS_NAT_I2C_FAIL		BIT(6)
+#define SN_IRQ_STATUS_REG			0xF5
+#define  HPD_REMOVAL_STATUS			BIT(2)
+#define  HPD_INSERTION_STATUS			BIT(1)
 
 #define MIN_DSI_CLK_FREQ_MHZ	40
 
@@ -221,6 +235,19 @@ static const struct regmap_config ti_sn65dsi86_regmap_config = {
 	.max_register = 0xFF,
 };
 
+static int ti_sn65dsi86_read(struct ti_sn65dsi86 *pdata, unsigned int reg,
+			     unsigned int *val)
+{
+	int ret;
+
+	ret = regmap_read(pdata->regmap, reg, val);
+	if (ret)
+		dev_err(pdata->dev, "fail to read raw reg %x: %d\n",
+			reg, ret);
+
+	return ret;
+}
+
 static int __maybe_unused ti_sn65dsi86_read_u16(struct ti_sn65dsi86 *pdata,
 						unsigned int reg, u16 *val)
 {
@@ -1219,12 +1246,28 @@ static void ti_sn_bridge_hpd_enable(struct drm_bridge *bridge)
 	 */
 
 	pm_runtime_get_sync(pdata->dev);
+
+	/* Enable HPD and PLL events. */
+	regmap_write(pdata->regmap, SN_IRQ_EVENTS_EN_REG,
+		     PLL_UNLOCK_EN |
+		     HPD_REPLUG_EN |
+		     HPD_REMOVAL_EN |
+		     HPD_INSERTION_EN |
+		     IRQ_HPD_EN);
+
+	regmap_update_bits(pdata->regmap, SN_IRQ_EN_REG, IRQ_EN,
+			   IRQ_EN);
 }
 
 static void ti_sn_bridge_hpd_disable(struct drm_bridge *bridge)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 
+	/* Disable HPD and PLL events. */
+	regmap_write(pdata->regmap, SN_IRQ_EVENTS_EN_REG, 0);
+
+	regmap_update_bits(pdata->regmap, SN_IRQ_EN_REG, IRQ_EN, 0);
+
 	pm_runtime_put_autosuspend(pdata->dev);
 }
 
@@ -1309,6 +1352,32 @@ static int ti_sn_bridge_parse_dsi_host(struct ti_sn65dsi86 *pdata)
 	return 0;
 }
 
+static irqreturn_t ti_sn_bridge_interrupt(int irq, void *private)
+{
+	struct ti_sn65dsi86 *pdata = private;
+	struct drm_device *dev = pdata->bridge.dev;
+	u32 status = 0;
+	bool hpd_event = false;
+	int ret = 0;
+
+	ret = ti_sn65dsi86_read(pdata, SN_IRQ_STATUS_REG, &status);
+	if (ret)
+		return ret;
+	hpd_event = status & (HPD_REMOVAL_STATUS | HPD_INSERTION_STATUS);
+	if (status) {
+		drm_dbg(dev, "(SN_IRQ_STATUS_REG = %#x)\n", status);
+		ret = regmap_write(pdata->regmap, SN_IRQ_STATUS_REG, status);
+		if (ret)
+			return ret;
+	}
+
+	/* Only send the HPD event if we are bound with a device. */
+	if (dev && hpd_event)
+		drm_kms_helper_hotplug_event(dev);
+
+	return IRQ_HANDLED;
+}
+
 static int ti_sn_bridge_probe(struct auxiliary_device *adev,
 			      const struct auxiliary_device_id *id)
 {
@@ -1971,6 +2040,30 @@ static int ti_sn65dsi86_probe(struct i2c_client *client)
 	if (strncmp(id_buf, "68ISD   ", ARRAY_SIZE(id_buf)))
 		return dev_err_probe(dev, -EOPNOTSUPP, "unsupported device id\n");
 
+	if (client->irq) {
+		enum drm_connector_status status;
+
+		ret = devm_request_threaded_irq(pdata->dev, client->irq, NULL,
+						ti_sn_bridge_interrupt,
+						IRQF_TRIGGER_RISING |
+						IRQF_TRIGGER_FALLING |
+						IRQF_ONESHOT,
+						"ti_sn65dsi86", pdata);
+		if (ret) {
+			return dev_err_probe(dev, ret,
+					     "failed to request interrupt\n");
+		}
+
+		/*
+		 * Cleaning status register at probe is needed because if the irq is
+		 * already high, the rising/falling condition will never occurs
+		 */
+		ret = ti_sn65dsi86_read(pdata, SN_IRQ_STATUS_REG, &status);
+		ret |= regmap_write(pdata->regmap, SN_IRQ_STATUS_REG, status);
+		if (ret)
+			pr_warn("Failed to clear IRQ initial state: %d\n", ret);
+	}
+
 	/*
 	 * Break ourselves up into a collection of aux devices. The only real
 	 * motiviation here is to solve the chicken-and-egg problem of probe
