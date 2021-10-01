Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEEE41EF05
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 16:00:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 778F36ECEA;
	Fri,  1 Oct 2021 13:59:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B08476ECEA
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 13:59:54 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 191DiOkd005267; 
 Fri, 1 Oct 2021 13:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=78W04B0zSXDd55fX5E/8/QqsA9tOsVj3A+kTJ7tPoEQ=;
 b=nQQXEuCyOGQLHFKtyNAYq8NTO5CYx+EBD6wsw2UVn7hlhSCYR//2KqCY5Xk7NvwRvFUs
 x1JH1kK8a3yIuFfuS6nzCpqMOe3NY2p/XHejoLVrh9JDtdZuiXLC3Sm0SxjlBmFxlTGe
 5W7FdfNS2pYpJz8mlXqejOBSbev7q2hfWoSyvvvr0/unrgjzpf8GgVT1i0JRfJNbpFRZ
 RC9DxQdew+4JGg+2c0/alAVI+VkKG7sCPYgGAiETY27kCP3EXff8bTWyCZJSqZneDHYV
 QZZ55V9NzjalhrqTSfVXhbFv53PPukT0UVDNhQjFc2J3Qz/BWunnFwfiDOnneEj+jgjU WA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bddu8yy26-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Oct 2021 13:59:50 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 191DoOSI189964;
 Fri, 1 Oct 2021 13:59:49 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
 by userp3020.oracle.com with ESMTP id 3bc3chhr3k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Oct 2021 13:59:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gchMBkslmUAIMNmnOcnFY2v0xGGdHHJARvfCB/7ieAPOcmpijOWkzfu3lA4EOSKhjq/nIb00BmYeJrzXyJDAJAmc7xAwKcbwXDTVWMLUKQ+scd6Cm0zQVoFXMKRj5WFUM3rgJQBhbwsyEuDYAijPOducJollmZAZwOiRqTq6naDAZyIdCmxEViH9YnBSQhrrC5SZLi/Ombpo8/KKDzaxCAeMnF4pjb2FDS/45W1vP936qhp2WdcHiEOvQHiuYRw3g5on79BvAV9wrD1BmuNyv5RjtYh11jaE2PlPML6PjXTHMz+nZ0EY4Nfe7s4RACjnH5KtD47X/2foAl2JLxyCrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=78W04B0zSXDd55fX5E/8/QqsA9tOsVj3A+kTJ7tPoEQ=;
 b=Bny5I6opvYJ3J5DCWxQ+wkPK7j9s06M3QZuTlb8zDK692WoQa3oLJkn/fat69v4ytNIpRVbWvnjmisvwGdb0x3G4EvSmCyrjKhEo1igNMfmki4z1jkaXAxB+yrcNje42T3tMTvHgOTtXNf3YZ+gX6dKi6xLJwie15B3JcwnFwaN9ToxxMBgoCHdEjHVaeoesmxIKyGPTOQNKpfbnFN4Vg/dZjICL/8iqQvoFvxMWij0yWHp5wrcA/Nw3RnZ7LKl1MooIgXvHrdVmCfjwigX6icwW6LryxNn54L+ifEDt4Wl/KP0z2n2rGJZVwW9OGvvPjzBOcdMGOvNT9Q8pLALgZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=78W04B0zSXDd55fX5E/8/QqsA9tOsVj3A+kTJ7tPoEQ=;
 b=AFOKiXBXJ0/8DDepbLnpg8gsFl37f1temQ3w0FzskbRMzMorQoCaWPYRS/aD6W5z/Zn8UgbD7o0aQ6J5zoKF5wB0Cd0AUh9FaSh/qyY23grDG6Ys+yoiwUeHalb2QyS7xqwAEojMTMcYWNLZhLc0HJWjr0Nv5vkZPe1IybR89vw=
Authentication-Results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4547.namprd10.prod.outlook.com
 (2603:10b6:303:96::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.17; Fri, 1 Oct
 2021 13:59:47 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4544.025; Fri, 1 Oct 2021
 13:59:47 +0000
Date: Fri, 1 Oct 2021 16:59:37 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: abhinavk@codeaurora.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [bug report] drm/msm/dp: add debugfs support to DP driver
Message-ID: <20211001135937.GA10064@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0105.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::20) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (62.8.83.99) by ZR0P278CA0105.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.17 via Frontend
 Transport; Fri, 1 Oct 2021 13:59:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03d40b97-2506-414d-27ba-08d984e3ba62
X-MS-TrafficTypeDiagnostic: CO1PR10MB4547:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB4547A1EDD04518EF9066BB898EAB9@CO1PR10MB4547.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4WALjX348UglhFnIaHPGDU6lUUFUjlDLedvxdyWzBggd3U/mMHhuiJR2dT3zPHZQ5d0P398vJPwKMb3/oIr9eyYloVook/azNMPp6zRwAgEZJ2NogKpC/bYVI2ie5EieloY+nJB3CKgtKTdj5gmXVRI5E/CVozVZ3ozUYVEexe8KMrPNMgWyYGleDD9iPVl9aVQZ9qajEunA0IBC0MyXV0DVxxS7lg3TJ+HPLJwMbM4OpBa5QZUdWNX8PWlfftAxsLX7TdyjVNUfTKncagqEvup4acn1pBLTAJuD/A3UKf4eQKo0UxOYDsF9J1cXCadT6nYu0dm+ffCkpBCT6EXh4ImTxYtYmQ5scOSPKK7PwWkdeBJRoN7lGuqc65uWCmBr9B8c58FTS2ihLWSAf9aP/zuCccLWcCZtPPywY2BuhOERvkiZ2Fk8g4vinU6m8J63JvfQ595iedfsEiiKZhwUiFvhG+wTUhe74Utx7RJBPIymyccohpl1tDWN43b4uBYSzcs632+aMtGPRpiiRNNYstiybDhlXfmI2qo7/MBRSEBLGEgOtBOhvEbVb3cQmIJ99arOMZdr1VpUWZxXbYdKCn1SXW+c2EFSkEbCwxAJR/4yNLxNWOmtNyBPLLJxVZ/2gEWuwIl9SQ9wVddmrnZi7tCOZh5Mqr0Vm4UQ2RJ4/uEKoYBbEcNGPquLF8BiH22ymgiK2olpKU+5VjDTUliTWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6916009)(33656002)(83380400001)(86362001)(316002)(508600001)(2906002)(4326008)(44832011)(38350700002)(38100700002)(6496006)(52116002)(33716001)(55016002)(66946007)(6666004)(26005)(186003)(1076003)(66556008)(66476007)(9686003)(8676002)(5660300002)(956004)(8936002)(9576002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vT02l2v2+PcaRDBmlDAAMe51bN3RidxtmtbXmwApdoKJqD522VQoTSJnW4+V?=
 =?us-ascii?Q?bbpGVq5S1582A/PrJxPVvZlZaNlpy6x6DGF1PgM6g6BIgCZW2TilfJh799Ry?=
 =?us-ascii?Q?BsY3DHCG8E3Ljc9A3i/eEteuRG6X2+xQQ56uauQnKtP0D2Caz+YXhjf5IZ/+?=
 =?us-ascii?Q?zFLc7j0OKje4DgkEAnlvjZXtL5HICdejm7snpYZ7hSpYOAhAKxR+ysffxJEq?=
 =?us-ascii?Q?a0ir1Gx/cjb3UmTnTZBAbQjOgZi6ZP4wZX07xz3gXavK30axFFMXu/x62QTJ?=
 =?us-ascii?Q?UKpXuV6aWKGrBBFQlzXksWKTeWXsnLKt8vM+2GVwB9Py3EKNcHz+52gBeSzm?=
 =?us-ascii?Q?rkgIhnPCTGz/ZkaoVgn7lHfiEa9MQeGzHS1XtFzGRPPLAyKm5yWS2fKd9zHY?=
 =?us-ascii?Q?DJ053b80+ViPWvZJXpFkM4rrdUwg+qYXFljE6MSHZ6ekGq7OSISkLpOCMNny?=
 =?us-ascii?Q?dstC270uHonv+X8UZYpVsV8e3pei5naAZAZVZdVXFebYbdLWoUQOcwzhu+Fl?=
 =?us-ascii?Q?6fg0i3PiMoCuS6NtHCiLEC4CIXrxR+em5fOyu8Vfxn5LmxeS9M2gOeBhlw6o?=
 =?us-ascii?Q?kIBKULmqdmuGT3s/I0pAOoRwlbieu+UuLScBOSVYFhadXNNpWybWDwk+nBSK?=
 =?us-ascii?Q?0g7yYGjGgNPXPFBVtTvAgIepzrtu2QzeZ129qv1bhkHgmlsluKDcS2vkfiZJ?=
 =?us-ascii?Q?C9S3O6Qko5VpP1FHQ67MjkXTPb2Vesf5WowENZUu7P5yIkXB1dFHzUec7Eqr?=
 =?us-ascii?Q?fOzmFBSHdWrJ7Otd6tH1TYRpaYDPHySr1Z+GTz7cemywPvODnWdjt0Qzv7xv?=
 =?us-ascii?Q?DfORkbL3SPEmkf20vaaeXTRFzr9rjyAObehSwyun1g+qc6EpGAoR0ZFiZdgb?=
 =?us-ascii?Q?F0CRDJBzm6cwVqC3TRFjmZOR9NymAwajXuvLzJc6jsSk37ZBKAzXUdeO9qNF?=
 =?us-ascii?Q?OcUNBf3EwAVLSJV3np72WiG2PIR7n8IimrWEkj0GDcgr5X4iKsgJiRWB4pUq?=
 =?us-ascii?Q?q4tOrHcebcujsg1jihP09UO91zGYThXjrF8WB/Tf1RYA1JtCNMorXT/w4q5K?=
 =?us-ascii?Q?jXz9BhMTc0XN7scXsuK/MQz+oc8aD0qO0tXOH/WoCm1WRs5n98qXoeIwBmri?=
 =?us-ascii?Q?JjrjVLpqnUcwNoZvSkTmySq0EpjeFQetLbu1JxM3GsJYyUenzOruiuXx46pZ?=
 =?us-ascii?Q?R1Kf5q14blkZ5K8ij0TZ0WAQNc4vHGsfEmG1YDfySLp3XwrACWNs0OQXBQTP?=
 =?us-ascii?Q?Jd0TI/rSqEoG7+aEstR1yYED8FEyV6+3alIL4B9tfcHwekcgyKZbMcJg5vus?=
 =?us-ascii?Q?kt82pYDXq3ZYrQQXebUgR8bI?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03d40b97-2506-414d-27ba-08d984e3ba62
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 13:59:47.2211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wdMYXsswXQSKk09UW7tDs+VWKAa8Pofssz5aBPA/3dBZqwufsDDQCsPzZPrtpGbPUBQ+2TJd1BdtTVX3TVgm149Rds2u/Nww0KuisSCR8OY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4547
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10123
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110010094
X-Proofpoint-GUID: _ZbNBo_LcDwONbWShlZe30kA7ZNo-4Vt
X-Proofpoint-ORIG-GUID: _ZbNBo_LcDwONbWShlZe30kA7ZNo-4Vt
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

Hello Abhinav Kumar,

The patch d11a93690df7: "drm/msm/dp: add debugfs support to DP
driver" from Sep 12, 2020, leads to the following
Smatch static checker warning:

	drivers/gpu/drm/msm/dp/dp_debug.c:194 dp_debug_read_info()
	warn: userbuf overflow? is 'len' <= 'count'

drivers/gpu/drm/msm/dp/dp_debug.c
    46 static ssize_t dp_debug_read_info(struct file *file, char __user *user_buff,
    47                 size_t count, loff_t *ppos)
    48 {
    49         struct dp_debug_private *debug = file->private_data;
    50         char *buf;
    51         u32 len = 0, rc = 0;
    52         u64 lclk = 0;
    53         u32 max_size = SZ_4K;
    54         u32 link_params_rate;
    55         struct drm_display_mode *drm_mode;
    56 
    57         if (!debug)
    58                 return -ENODEV;
    59 
    60         if (*ppos)
    61                 return 0;
    62 
    63         buf = kzalloc(SZ_4K, GFP_KERNEL);
    64         if (!buf)
    65                 return -ENOMEM;
    66 
    67         drm_mode = &debug->panel->dp_mode.drm_mode;
    68 
    69         rc = snprintf(buf + len, max_size, "\tname = %s\n", DEBUG_NAME);
    70         if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
    71                 goto error;
    72 
    73         rc = snprintf(buf + len, max_size,
    74                         "\tdp_panel\n\t\tmax_pclk_khz = %d\n",
    75                         debug->panel->max_pclk_khz);
    76         if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
    77                 goto error;
    78 
    79         rc = snprintf(buf + len, max_size,
    80                         "\tdrm_dp_link\n\t\trate = %u\n",
    81                         debug->panel->link_info.rate);
    82         if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
    83                 goto error;
    84 
    85         rc = snprintf(buf + len, max_size,
    86                          "\t\tnum_lanes = %u\n",
    87                         debug->panel->link_info.num_lanes);
    88         if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
    89                 goto error;
    90 
    91         rc = snprintf(buf + len, max_size,
    92                         "\t\tcapabilities = %lu\n",
    93                         debug->panel->link_info.capabilities);
    94         if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
    95                 goto error;
    96 
    97         rc = snprintf(buf + len, max_size,
    98                         "\tdp_panel_info:\n\t\tactive = %dx%d\n",
    99                         drm_mode->hdisplay,
    100                         drm_mode->vdisplay);
    101         if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
    102                 goto error;
    103 
    104         rc = snprintf(buf + len, max_size,
    105                         "\t\tback_porch = %dx%d\n",
    106                         drm_mode->htotal - drm_mode->hsync_end,
    107                         drm_mode->vtotal - drm_mode->vsync_end);
    108         if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
    109                 goto error;
    110 
    111         rc = snprintf(buf + len, max_size,
    112                         "\t\tfront_porch = %dx%d\n",
    113                         drm_mode->hsync_start - drm_mode->hdisplay,
    114                         drm_mode->vsync_start - drm_mode->vdisplay);
    115         if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
    116                 goto error;
    117 
    118         rc = snprintf(buf + len, max_size,
    119                         "\t\tsync_width = %dx%d\n",
    120                         drm_mode->hsync_end - drm_mode->hsync_start,
    121                         drm_mode->vsync_end - drm_mode->vsync_start);
    122         if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
    123                 goto error;
    124 
    125         rc = snprintf(buf + len, max_size,
    126                         "\t\tactive_low = %dx%d\n",
    127                         debug->panel->dp_mode.h_active_low,
    128                         debug->panel->dp_mode.v_active_low);
    129         if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
    130                 goto error;
    131 
    132         rc = snprintf(buf + len, max_size,
    133                         "\t\th_skew = %d\n",
    134                         drm_mode->hskew);
    135         if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
    136                 goto error;
    137 
    138         rc = snprintf(buf + len, max_size,
    139                         "\t\trefresh rate = %d\n",
    140                         drm_mode_vrefresh(drm_mode));
    141         if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
    142                 goto error;
    143 
    144         rc = snprintf(buf + len, max_size,
    145                         "\t\tpixel clock khz = %d\n",
    146                         drm_mode->clock);
    147         if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
    148                 goto error;
    149 
    150         rc = snprintf(buf + len, max_size,
    151                         "\t\tbpp = %d\n",
    152                         debug->panel->dp_mode.bpp);
    153         if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
    154                 goto error;
    155 
    156         /* Link Information */
    157         rc = snprintf(buf + len, max_size,
    158                         "\tdp_link:\n\t\ttest_requested = %d\n",
    159                         debug->link->sink_request);
    160         if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
    161                 goto error;
    162 
    163         rc = snprintf(buf + len, max_size,
    164                         "\t\tnum_lanes = %d\n",
    165                         debug->link->link_params.num_lanes);
    166         if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
    167                 goto error;
    168 
    169         link_params_rate = debug->link->link_params.rate;
    170         rc = snprintf(buf + len, max_size,
    171                         "\t\tbw_code = %d\n",
    172                         drm_dp_link_rate_to_bw_code(link_params_rate));
    173         if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
    174                 goto error;
    175 
    176         lclk = debug->link->link_params.rate * 1000;
    177         rc = snprintf(buf + len, max_size,
    178                         "\t\tlclk = %lld\n", lclk);
    179         if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
    180                 goto error;
    181 
    182         rc = snprintf(buf + len, max_size,
    183                         "\t\tv_level = %d\n",
    184                         debug->link->phy_params.v_level);
    185         if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
    186                 goto error;
    187 
    188         rc = snprintf(buf + len, max_size,
    189                         "\t\tp_level = %d\n",
    190                         debug->link->phy_params.p_level);
    191         if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
    192                 goto error;
    193 
--> 194         if (copy_to_user(user_buff, buf, len))

This function does not take "count" into consideration so it can end
up copying more than the user wanted (memory corruption in the user
program).

Technically if copy_to_user() fails it should return -EFAULT, not -EINVAL.

It's weird how it return -EINVAL when the kernel can't fit its output
in one page.  Normally we would just print the first page and hope that
was enough.  Use scprintf() instead snprintf().

	len += scnprintf(buf + len, size - len, "blah blah blah");

    195                 goto error;
    196 
    197         *ppos += len;
    198 
    199         kfree(buf);
    200         return len;
    201  error:
    202         kfree(buf);
    203         return -EINVAL;
    204 }

regards,
dan carpenter
