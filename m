Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 636E1406DE7
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 17:02:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C50706EA0E;
	Fri, 10 Sep 2021 15:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E49096EA05;
 Fri, 10 Sep 2021 14:10:35 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18AE0Bl8002800; 
 Fri, 10 Sep 2021 14:10:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2021-07-09;
 bh=2ZcJrkCuhFxQF8ZXme4R92GjV7X0OiJmDD0pJWtXt40=;
 b=OgVVvk5ESCL0KEVck1IMM/DP2HbSGJejMPCB86MdZpQtd+X1HfkPy6mBqrbUbpbbTTro
 haG8ePUHvVkY1nnkd4ASRCHB94QRs0LOOdsBTVRftMlhEwrmsAP3IQDoV7xsIBHQZYq9
 J5cA4i+PLdfYFG42FK63pxC5JQr74Vj8onVfARVOVgyo0rq3DNpNP0q+uGe3QytDk5aq
 8KRiIW66Kf53NUr/KOZrzIUKEpDq29nH41YBqSzjF93sIeOX0WqguhKasqrZNX3JEU+r
 AIvxyhrnMmXKyV5HXpGQtGFH41227OXY7Y6JTGlo1Kgdna2CLTtusmSt8zuPa7CqBxZY tw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2020-01-29;
 bh=2ZcJrkCuhFxQF8ZXme4R92GjV7X0OiJmDD0pJWtXt40=;
 b=iDieqEHDJ8WaRsSrjw45LS2KRe3QGh++EECogI3D8lCBckR0yPJ9eXf1ZGCuBlkjcPIo
 Zvl1nBun2bxodkpw/TyjKwlWYoaXyAXOjTl1ShIjg5RhDyST/8xcX4iexAQI4bWN8kYZ
 gvJFhpi4H8tqbXL+AaAxpCEAFqWFOcYKG/Bqjn5BmGDGCnzLDRZcdtMrtAYLN69zfwOd
 SX8mm1ATfu030mKrKVClVGEv94QSIDsf4466k7PUj2ekNpZKbYf1hLvnBkrD+hfKUPbh
 gGD+LOR1oqwjJHyVlc5pnJp37UnlIOx9lmkfxT13p2IEPs86RBSsHojLid5q0FPFLP8e Kg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3aytx4t0s9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Sep 2021 14:10:20 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18AE6CXO095044;
 Fri, 10 Sep 2021 14:10:19 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2042.outbound.protection.outlook.com [104.47.57.42])
 by aserp3020.oracle.com with ESMTP id 3aytfycb0m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Sep 2021 14:10:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lUg4hE7LSoeVE2WwWVC5y/mLg7W7VnRGyi6X+NnDEDNuBWUDVhRSYwhDhEO32t+I5ZJP1JMYHAaDWyg5lcdLmS+42SE+2kld/az+ETM1IB+A5Swvp0NJ1VI4DqOFAganLOciY1H3XNfhRHyKFq/dV8HZedUiGq5EGQs6rb82CZ/W1OmhtsxQTHferqXBk91zKbehgwIMNpQo3jzCkOrqYQISWE6chh5PTZsioiN/LD42jjVwdflQRf6hUkPNibz3SSVSChG7wOY9pYDkm65tQJ1jPr/h9WQOvk6wfRo5djBtJuUGn7FsoCNlJAFF1ZjRMKHOgwFf/EByuJ47gA53Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=2ZcJrkCuhFxQF8ZXme4R92GjV7X0OiJmDD0pJWtXt40=;
 b=fNYHp0SYliT7jJFoaMY3VltsxgJCRlQ7T9Z5LoauaxoQY1J9oLFr0xBunoe+spE2P8eBqaHK2zOYzxXkj6LTSSPY32wYVNuP3gFgVj3BAcJC61haUgQ/ZtMCRHOksMEeTgEUyb82tv/ZLw0a2w9SlfDDjbAmXsUWDjo8mjb9uX4aelay/t4ARZRehuar6KIm5pWfEnH5ULhKex1muCwxlV6itONLUWgtQnuLJfV+/84WI43+PZ7vEEsE9zQXXgS/oGLOnjzsqCooRwIPaw12MsQLNEai78D65Q613jMQNX22qE55lXsP0vC3gxH4EE3cWobpVGXWjBecjR6pRyMAEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ZcJrkCuhFxQF8ZXme4R92GjV7X0OiJmDD0pJWtXt40=;
 b=sJz+f4l0ptDf2/CaRMs5dhZuhgZQEIQN7k6JpC1fmptJFeZkHKsKCPBzsCpvxkm2xiF/TeXXj3zBWo1K0GI+h4YXgZNSKsm+UPS0iRz4cwSOONvp+Ev1qatQaJERQPLHg+hvGjTMi28Dac7FoPkFzPBebChBzTGlc/Q7ncX9zmw=
Authentication-Results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4468.namprd10.prod.outlook.com (2603:10b6:303:6c::24)
 by CO1PR10MB4707.namprd10.prod.outlook.com (2603:10b6:303:92::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Fri, 10 Sep
 2021 14:10:17 +0000
Received: from CO1PR10MB4468.namprd10.prod.outlook.com
 ([fe80::e1f7:a0f4:46c5:3df]) by CO1PR10MB4468.namprd10.prod.outlook.com
 ([fe80::e1f7:a0f4:46c5:3df%6]) with mapi id 15.20.4478.025; Fri, 10 Sep 2021
 14:10:17 +0000
From: Imran Khan <imran.f.khan@oracle.com>
To: vbabka@suse.cz, geert@linux-m68k.org, akpm@linux-foundation.org,
 ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
 dvyukov@google.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org
Subject: [PATCH 0/1] lib,
 stackdepot: Add helper to print stack entries into buffer.
Date: Sat, 11 Sep 2021 00:10:00 +1000
Message-Id: <20210910141001.1622130-1-imran.f.khan@oracle.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ME2PR01CA0181.ausprd01.prod.outlook.com
 (2603:10c6:220:20::25) To CO1PR10MB4468.namprd10.prod.outlook.com
 (2603:10b6:303:6c::24)
MIME-Version: 1.0
Received: from localhost.localdomain (110.33.47.182) by
 ME2PR01CA0181.ausprd01.prod.outlook.com (2603:10c6:220:20::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Fri, 10 Sep 2021 14:10:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e941f4be-1024-4add-334f-08d97464b75c
X-MS-TrafficTypeDiagnostic: CO1PR10MB4707:
X-Microsoft-Antispam-PRVS: <CO1PR10MB4707799E0CB601DF09619D97B0D69@CO1PR10MB4707.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KZUkeQ23cgO4gxWKAm9cuYTqR7JyjhOlJYXFM6HJTXNbMpTezYy4SQ+A20lBI10n36/XpNoR/racl0SNoN5ivrk+4jiwBOIuSqSUjsI5zl8UBbG8tMeR1jf6rRMU6JNw3i2MoHtrqBaWf88AOxmwamt3/d9/ZwRXuAKwQYb5xF1bJlIfkLYYwFWNKbwWSh2+ByuqfXS/sgBVvalR7pwCx43nDDyUkOkj7iwgriCq736r3E19kF9pw8sagJcZrioq9e/pnWcfoWC6ajXoxgKqtNLhbY64dHnC1PwvPtMzGlz+bXAvCFcQaHFteYhKwnkJLTljhVimpuqXttIxdVJ5fFfYrwwLdgCS57qU3fcqmgs/tuQlCTmVtJUD61CL0y/ssWDS5gdYmz8P74dG8EMsajZi+ESU971VHaWgo+9BkdaUf2s/PAL58rHg6pQIBCl3cENXXL5WuVdeynL/njB/tieIRhpe7ty1WxKomL0ikENfRV/djnl0loEigbtnU4FnGfdpUtapSDsjao5mkzkCIf+e/Cwm05h19Q8cB+3BZ7hHG5n7SmR4QbVGQa5Oqq/G9bMz8Mw4shRh8J/Z044s9uk55Wbag6FdDt2UAHVAxVkBAv4sEHDDv8Z6yMObllxBlVgCBXzhzqjoSljFMeLZKZgHmaD7ipWPBPx1BVMe99LsbQ2WR/4whs8znfET/3vEGgqVKv8iYiDhQ3SrSpwHEB++kMNV2SHwd3kndV9lI/ShDfbl0KAKbQT3m33bKK/UjevgqlOomU++6dOQha8ZxyOASVegjC2G6Kta+h5DhspKEX8PjlsvI1nk7H/yJ0tykcZCYEyTilRSkXlm+vrLuQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4468.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(136003)(376002)(346002)(39860400002)(396003)(8936002)(4326008)(2906002)(103116003)(7416002)(6512007)(38100700002)(2616005)(1076003)(4744005)(8676002)(26005)(38350700002)(316002)(5660300002)(66946007)(956004)(86362001)(6506007)(66476007)(921005)(36756003)(83380400001)(6666004)(966005)(52116002)(6486002)(186003)(478600001)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1y1MOGmJb4OTQVZWLrjiR2tL/h5mgC9le2fvPmfW5EYDBho4ppXOHE9ighPr?=
 =?us-ascii?Q?QyW9ApYDeFbJOS6RsZmKkekSpaDkMkb3UqtP7Qt+m3VWz9FQtgyd9zqvkODz?=
 =?us-ascii?Q?SsxZeKUJJxkN33n+z8Bhj3Oz2C6z9x31Zt2ofTiu393COt461kQE+Ps/OXaQ?=
 =?us-ascii?Q?nFC+ftWYkZ8Za8Bjd96KSe7+gvJkmmUj9Pj/jDCKOr7WRB2w2qzxstvAVKEb?=
 =?us-ascii?Q?9efowm2ygQ6ZYlOgJTWgAQSWI7zcGWUsFq8psNpl1XotD8yCa20mYgRWncHE?=
 =?us-ascii?Q?SwSbfTGJqWPZo6lA63LZmaYszHdTM17UEP5z1vg2eRa+IPBpzVfkxrs0v5gQ?=
 =?us-ascii?Q?fapHEZ1YjYi6VLWXHjDvaM2ptWs7TKr70y55t4PIPQ7foPxO8Un+h3roCn4C?=
 =?us-ascii?Q?6dxU1zgckKEhVRTcOiZY0ADRZW6Za/O21MA90cgbaJVKB+lCpYNmZRBT/DQ5?=
 =?us-ascii?Q?9keqzPUCRUyTJhm2WqkzyEV7rE4L1YBVf2xGinZrPOFsQG02D+jYK3mNumW5?=
 =?us-ascii?Q?Ay9DzV7KlwrBTc1eqZFUdgZ/EZRj6Bzy8yrNYnayln01QcOX0jLRQr73TyLv?=
 =?us-ascii?Q?Ye3vA3Fy3v1YVuXwkM/DslD/+74jVXvbNifanTmy/bO/I1YMFNf1A92G38fy?=
 =?us-ascii?Q?81SrZJFNyCceIapdsz6E6B7v9A+dffhsR2bOxypBRVtg7hs3gzDNTAlkFXA6?=
 =?us-ascii?Q?dN875+SExuvI8mxzZ+zRgNHh3kfWrGhQoXAcCRLM2mjKxYyIK3inujMe1M8W?=
 =?us-ascii?Q?4PCa/uANAzGHw5hBkWoWLF9a2UCWUDhzUfiMnuE2A3Cqi9Jb7X6/YNOA7CwU?=
 =?us-ascii?Q?YujY4pZnXhYX2/VZOtEvm6qI92txQcm9/sohODDoEy5H0kq58i6R9ptnfJj6?=
 =?us-ascii?Q?uCbFmV4iiWfnTQSYY4Vkzzw6aNWRgeNVga4lRGQvb7xti1YbIvoozl0xrkOR?=
 =?us-ascii?Q?awddwFETEDRrBGpBhDmVm6QlKchm90Bhsp8sbclwoYTfTXasHovgFVNKmJwH?=
 =?us-ascii?Q?4RNxaH3IKwjsX7KirI8Tp2V67+TAdQ9nNrc5FHIf2sxKw8yfEKH7+kWCCGZH?=
 =?us-ascii?Q?ZD+BuMN5TcjcrmlLudLibe5mgSHOK4ADrQRe05XCsMF1jnZPXgidToeSto0t?=
 =?us-ascii?Q?cERgVluf+Rc5S5xZG2b1C2DdZMzS7cY6O2IBP6VrRmILppnLukPHsj2MwCOH?=
 =?us-ascii?Q?n6MOMddbOicCnHLjfPRN8qYjySHjk3h9Pr1EcuOJcVYY0VB7u8PP197FCxnm?=
 =?us-ascii?Q?JjzjoPMZOITXB6/fzZHdfma26GNtWeG+h4qz+nUyzK9KWMrDWKc15VYmT/uE?=
 =?us-ascii?Q?IzPBGMJH8pLkdnGl1lazNiMg?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e941f4be-1024-4add-334f-08d97464b75c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4468.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 14:10:17.4845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O74noSdI9hGVuPqV8d+dDyeznVwPl1C+R7xCHQDg+vqhg3bJsPioJY0I909bMduwKaI6hVHms3GKPRvXW/C4Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4707
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10102
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=996
 phishscore=0 mlxscore=0
 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109100081
X-Proofpoint-ORIG-GUID: 01AKZE7QOxBXu0kvprufe5hw-BsO86YN
X-Proofpoint-GUID: 01AKZE7QOxBXu0kvprufe5hw-BsO86YN
X-Mailman-Approved-At: Fri, 10 Sep 2021 15:02:45 +0000
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

This change is in response to discussion at [1].
The patch has been created on top of my earlier changes [2] and [3].
If needed I can resend all of these patches together, though my
earlier patches have been Acked.

[1] https://lore.kernel.org/lkml/e6f6fb85-1d83-425b-9e36-b5784cc9e69a@suse.cz/
[2] https://lore.kernel.org/lkml/fe94ffd8-d235-87d8-9c3d-80f7f73e0c4e@suse.cz/
[3] https://lore.kernel.org/lkml/85f4f073-0b5a-9052-0ba9-74d450608656@suse.cz/

Imran Khan (1):
  lib, stackdepot: Add helper to print stack entries into buffer.

 drivers/gpu/drm/drm_dp_mst_topology.c   |  5 +----
 drivers/gpu/drm/drm_mm.c                |  5 +----
 drivers/gpu/drm/i915/i915_vma.c         |  5 +----
 drivers/gpu/drm/i915/intel_runtime_pm.c | 20 +++++---------------
 include/linux/stackdepot.h              |  3 +++
 lib/stackdepot.c                        | 23 +++++++++++++++++++++++
 mm/page_owner.c                         |  5 +----
 7 files changed, 35 insertions(+), 31 deletions(-)

-- 
2.30.2

