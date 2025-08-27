Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01608B37E12
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 10:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBBC610E0D0;
	Wed, 27 Aug 2025 08:45:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.b="rXv1Ljp6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 303F010E0D0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 08:45:50 +0000 (UTC)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 57R4vIvR3327331; Wed, 27 Aug 2025 01:45:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=cc:content-transfer-encoding:content-type:date:from
 :message-id:mime-version:subject:to; s=PPS06212021; bh=IJSwuhQ+S
 x4p/XRYLYHfUoGq3Bpru9eTY/L7eySFvAk=; b=rXv1Ljp6CW8bfzcWI2lUHk8JT
 NY2Ncd8tXEYWSYRL+hALovGlESJryvw+jwFYjf+HBVf27Zadj0ibabu+fPV+V2mn
 71UE9y2vo0PEzJl8W21IQatWZjFJJk7Fm9tZnQgmqetluN4fup8SnjAw1IYkI83M
 2YXvs8D/U62jW/qACjC8im4sC5qjNV4+Zt5bYMULYSA+aWk01WVMfjd2W9IAkdXD
 wJEE0/nyv+qklYm0eWXeyiBy8Lsqg7CL7aR1ojmIcor0St0/ptVqJy3vnpXD0fbd
 IlxNZD//vJZtfioleMvGH6b584nt13Q1f+UquirlMJDpl8AUd8YA/Wdjw9jsA==
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2071.outbound.protection.outlook.com [40.107.236.71])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48qd5hm3ek-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 27 Aug 2025 01:45:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h/8ykLgDtWjCwpncQrQ2dEoN87AcMthZnA7beNf+mZvYc8CgV74nSNwBs0JV36CuPCAhjGAz0v4oDS32KM6aL7crsZO5tgG6qhy/3ES4Sws2dePigjCJEKA01E10g8ebDBBanWsdw34vsEcUk4tQFRl+M0VAtzEHwpEqT+AkUsJu97LaKKbgduTbAZYjOpW6h2udUOfASNWOkOMBDR3zXaPwXFGUbqYp7FYj6lplHhfRIZopGgd6pWNS8QxT4McPkiG76lx1dqiBkjG+LhC9EQRh0EmRAL7g/xCIiIWxrV5WF76ItPicJ0aJ/OvVahWx+GdC+DGEkuXiODazz5vKGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IJSwuhQ+Sx4p/XRYLYHfUoGq3Bpru9eTY/L7eySFvAk=;
 b=k/BBsDSWt5ZjVBRwhDJshpcpVN6JAP1LIUT6YLULld1vLs6gcShbs5F6PFfj5JIsFFy7P3uNWryb6biad+Hz/q2sBw33AEMCBOj9Uv7acydq9T8l6MxE/uzLWdUvOoRVBxvylEWjDx6M4yWkFVnZRGHQqTYYTLn1dYzyt3lsNqQB5tgatEB27Huzqr2Hv5G968SPUAFSCLLE/MYd9RspPGEISvHmHL1kUgHGAEganJWSWUa3JlAFLBvx5XKeyztsW1t/ZZq6DDVxsP7GnJ9Nho78BI5QDInME4Diqu4zoVOge455LisSNJ1Iv8ZRZ15T44eGdUQrJtvnDwNK1fZ0qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by IA1PR11MB6444.namprd11.prod.outlook.com
 (2603:10b6:208:3a7::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.14; Wed, 27 Aug
 2025 08:45:33 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::6364:ea34:bd8:1f8f]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::6364:ea34:bd8:1f8f%6]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 08:45:33 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: dmitry.baryshkov@oss.qualcomm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, jani.nikula@intel.com, ville.syrjala@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/tests: modeset: Add drm connector
 atomic_[duplicate/destroy]_state
Date: Wed, 27 Aug 2025 16:45:14 +0800
Message-ID: <20250827084514.3364009-1-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0187.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::12) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|IA1PR11MB6444:EE_
X-MS-Office365-Filtering-Correlation-Id: ab34852e-f84a-4827-ad71-08dde54615a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fAsrOTqWLmPdkfS9B8R6gbh2VH+maIwWFpuBa3Vp9VMg7k0ePrSZe3PFpJ9Q?=
 =?us-ascii?Q?U8i3V3xRxdjBoEP9a0qYtkmeY3H/jgite/IGOFm0qkURLNOXfVzP9cDp6BAu?=
 =?us-ascii?Q?X8t0b4npNTtR3VPLtGCkj4ALZNCSI4nO9cYbsiLFwS9aEiLqAA48MCDdfHd9?=
 =?us-ascii?Q?YAhQWU/c4TrqKnWYJEt0kfWo/yd/h3mmdv3WJHLySRZMx6RgxjRzvQJ/bMmx?=
 =?us-ascii?Q?QMHhEOChjO6qksZLNpyHrDOJd5ipfIqiGMECD6Z37H6/19py3Ddc462WoLez?=
 =?us-ascii?Q?52tden7PhCuqUyFOed96USQx6+d450izq9djv3OLkf7ekWWCsk3Dtzw+o2IT?=
 =?us-ascii?Q?pvNfytlrWhsxVTTahqt06TkRJlZjsSnsJ0R9iXsyiBr6F8oWGSU1M1V7VOpg?=
 =?us-ascii?Q?DyCEQtZAWL0ATGvPVVuiu/Wao3bA7ikchHYiRWK7rwRZxpl9vJJX8UloRH6X?=
 =?us-ascii?Q?9iK69Hed0ksUquphYVRXuPYHLFJXVdIh+xOlli5PV73vwiSkaV+hkiZQU2k1?=
 =?us-ascii?Q?7MketUXHlhSftpBSGbcmPxJ8EViaj7Ml9KP9adqYzxJv9vEAADEh41EJn77G?=
 =?us-ascii?Q?5ZKOchEVMG+VENmXL1rcAFUHP6xMpD8SJ9jSiboc09nZSY32ZFC54MCj4zia?=
 =?us-ascii?Q?3TCMeqjX1i02ZKSwHyVD6njWf2yiAw9s3ljDMzvGBSs+FYlvtY6jO+sIBVst?=
 =?us-ascii?Q?1gI41c219WEqxiIe9yFhccYwWi0buZGX+0wMrcjKtjgliMtDyEzQ77LLOpAm?=
 =?us-ascii?Q?RDUivOpAdkpIJJMN+okzkZhwh+lHORG5BbOFYROOvLy4VZq5ph0CDA+8wHhp?=
 =?us-ascii?Q?ipcxbmFmdU2+oPMAs5zUKlE7Z9XBkl/O+3OwQ2fi8YE6RM6ZMlbJvvTJfnyg?=
 =?us-ascii?Q?s8WvdDXfFWOZccf7RdEmr/XDF0vNPgjPA4IwtoA1ny9WbO2mYUTvAF9wPK9u?=
 =?us-ascii?Q?tNP+tXzoBir9ag7qcYkD2uJHOgBvJKy4b950Vw+8j9H4FXItQ04lFF+73Z7K?=
 =?us-ascii?Q?lbS3X3tmTjRrhhprd8DmNjgX8SqJQnaWdMPVl0rne7PaiOSMEBMeJMxfuYiT?=
 =?us-ascii?Q?7rL7WNGg0GDhUx0A0ox8rztTZEcL6b+QZQbyZI/vcUHfTKWo5RI9mLjqbyLT?=
 =?us-ascii?Q?hvITy44sg8cz/UzZwav7twVZIL6G4inH4vL0goJSvuctPUJkMntBC4sZDkNw?=
 =?us-ascii?Q?z0x1IRilZ2YHxp2NEzhwtCy802rbJMUbLcCATUwMlOaGeZc9d9fKQyM78Joa?=
 =?us-ascii?Q?bddmkZ7r3aRF11MpfRgJgWut3ehKvZjxHVWD148wHpgxIK73CjPy0o+WoV8p?=
 =?us-ascii?Q?SEQnla8MtODAubGZTDsL6eJKV3/XPcBbQi51Xgcs/dl6038AnyuL1BTLQIqu?=
 =?us-ascii?Q?+BwOlCDeGG3qRRwkLNWy1jUZZjvWh1oO46j3/ZW5VfwUaHlS+U0Tut7O37L/?=
 =?us-ascii?Q?l3yyCkL3PXA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFD667CEBB6.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(52116014)(38350700014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N4Xexg2yyh8lloeD3EKZF4p4Ufui6sQGGNglh5J3JP6gvCIbXnLbA/hGQcVM?=
 =?us-ascii?Q?XejZa7l15S9KaqjbYiwefjWEG/x6NtwSDeOF8p82atix8obohkDyr4Ms6BBm?=
 =?us-ascii?Q?OhMhzZEfdU45Ac479NkO4PcVGQWxoEh7GZZ7p7ydWN03t/TydhqKPhv8u8Uk?=
 =?us-ascii?Q?tIl8Uyp1mtq2H2AmenAQiDKs6Y2+Ciz/GxOpZEmcTJDWo3CQv8GafoLuph+4?=
 =?us-ascii?Q?XEpgLB6gg8kxC2layH5xosgq09S7LCMSnAVwDkwdwsVxkfJ2Hs4XkO7+ngHS?=
 =?us-ascii?Q?9MORuHBT4Vo9m7sDAvuRiD3zYBEqBgdxoogNKLemvAJiKF8IemLo0DlQ4UjN?=
 =?us-ascii?Q?C24IXvbgbbzPp0p7jNTyI9MjdmE+5320zjaT5nyCRITS27UhfR8+7/qACrtJ?=
 =?us-ascii?Q?4dPCl2et4CN9U/NAN0IQOefyeCc42Wsm9nfTNk43S9JjxkiygmU2JB6cC+Th?=
 =?us-ascii?Q?RL9sKZK2od8S6fAQwoQhckgyhjfSFXAU1y1QJs9b63Ub+Q3CFVrjIcmiWJ9J?=
 =?us-ascii?Q?VpJv2ueu+iyJcZn+sIUh86FXP/MUCACdl71/3ziwvSQOP/flqZAkDNZcBv5y?=
 =?us-ascii?Q?ZFlWe3PyneKtrbgIeuRws7oRR/Pgo50BaHUgIPhpe6qO6lp0RNP75ACCA+sC?=
 =?us-ascii?Q?ReEWCcpWgqhdTkSr50xPcIiVHkwWrYitU/mClt5s8Ei4ab15+NYZX5oeDQ/W?=
 =?us-ascii?Q?dfxUmpWHLamDm4K/hg0ctL2U+vElnVmJMfZXqOGkh6p50oM1/IacNELhj0Vv?=
 =?us-ascii?Q?j3k2+G2sug5lM3IiF3WGrlkSwYPUAOEznMyWI4ar76mB1Ei/HQHqkDQTeH3I?=
 =?us-ascii?Q?PWUZdA8f1fW0Zq/KGuYrMTHtMu/p9Ob6+0AXjQFLqjd2xJDmvY2DrmTxEUUl?=
 =?us-ascii?Q?vuw9GUYjidPXSi7kG591v0wDYNNj3i2Oh9sBHSc5extDD5dWqBkTYv/eVztX?=
 =?us-ascii?Q?0+fj05SZjOTDnjkpfN+jObNrX7C+PZtESAVmMGgDE1WPTW09TmwuwAwNnriA?=
 =?us-ascii?Q?NAeBUGUdFxmrD9RGBIjL0IvNJoje05LXOCDc0bVlNoEJCuglXnit16jbAtLP?=
 =?us-ascii?Q?T4+dCWkP5ggkzG/AvUAMOZ5ocD5gIOcj2deMFc+cnvOBWBnZ0SeqLb8t25d8?=
 =?us-ascii?Q?79iVzz3AcFahDr/T7Sq/5OHRpZunHbADymVxETXAbvKdNC6J/uOctC4ocoJk?=
 =?us-ascii?Q?hhNgKZiU+yJlAe73tVXZspH5THUbjZHwgDm/5X9UiS/M6DYTgeLvgnxE6sL7?=
 =?us-ascii?Q?Xb35mV3vl692XzKEI2aSBd2GBV3NJRE9Kd+H5oG0lvFtDINBAO3nbHs3Yh1t?=
 =?us-ascii?Q?DLVpz2wfZmvjI4L8X4aWaj3uTmSGXEhdXGhOlBYOljyCDlqPJwut/P6Z35mM?=
 =?us-ascii?Q?kpzbp0wlaGUgPKZ/6JSpTinJgZWVoySwfMhQt033Y/9wNFdl0/Ewk14ZkLY+?=
 =?us-ascii?Q?5PDrfRjG0yyLgBvgLdNjqoqOPCQjmN4F9/5lDjpEv8mVo2VbA1H7d2ljJCcX?=
 =?us-ascii?Q?BE1JU8ExO+za/GV9GVw80PjhKLvqq6oGn7gq6pt5zQh8wFcP2Pq6r03h25Ki?=
 =?us-ascii?Q?p5dQ2MKmISUpj+tf/wQUnRAI/Bx6Mr33iRdRqUSspFrclJgQlFykKBV6GFKg?=
 =?us-ascii?Q?3w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab34852e-f84a-4827-ad71-08dde54615a1
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 08:45:33.2162 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A8+mnOx/jUnRiPzvH3MWSwDiu3mIo4wEyw1XSEe8CN4aMJ3C8uXBycT/mKGPpcT2tsB9FGNV67Er13x1dTO2GlMCB2dGMXpUon/izGDJlQw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6444
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI3MDA3MyBTYWx0ZWRfX2xmBjYoGgh5P
 3/sEm7RdJoNj1zkUuq4IqehJ6DyG7anD5ZhS4lXyDtfoQ/nr6cQ2wgiTEzR+NkAu03X8xce2FfO
 8i46L9RMahJ0z/iBPu0gfxE7QXuzV2kgNmfHzTdvwaMf3MidUhbf8acDmrvIE/02nw1W1DFZOSB
 3g8WN3GIO8GnlwVSwff6TgmObl3tCVhsPBSHwku88e9SvjrM5vU9As4tFwlXMg3AH7fWmOYz57L
 jxE9VCyPC6kx9uBMjFfCL/hjQHnqH7uEhlJRuW8XVBAgLVfyiqYysBebcvsNjhyeXsZg/6caL+5
 6sK6at7Lc4GrCCpB3/vAUhPQUgnx4uveVRTCM6ptCR6SgH5nQsyWqF8O2YMM4w=
X-Proofpoint-ORIG-GUID: 6KSiKiq-8lkvEFK0ETKuVoU-HHr9bRBW
X-Authority-Analysis: v=2.4 cv=QNdoRhLL c=1 sm=1 tr=0 ts=68aec5af cx=c_pps
 a=loNqJ+LW3Ke9Glij0Sj0FQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10 a=GaQpPoNlAAAA:8 a=t7CeM3EgAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3rJ62GqNzUNojHlaeWkA:9
 a=xF5q_uoM5gZT5J3czcBi:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 6KSiKiq-8lkvEFK0ETKuVoU-HHr9bRBW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_01,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
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

Commit 66671944e176 ("drm/tests: helpers: Add atomic helpers")
added the atomic state path, so adding the drm connector
atomic_[duplicate/destroy]_state is also necessary.

WARNING: CPU: 0 PID: 96 at drivers/gpu/drm/drm_connector.c:234 drm_connector_init_only+0x934/0xee0
 Call trace:
  drm_connector_init_only+0x934/0xee0 (P)
  drmm_connector_init+0xe0/0x1b0
  drm_client_modeset_test_init+0x290/0x534
  kunit_try_run_case+0x110/0x3b4
  kunit_generic_run_threadfn_adapter+0x80/0xec
  kthread+0x3b8/0x6c0
  ret_from_fork+0x10/0x20

Fixes: 66671944e176 ("drm/tests: helpers: Add atomic helpers")
Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---

v1: https://patchew.org/linux/20250811063403.98739-1-xiaolei.wang@windriver.com/

v2: compared with v1, add Fixes tag

 drivers/gpu/drm/tests/drm_client_modeset_test.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_client_modeset_test.c b/drivers/gpu/drm/tests/drm_client_modeset_test.c
index 3f44fe5e92e4..e702a27c2368 100644
--- a/drivers/gpu/drm/tests/drm_client_modeset_test.c
+++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c
@@ -12,6 +12,7 @@
 #include <drm/drm_modes.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_atomic_state_helper.h>
 
 struct drm_client_modeset_test_priv {
 	struct drm_device *drm;
@@ -48,6 +49,9 @@ static const struct drm_connector_helper_funcs drm_client_modeset_connector_help
 };
 
 static const struct drm_connector_funcs drm_client_modeset_connector_funcs = {
+	.reset                  = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state   = drm_atomic_helper_connector_destroy_state,
 };
 
 static int drm_client_modeset_test_init(struct kunit *test)
-- 
2.43.0

