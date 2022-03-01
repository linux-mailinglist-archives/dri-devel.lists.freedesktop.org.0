Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 445A24C85F9
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 09:11:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9495710EAB8;
	Tue,  1 Mar 2022 08:11:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7E7D10EAAD
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 08:11:39 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2213PXHd018824; 
 Tue, 1 Mar 2022 08:11:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=LxAHWZ+KT15zWgenfBkkVQdByDwFwu141s+I29i0r7g=;
 b=Ekun/sB2kuCtXx3wR5xJTyJkSFv6Kn5pgJOJI+NdTHPFGDlgQnw9B5nZR6/82tRWTqCo
 1rJl5wEHwnC2r2UdwJcm65bghuU/csEmaydOi9ytgdGZQMeBgUd0n1Jg9vzqcba7rQ/t
 Xyk5NC+in1Ueka9sQTpOTmcsy3cqh+q7eH+q10hK/fh5Wy3e9Xd2JB7iTmRzWqQ0dqEG
 5IjDlfH7HCy/+uIGwg5+VFpthb1BlPPbHMOMNBcqCAy6FSVso7XYGqNZVukVNO17jm5v
 ZXsc8UvBC8iBOyGU0YQ1iqEWAIsgtBVmS4YxGqvtQaWcqi+8K6u6g1j6R6JhDIjl1ffz PA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3eh15ahwx7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Mar 2022 08:11:21 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 2218AnTL105191;
 Tue, 1 Mar 2022 08:11:20 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
 by aserp3020.oracle.com with ESMTP id 3efc13wb7n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Mar 2022 08:11:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yrqqaw+M4fzJGXkc968+em74SOB/L3BC3r4MnLFypXSKl5SlP3NmpGFk8OuLRxsoH7fa4xtN4YJmTsld1GhhyTuAnWvXZFFdciDmqrg0wnVDWNC/zC6M9CgzV0oeBSHs8aspgOSwXUlR8N1MpROtJ4aKO3iurEq/YzRLFGxTkQ5SSXVgCmTOuRv9C1VrNNWM8QDv1xB3CwU+hNQG4TbdCI43O1lWJbf1dlx4bnTs8QlduFp0rW5Bm9WwZeMldyqE9TC7w0X5cd2bGvPrKfKJ6pH00fUGoFE114pDhGUe6TRwGvM8/pnAPyFQRVSEHbFfPCANxRZiAd5C/HWx59RWKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LxAHWZ+KT15zWgenfBkkVQdByDwFwu141s+I29i0r7g=;
 b=AgswtsZJ4tzShVjNMlb2yal5GN2got9wa3BrmZZ96G8Oeo8qx/pEsUee6SsEY28ye/ZExGZuGccKNn23xf+WJKr462Bk9m5+KBylOQ9Me5l+0GLBPt8+CX599MQtW7+8+xuPxOi9UQQ82vLJ7F06drSz3YOq9BUaToHjyYyQV0QGVxbksg85y0ySKPz7Pogw0DwSMdy6RET4ikb2h7XCgBxNNaMzvz96SKkwlXNbyVKckvFLmGjmy7kMsufU5UaTRj67AvJVvtrrv/G0Ag7zwvLd0RqOnWR/odr01ZGsoKDhFTr8selU3b8OUGIXm4R4COWUN1HF65GjnjEmTcu2cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LxAHWZ+KT15zWgenfBkkVQdByDwFwu141s+I29i0r7g=;
 b=NocokS5+ih64C/6pvXLSixrcaIZ8pIuaGMGD5oB7ieRaipHGHLxIs3F0JUQ/xD7cENQ0EAMxLQW9PLNWWnHejQe2YvQuWv9KX4K+xBWJ+jm7QkaeMuGYyN9u865lUgm4sYv09rOKjQ1jep66mD7dv2PfXG6lS2oXFbOtqi3cHss=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1760.namprd10.prod.outlook.com
 (2603:10b6:301:a::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.23; Tue, 1 Mar
 2022 08:11:17 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 08:11:17 +0000
Date: Tue, 1 Mar 2022 11:11:04 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: [PATCH] ASoC: qcom: Fix error code in lpass_platform_copy()
Message-ID: <20220301081104.GB17375@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0024.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::11) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11f5896d-f5ef-45bc-a24d-08d9fb5b0fa8
X-MS-TrafficTypeDiagnostic: MWHPR10MB1760:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB17602C997ED677D411F51EDF8E029@MWHPR10MB1760.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +zChlm6UsrYrt+KhUtMAR0OFa5Ya/zlKf88fq1BY0i6WGIL+UQrzNbyVvo89dj0vgWcRhTT58NYg6iCwU5cng52oFrgv1xnEk+sv2VoQWVHFug2Yxj5SoIKBG1HeEaD3uZQcA1DCg2nP2JIVREJH1EZ6AZcu/z2lg3oHTdtAyn/uXQcSalNAG41+zEJnayia1YBqrom+7dktsfe8A21ExCzaC1TePQqokp3O89jZFCt4mJEgTAbCeJeo4F3wAJFde/CLCKSeWhwJAqv1PGYanMsBYAhpVdQra/PcVPmyKzS0BcDE760A5Bamx/2Tia7CpYyXpGWym7dCZDYuka5q1HITciqhtTMsvleL9jwKYNrrUwUWOV3KQvDvvWZaOUayMiYUh/lGN3FfI4v2znkTPK6wEK5g4tp/uMtq4IhVXQvH+yXQz2iczd6VGjdbT6NkKvIHtf9abHWzqhCm+Ul2loIVGudHat1dcVcCT7/yLGIA1ArRPmTCfULFXaHIS2llMtEmdOHuqx7+/DhLNr66QC6CvygPSbzDB+hzinh4D4dmOtkq7Ljw75dMODZxAV3vSBVXsnnXudWk/G06/rM61pCLLy5JsiBVfjTGzm3ivMNSxiKiWLZv9CDofxIU5Atp1+NYIccWBy+HNbyGYCRJTh5uK86xR1D4azWfnYQVmfLS/uu5s0nHxvkKBpSq/Otsq4De9mpyU84EvcSWATTSgw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(33656002)(8936002)(86362001)(6486002)(508600001)(2906002)(38100700002)(7416002)(38350700002)(5660300002)(186003)(44832011)(66946007)(66476007)(66556008)(4326008)(83380400001)(8676002)(26005)(316002)(52116002)(54906003)(9686003)(6512007)(1076003)(110136005)(6506007)(6666004)(33716001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G8p7VV9kuYDVY/YympCjcM9AfK808HdFh+Uh9GsatJ4qhvyKTGGyt5zUgpE4?=
 =?us-ascii?Q?WhV05nV9YoMHcTdRrceDsFnhHftK13ANoC1CprJx/6y+Dr7Wmuh4CX08pM/i?=
 =?us-ascii?Q?6jmfVlwJGixI3NmjMDxCZ0pGMRkCDR334BsLMaEVO0pIj5MqzFaz77lzRX7z?=
 =?us-ascii?Q?Re4gwwN52T4C/GUUEbRi+uaul/p8vUb2LB7Jd57J+BeOq2k7CTTdwC5sIVTV?=
 =?us-ascii?Q?rPpxzuZpD3OlBzH2RtIXv8GYVsS8+KhXiduSVJfofCIXxRHYpKSuhmP+SPOZ?=
 =?us-ascii?Q?/Y2zhGERC6k8Ns5scXR8FaHpFmFwBL7/qQEwWo8D+jiaaNnPoO8j6Jwa/G7+?=
 =?us-ascii?Q?LTR+kJCKoYDAkkU9V1WunAHCPM54J67d9DhXrvhk+feRTTBl8gcFmxVOZWla?=
 =?us-ascii?Q?/FY7LojtvqVMf6snUDM0tUjLSqbg3bj57va/Bvsd0yq/lh9Be9NCLHfs4nBG?=
 =?us-ascii?Q?uIDlAcVmjzyhokERgBcThJBQSPZySIXsy/W+8yhcVGPbaqEgVCHyujnBYJbk?=
 =?us-ascii?Q?4YeYyy3ICxE1afRvPhZ6LgTTtLH1Ugp8OWcywDcMaI5eEikRcGzY9c6dlMSK?=
 =?us-ascii?Q?HMpKMFWNS6alUb7HKEOQqZN06Ad+6sMxQ19ksmIex0o3KUFU24FjtHpopmSj?=
 =?us-ascii?Q?KIs/PtrRL348kZFCyCNUiGnXoWmdCSQ1/MfDC0fiV1nZsRoRcYBNPpgRkpzA?=
 =?us-ascii?Q?ZTZQk0co1YcVLkOO+U3noX847yzxrNZL7a6hhC+q1NWVDBfoF25bSELqfPTv?=
 =?us-ascii?Q?BBbnqP+AqltTpjO4pRAs7uC5Vz2jy3vmySODiNz0faz6lqglhzFaL1Og9qjZ?=
 =?us-ascii?Q?QAj+I8GEYM4OIL2b5GlJEMEv581H2Ef6/3LXjr3KaQQMzTJ7weg7x7mXbyAF?=
 =?us-ascii?Q?nNZ05EJltoABUOBPHXj9bFd2hD5MOA1vYaBVHUdaGa90HDMdul4w++mM2cQG?=
 =?us-ascii?Q?A18QDi2KEjp91S64ZKT7T5Ihi7JHEI8a5HqLXySe/KYFxk5H54Tgzng9TgfW?=
 =?us-ascii?Q?uOIE6zGyPxHa6Dob8T5JHhjCsAhNUt1ozjJbcrZ85Edgeu7j7B+Tcb5+4wb4?=
 =?us-ascii?Q?U1rTfjwNNK31jNtxXh02gWFyIOHQZTT8xaEO8H8KfIfLrakpZNbnseSf2WCS?=
 =?us-ascii?Q?PoshDdXnLpcV0++FwTNGedkVMMYfygfiXeFaM9DTOT4E4Jzv0+9WxHyiGl2r?=
 =?us-ascii?Q?Lw3XM786plpNcZvvq0vYUIYW0VKwW9dMaueDRqmVIyKQvaO68GH6xiE+un6F?=
 =?us-ascii?Q?US9thhw8gcmO1+H1JhVkzdwXBpydDIhZA0Skx/dzlrXyuIsMUuqqo/AAGl2Z?=
 =?us-ascii?Q?nSJ+5qRrihrN9UZF0r5EYFTOtLmQfbTTGgv3Wv5XSwZEwZlqKsep83wWASNd?=
 =?us-ascii?Q?X7WucXmfdPK9pTShaudFXobdKTuAcLCeCb1Fj0KvN2HeVjMUNMTTVnrueqcg?=
 =?us-ascii?Q?cEXJuZ9hyMbIXokGkhXysp9IzeixFHIe7Mmi/rDiNdUi3/S9sNSfdZpEm1+l?=
 =?us-ascii?Q?htSOfmE8AXUk/ysLs5A3U3ONOaKKMK9dV5v1oGdzFKkH+m76LkqbhYXbydUj?=
 =?us-ascii?Q?UkILL97BszEialc0E5Q6WgP7dRxIHgJuIJyM4aNkdnVZoatX6AugP7jEmBd+?=
 =?us-ascii?Q?mMSzQp2e8K5FNylrHNmxhkTYndBbjz14VnsY8hkWhM4vtF3ERcum0MwDzjLh?=
 =?us-ascii?Q?Ua1Zqg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11f5896d-f5ef-45bc-a24d-08d9fb5b0fa8
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 08:11:17.7628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t2Qs/+jCLpraWZ9/wzO3IuaU3YrAOLvW+hVra6mIJgociCqoyvDuue47pZtDU/uNyRTAd1SGELw0SBjRRjn5QRX9QmwXrs/f4hchb8jwdkc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1760
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10272
 signatures=684655
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 phishscore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2203010039
X-Proofpoint-ORIG-GUID: RofqWjqxV951meHF2wkFY3gyCztKbivN
X-Proofpoint-GUID: RofqWjqxV951meHF2wkFY3gyCztKbivN
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
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 linaro-mm-sig@lists.linaro.org, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The copy_to/from_user() functions return the number of bytes remaining
to be copied.  This function needs to return negative error codes
because snd_soc_pcm_component_copy_user() treats positive returns as
success in soc_component_ret().

Fixes: 7d7209557b67 ("ASoC: qcom: Add support for codec dma driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/qcom/lpass-platform.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index bf180a594c19..620312529c2f 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -1228,15 +1228,19 @@ static int lpass_platform_copy(struct snd_soc_component *component,
 				channel * (rt->dma_bytes / rt->channels));
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		if (is_cdc_dma_port(dai_id))
+		if (is_cdc_dma_port(dai_id)) {
 			ret = copy_from_user_toio(dma_buf, buf, bytes);
-		else
-			ret = copy_from_user((void __force *)dma_buf, buf, bytes);
+		} else {
+			if (copy_from_user((void __force *)dma_buf, buf, bytes))
+				ret = -EFAULT;
+		}
 	} else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
-		if (is_cdc_dma_port(dai_id))
+		if (is_cdc_dma_port(dai_id)) {
 			ret = copy_to_user_fromio(buf, dma_buf, bytes);
-		else
-			ret = copy_to_user(buf, (void __force *)dma_buf, bytes);
+		} else {
+			if (copy_to_user(buf, (void __force *)dma_buf, bytes))
+				ret = -EFAULT;
+		}
 	}
 
 	return ret;
-- 
2.20.1

