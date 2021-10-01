Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9682341EF60
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 16:22:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C5B6ECF4;
	Fri,  1 Oct 2021 14:22:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27C756ECF4
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 14:22:39 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 191DkBUv012499; 
 Fri, 1 Oct 2021 14:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=8IO8/xJNF/1ZmBqNZXPoRyxc5gfUFPs3+xL2gmGsRso=;
 b=dEjOjnh1ljxiQL1QPEpZfe64WT6zIjpvE/4EJPSLDkHtXsq8fiXXpU6/oDnpMl7bbPDb
 2Wnf2SLM3LzqC8DmDjJr4dD9wfq6cOu9su37PmPACjnO/1HSvDSxsJ773LQSfwBwov7i
 YZLKlPGpvoZ3PREPs4ZJu6sBFgh+8bPMTpCsX5i0+hHCLx8KbKQ9Q/iXtEJEUgv42ai4
 7J3wP7AvwBIVy0pirMw0c/Ukq+kf0sYMSEcTU08SAf/rUuHjWWFM+cojt9Rclvdoy352
 9D+wRybhCdUaxMVdm1sB9hg4AgFPHGF64h2+gCwE0Q352ZoI54YF7WAUfmVCNbV28fCi uQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bdevvewmj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Oct 2021 14:22:32 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 191ECM5M104015;
 Fri, 1 Oct 2021 14:21:54 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
 by userp3020.oracle.com with ESMTP id 3bc3chjshg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Oct 2021 14:21:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PJs22QlVwzpVgpd9kgRZBsYGoCqIWO6fQbsCl8fAZ6Ht5TA10uFB94IhFHgKKYtOXIRKYMvlVKnSaTs0rayhHHJa7xbA9jVkWQ9lzMnpXuUViwM/9q2BxJcgp8VKL2Oz/9vL876UHP8m7VsZ5+tClXsCJawP7oqCt59P2Vd+ylDDXK+ZpvxNnWx7Hz5rf8UKdOefJd8ISpBMD69yzcTikGY3GYjIMxR3PcEhokDLl8rcQ+d0kqA2G1vTyUGz7Afaj4yo8aVJ8PhguGV8Rcy2OSjhXudyLOAWWVMFHUDky03j3yqxIrP4bWmXC/5VopAepBDHctiVu8zlWOcnouHoWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8IO8/xJNF/1ZmBqNZXPoRyxc5gfUFPs3+xL2gmGsRso=;
 b=akCCs9qDAWfCn7x9Xjiu3a2FOkPwS61dEjLz/VoF7aFxvyMCTFmpqRPKdtlDxFRm6MhXQdL1S7hToSGrFVgaOGKedh2+iv5nXVyGbVcpc+ieuhjViKJeg0SdLnyc5MldbJlgJFlGvfymSJ/f7WHIS+lSVmBNRcZ7QMK1v/5tnmkqrTZ/reilgEBB4bYaGPsOWO5a3hpSYeEah+yIluAHi2GTgekOGNOTQ5BUrt6XMsOZSlVx7n3+sMWmf6U3UIiLLUsubxRf9Wnrejvb+UQ2qd3nSGEEEllr7f0mVmkN82/ar0PKMtcPraEJLANgYoiy0ujIbkJ/Q+qY7dY28Cd9rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8IO8/xJNF/1ZmBqNZXPoRyxc5gfUFPs3+xL2gmGsRso=;
 b=MBfl9gd9yhujfzPKQ8nYjY0bcTy0WRereWWkhPXFe7qkl5aJwBt+2E2W7PcVuJ6Btu/gaCMG1YZxjxov1dYO1/HiU+TNonNlI9cOUtdEjKtgewP201RtLz5rEkA4+McFw6/0frVdHwkUl5avs6FmQJDM1adHqoA/OcYQtH3EmPs=
Authentication-Results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1487.namprd10.prod.outlook.com
 (2603:10b6:300:21::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Fri, 1 Oct
 2021 14:21:52 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4544.025; Fri, 1 Oct 2021
 14:21:52 +0000
Date: Fri, 1 Oct 2021 17:21:42 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: jsanka@codeaurora.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [bug report] drm/msm: Add SDM845 DPU support
Message-ID: <20211001142142.GA11487@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0077.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::10) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (62.8.83.99) by ZR0P278CA0077.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.17 via Frontend
 Transport; Fri, 1 Oct 2021 14:21:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df8d64de-f896-45ad-3a11-08d984e6d02f
X-MS-TrafficTypeDiagnostic: MWHPR10MB1487:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB1487D1D136C24D4B70513B478EAB9@MWHPR10MB1487.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r2nweFDiZOsvrC+xQXozPCO/Qnhb5hipPZ6Yu6dFW0U23FINoSaUTf/59jOarFRFAoRiOS1RCPnvhs0EGx4sJ8j/0mk/5S5avpl0rBnG7EhGcTogMp9syd5gTA17v0zdMlCEMIUOrFCF2113QgYgw76gftmSQ6nI0fVRBaH/xw5mg9juXI0eEEYgXPdZh3nYyfvfmmkpWiOWn4rxWLz5iiQj2tUEHmgxIwOarMaFcsDn/ra/zOmeOnG3U8HWuO4JGupi67rlvndA959Lid8KqiJGVtTL2P040RKbBizuW5B3ySCS1BAutP48LKzVLEfgIuPgbjlOQ7DFzvkrixKJy0cvDZzAH5J//5IbgEwm9H2O/7CXFw5YkqT8bcL7T2PgIO64TMLP0S6u9LujZ60mTY8JJYSPcrUeLSAREXUzdcQ/xlaxe+jdqw32Cj4VFSsyYhdyW2SEpXZVN+Li0vgIo43O0C5AzJUMs8IIRRaLDwm+ixycNKT9JRKbyr1O1RBR34+8gK9nDUq8UI730hSQuVHw8HuvtH+wlkb14FDe3ctxQHr0m61NQD6WMLwrJE0lNs5YbbO3Kc5Lcncgu2I298zT/YiU/qy7GygRZWKsrJlAg2Ab+zb3/J06GMGIfZHo8Bs7bjbE+VhOoqrLNzkdpD3aY/bHDjiE4KGT1PpZ17U7zcYlJf5U4QXlSHEuXaLnE9SeSFHXyKWwvIBN1o/RLA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(86362001)(9686003)(6916009)(55016002)(6666004)(316002)(8936002)(8676002)(508600001)(5660300002)(66476007)(4326008)(9576002)(66946007)(66556008)(44832011)(33716001)(83380400001)(33656002)(956004)(6496006)(1076003)(186003)(38350700002)(38100700002)(52116002)(26005)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pebYxmX1LY9lrsQM9RHi3BB2IlrO8f2TV4/Jfimu+Ut94QAokrY5WcBDhfKC?=
 =?us-ascii?Q?+9BEugOhrrQsvIhKgyE7LYKaLK2C+RALjs1TY5M7CKeqImAkvf8NtK0z30EK?=
 =?us-ascii?Q?Ll/0q7xXee70O3fZDQbvsVqBrpcAitCgUY6ORgl+sgIKFFfdO43LWabE93nX?=
 =?us-ascii?Q?WY8+OS35B/2pY0Fdu+h1EGK6qvmYDF5om1QyiEUtyoyRePCGHW6oYqiFd6tc?=
 =?us-ascii?Q?ML3fWv/W/9gprqV1dh4NO6TK6LQ4f3z9u+MSRj/53oTlU3ovAeiIAaVdPh1v?=
 =?us-ascii?Q?s25WZX0qDIlPpOLWOP1zstVorLexbkMsyp1nXNNQXm3lAOBnKSpMzCRRyW5V?=
 =?us-ascii?Q?4P6YZFqbct3GcMnqbSHpEe5c0fIFIvZqjoCvX/jejkGCiqP2FFkMKl1cifGj?=
 =?us-ascii?Q?K4Djz5qI4eV9+nuFCTPhm2FZFGki2ldFWX6g05+fZgKh4O6LmbtDF38RYjdG?=
 =?us-ascii?Q?t1MKolk3cb6ztZhzidvIgrQaHlZi0JX0e3QCsTSDX6TjIEmg0kJJUM18CjZp?=
 =?us-ascii?Q?A/XJnXSVzyGJIS6fUFDCS9vFlWv/AYtZiA5KANz8a5fDUBM89bVZK14TR4Sc?=
 =?us-ascii?Q?M3NSrRQOijRvvsYV26XVEckHKIm4BI5qTG5nT5LW4VMeARkHYPrcG+wCJtE5?=
 =?us-ascii?Q?2+ER/3Ar6NrkWbPqF8xJRT4WSlBzs55W/nwO//zRpvzEFKfz36cISTkU6oht?=
 =?us-ascii?Q?xZ7jG4FUE21NJaWxmAAbjzKebbR7OCpydPSTIzk79vNLijT8XfyvSIUT5Q4Z?=
 =?us-ascii?Q?jitsYL0dKDPJAya/5x9AmKC6Bhd5MJQMvuIVKV3Np6E7JD5qb9WF/UvLHpHg?=
 =?us-ascii?Q?rytJS2YLW/yhYKHbmnSnbBdmWJYT+WfVBNllo6hZ68kxN706L6EBdq0hzd2N?=
 =?us-ascii?Q?rn/aK6DNtvSfztFdAaQGuyheNFP4BnCzDVZ/6dvXbr8AQcjnLLG1T/OaggGA?=
 =?us-ascii?Q?4IGJof3tGf//OQmaIQZUHaXnngvAESy7AP9EelnIri4OKhZxSPyHUp7Q9asW?=
 =?us-ascii?Q?oVKDIEW1dM8fYnM9g/GWLrZMHkqtKm6KW3UkjWo56qIJf0Mwtd7LIVOmtZxu?=
 =?us-ascii?Q?DAje2cmwppMAYv1oE32zO8srEAYMEx0jdkAmy1nVXQTiGi/Cc3OCpw5pCRNX?=
 =?us-ascii?Q?5ImF7ceGn9mU0ejwJWUmO0CrGTH2uIm0wjx31rk2Vw4pOasN+p7pyzgp0oPE?=
 =?us-ascii?Q?Hl2b4YU+Fx7xk8nFN6cNCs/PdbCYkP9qo0nYvMHcDgluLoGB4zDUB4ebwPCL?=
 =?us-ascii?Q?LAEjCEfUuALECgM1t8dXu2zkvR7lHYH/eBgN3lWd1Ov+9udegzNkv/omm2IL?=
 =?us-ascii?Q?n7LwGHTUOrJulRS/zfg9FGDp?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df8d64de-f896-45ad-3a11-08d984e6d02f
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 14:21:52.1735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gEMaNtQUL+qV6d5vnvXoefWmLoevMzJnhhVFk7SZ2WCHVXytnsr6Vm1ZNcB0ldN8k2jYGIzxwDHyCLcG1qDXp8OTIjbxH9JfOrrtnY1r1WI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1487
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10123
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110010097
X-Proofpoint-ORIG-GUID: 7ZmXVne1gBQ8K4L2pydR5ZhG3VvNn93t
X-Proofpoint-GUID: 7ZmXVne1gBQ8K4L2pydR5ZhG3VvNn93t
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

Hello Jeykumar Sankaran,

The patch 25fdd5933e4c: "drm/msm: Add SDM845 DPU support" from Jun
27, 2018, leads to the following
Smatch static checker warning:

	drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c:359 dpu_encoder_phys_cmd_tearcheck_config()
	warn: 'vsync_hz' unsigned <= 0

drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
    322 static void dpu_encoder_phys_cmd_tearcheck_config(
    323                 struct dpu_encoder_phys *phys_enc)
    324 {
    325         struct dpu_encoder_phys_cmd *cmd_enc =
    326                 to_dpu_encoder_phys_cmd(phys_enc);
    327         struct dpu_hw_tear_check tc_cfg = { 0 };
    328         struct drm_display_mode *mode;
    329         bool tc_enable = true;
    330         u32 vsync_hz;
                ^^^^^^^^^^^^

    331         struct dpu_kms *dpu_kms;
    332 
    333         if (!phys_enc->hw_pp) {
    334                 DPU_ERROR("invalid encoder\n");
    335                 return;
    336         }
    337         mode = &phys_enc->cached_mode;
    338 
    339         DPU_DEBUG_CMDENC(cmd_enc, "pp %d\n", phys_enc->hw_pp->idx - PINGPONG_0);
    340 
    341         if (!phys_enc->hw_pp->ops.setup_tearcheck ||
    342                 !phys_enc->hw_pp->ops.enable_tearcheck) {
    343                 DPU_DEBUG_CMDENC(cmd_enc, "tearcheck not supported\n");
    344                 return;
    345         }
    346 
    347         dpu_kms = phys_enc->dpu_kms;
    348 
    349         /*
    350          * TE default: dsi byte clock calculated base on 70 fps;
    351          * around 14 ms to complete a kickoff cycle if te disabled;
    352          * vclk_line base on 60 fps; write is faster than read;
    353          * init == start == rdptr;
    354          *
    355          * vsync_count is ratio of MDP VSYNC clock frequency to LCD panel
    356          * frequency divided by the no. of rows (lines) in the LCDpanel.
    357          */
    358         vsync_hz = dpu_kms_get_clk_rate(dpu_kms, "vsync");
--> 359         if (vsync_hz <= 0) {

dpu_kms_get_clk_rate() returns -EINVAL (but cast to u64).  The "vsync_hz"
variable is a u32 so it can't be less than zero and the -EINVAL is
treated as a success.

    360                 DPU_DEBUG_CMDENC(cmd_enc, "invalid - vsync_hz %u\n",
    361                                  vsync_hz);
    362                 return;
    363         }
    364 
    365         tc_cfg.vsync_count = vsync_hz /
    366                                 (mode->vtotal * drm_mode_vrefresh(mode));

regards,
dan carpenter

regards,
dan carpenter
