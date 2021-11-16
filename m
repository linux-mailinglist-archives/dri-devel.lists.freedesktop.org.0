Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB8E453202
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 13:19:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C9D56E9F4;
	Tue, 16 Nov 2021 12:19:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F5016E9F4
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 12:19:34 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AGBDbrZ016941; 
 Tue, 16 Nov 2021 12:19:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=WHa5Aw+NMoRsQKgDzT0flH+zsM/+0YYvRxXhqEGyoTU=;
 b=gzh94tGLEBsi4a6dX9GFyr8aLMN2e8T/GpKGkM5njoqE6OIafNlueSNp4JvAhiCXHG+t
 BZoL3Jst1aTTW5IRuvlvdBZc8EMyh8oc2LBdK/M3qe8JxqGJGqgu5f5rbmqDDS+bH+om
 WhgW18YbCLpyKmzohtLLiAuMS/IpVmE2Ih4Bf3MtiEvmlbLECNXCVWHMwcp1uDXNLpW0
 V6pwXtjYny3QKFc8mn4lgL/vXG8IEanvRtnJau/ZMFqBV63y3qDnPnnylQMguTcSbqww
 hCh1WvgG2cpmOHUzDJ1g4LMXuJjiMlNAGPQwMv/me3VWnNL7ooFOdm7txvXqdY9vWR5T Xg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cbh3e0vta-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Nov 2021 12:19:32 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AGCH3R5036021;
 Tue, 16 Nov 2021 12:19:31 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
 by userp3020.oracle.com with ESMTP id 3caq4sj9s7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Nov 2021 12:19:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I4XvOoW33nTHkDJ/kV34v0hNrITjJtUHop/PO4GxgxcrO3x8RW09mL1DzpfIBlr2QR5IwjBOmrHRhwLAt/QBl6uOzGu46e/wLxPdFKIwo6uwN/o7FmfwFZZyHa4bXFX+3tduQ8nsozYZlZFQWZNJtE6RuW7u0UHenl/lA7Xtq5zF4f31cPZpZvGZTkp6otpKsqksaqIyu7fKk9blY5FYxue63y4N8zrNMIz3To6co9o0jeUdL/eHaGJz+ycXCnFIO7DKpiYrlp9kjINKiY6k/HMcB8JHh6lZHSlYV7P1ibvDrR7JaPJvIZlQz0djm6Ror+CDIm6Iiyoy+J64xDrKcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WHa5Aw+NMoRsQKgDzT0flH+zsM/+0YYvRxXhqEGyoTU=;
 b=W1xKFzTLlxZhIqCAgDcUQ8mwNBn/DjM7JX8/toZkHvhXCNR9dqjciPyzprreqRWAjupWVW0b7FhVFnGOoigUl7WkvODWGfhOypPTGZzKThge6r2Df3H3wtVF1hLJv2A4EvSwTifp50KS7ECzxq8spyI0TOVlhgbuGIvD8Fz4gC4RpCy+3nDROzfOP8wtqEI4sfD8N5tu+mAeSUQHIbaf4sapqhUlizlq30EFhhI/wHFN6VrmQql4m8fmVm1AQeW6nBLtcacw756//PocAkgYk53mBh2iDWdgcoDQOkHFgoPGptEpR3kbjhowd8PUaiArot5s6x/rI7UctOzUOCPP0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WHa5Aw+NMoRsQKgDzT0flH+zsM/+0YYvRxXhqEGyoTU=;
 b=W93jWJ4mJz7YzT125FUpsPPjqddl/dLbjXzARXiO3ujhU8UHfjHmX4c33COxVOHwZE4o2AMmbSJyDmFHfO2Tg6BYZC73Gu0epUcTKK6dXugJFSa95klM6/VYlXbKXOPx7xuRjgdN16+heCQ66116a+8R1uN1apzcLB5Xc7Me9W8=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4500.namprd10.prod.outlook.com
 (2603:10b6:303:98::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Tue, 16 Nov
 2021 12:19:29 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4690.016; Tue, 16 Nov 2021
 12:19:29 +0000
Date: Tue, 16 Nov 2021 15:19:09 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: dmitry.baryshkov@linaro.org
Subject: [bug report] drm/msm/dpu: merge struct dpu_irq into struct dpu_hw_intr
Message-ID: <20211116121909.GA17234@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0121.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::18) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (102.222.70.114) by ZR0P278CA0121.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26 via Frontend
 Transport; Tue, 16 Nov 2021 12:19:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d74dfb85-89b5-4849-ead8-08d9a8fb56c1
X-MS-TrafficTypeDiagnostic: CO1PR10MB4500:
X-Microsoft-Antispam-PRVS: <CO1PR10MB45009D39DFEFE854EC5D9F9F8E999@CO1PR10MB4500.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l5UBzgxvFaXA1argvs7WnwdsR5OmFMeZ2s6K9o2/ju6Ub6eMYQWya0StjyKyqeNTwpRoOtmhW7J8oMJ8HQ4VjECVBtj8hlOWsxPRkgponzbjTWB5OyUBTNq1WTsjvWWyTkIBwrdtFc9/i0ZizfS2NUEJC4FcfG8Lvd5JqRuwU/L5KVihOlc61eK0pnf5DL0OPLQpksu58mkd4arImDX7l5Pdhgf5Hnr31DtGVyZpqCvWJXZhJZbI58lTbEgKY90q3pxMi3z+5oeRAbR6RH95xks+RObKvpKGQuZ/yQOMyyEYTrx9a1YBk8K6bWi+GIKydb6fgm/ZSd4rda63eX/a8N9t308sUF4LEqlLZ0nGlzoyC+H3dTnt3MtPbWs9PI+dLZq7Ikz1e0x6ReZjKT5TUXCs8xp0K37I9UHjI2c8NthslWMq+6fYAaDvRq26p4+SH9eHOl+m5oZbPAaL6JLcEO2/NoAWBJ6RXRz/PJSRCKwRZLDxJ/G31atY4AeNReAGNqIjHQjWunzlehfHbG9L5fbhSisYE6ATyuH0vfXlfG2wyEOIOweSKH34QgWUwGNKrsPQVpsxc0ULHF8tKu6c/ahXrwh/lHvMP+eQLEKu7WvvuOgvoyqhGZdln63OP9BeKkP2L7Xs01BwNEG3CzUeo/MGBZGwHXmQkDZCef9m55eeehpZkhidUhGomXVgc4E6dhflr+xWWvB4YCZi8S/ovA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38350700002)(4326008)(6916009)(66476007)(6496006)(8676002)(66556008)(44832011)(66946007)(38100700002)(508600001)(5660300002)(86362001)(52116002)(186003)(1076003)(33656002)(956004)(83380400001)(2906002)(9576002)(26005)(316002)(55016002)(33716001)(9686003)(6666004)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1D0CWhCKx9dMwEF+2nombMmf0992no/+sjnunpzzhQkAKy8evhN5W96Bd4uL?=
 =?us-ascii?Q?FlW8rRg835phgNkqY0vA4JPcZX7g+Ymkrd4rWFYQXZ2uZtgKKLqUCxA0wtI+?=
 =?us-ascii?Q?lK6lH/rw8spWA+EmGWL6FhsnZeFsaKBNSsLivhYJM+I4QDDrOhT81mfr4tOG?=
 =?us-ascii?Q?Fp5BSNVwfZr7jVl+VZY1sONJcd47e83eS7T3Bg5STvpGYaBASDy/46IQ2rce?=
 =?us-ascii?Q?fGhBHd+zOXd0rb/1gs3sK/AEi+VQqBySXJ9h5KcsZrBrJfWvtzL6E29n8jmg?=
 =?us-ascii?Q?72IHUp5RqRZ2S3oe5EGLdMMmFHC9HMk0EgPB8hVp910g0TtFNdauP4koNRTy?=
 =?us-ascii?Q?WRM+gJ2KgxEA2+vGHgvOVj6axPnbaBHluT5I2k43WQ+q92ye/87mb/tM9Io2?=
 =?us-ascii?Q?gd4rnwxXeOnQAGlNkcQG/e1tsoXYUq3i8oBN87lgiduBuZzvOzQWdGr95VmK?=
 =?us-ascii?Q?OI3qP1hmMyYE7GqD42vkFq5ga2zzwTkbRI2Zrcz3Qg1MoGbCfKNmXrp8T1ZE?=
 =?us-ascii?Q?z2aMsnGMKeL+V57ym663D0k6CzKe+WYFKUVvPovwIETOQ9hq+319mBJAXBbb?=
 =?us-ascii?Q?xWxuceu35YrqhZPQrwxYBgMHkNpjXHbWwSNC3Yf/BL3pZZRnIkiQOO5SCj61?=
 =?us-ascii?Q?zhGocG4bE/6k05OzmUyGRfbzX7PdIykiy1mJqiFHjpRPx7geBX++0ws/ck7O?=
 =?us-ascii?Q?KniIXdyXsJtU2P2S9Ur4Lyo1hL+3CzErrcDpHbXXuhg1p29AZCoTO9SoCtcj?=
 =?us-ascii?Q?EPnJf7pUIE1ZXtmpJ8jEiqdo+CHFna2Qdz/joN3euhREoxA8G8YwL0GU/+0x?=
 =?us-ascii?Q?x523A91GgliM8yGMidyOHoHFALWLbj9CKxAy1n/0OQ/WYs2QunDO6W0sT710?=
 =?us-ascii?Q?LhN2jaMU5j49YxQXk+8OBb3ki8w+qsMy+/uVfSdsH+EMki3ld62h6TFnCA9j?=
 =?us-ascii?Q?6OXxIhEdo9d0zJ6fImlgeFqusnMldpMU0EdgiPwJFfmo52nEBnOkgIPRSly9?=
 =?us-ascii?Q?9eQ1vOJQwHZV4f3uuqajZE7UIcm+aNy26+Wgli/FnelRsTGK0yTf9BIls4yA?=
 =?us-ascii?Q?KaZ/BnkgefvnO4MJPRNPScpircnbloYetu8A2zUM470NdFwFxKcsvp4w3Uod?=
 =?us-ascii?Q?du2F+vfMro+omtJu9kS/1doXk0vERXd9E43FbvxtM+jyKDpcp3S0D2mMAD0M?=
 =?us-ascii?Q?XP/k97R127DdTvEIc8BE3KPIlix/+vT+CkT9ryrAiwspgtwOjMW4X/Iy/TRh?=
 =?us-ascii?Q?ievFxrCkKea3xstzP5YuWuix+z6VKz7i7LhfpGp7h3v5CNyvJwh30YhyF7BK?=
 =?us-ascii?Q?4OWegGEUMP5HSRypWn9/yokKLF9lBxlOsDXy8opaRuZs8/gjEN5oc4lcWjaA?=
 =?us-ascii?Q?PmMW7Kb2dfAM1qLraiUMbyQqdH3eJwVuYeNLiGWL4l4hSLki103fCON1MWv9?=
 =?us-ascii?Q?bFis5vcCbaYFR+5ja6WIKLQaqUY92MfxSvmCQpI5qdyGM6RP2tUsBKyWj/C+?=
 =?us-ascii?Q?7faEi4hm5XxceaOdnxTGFgkIBYoOYWDo+2FuXYn0Yo+5Ccuji8u48pDtYT5S?=
 =?us-ascii?Q?MrDcnrWxqUWx+1C9bKurHq0SfQeb+t2/vYRI67fI6/3xPgSRp9izxLT7+Ed6?=
 =?us-ascii?Q?fjH1PCFSKl2QDaSsUEZkzbQoNq/vzPvM6t1BzVJetM38eTXjEmu3cpJ0nzs+?=
 =?us-ascii?Q?gJgauFi2WADp8S8pOEf1uO8q0nI=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d74dfb85-89b5-4849-ead8-08d9a8fb56c1
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 12:19:29.7111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XWFC9XSxkY3vFbmRKj004Iew6hXg47IX9vaQN/sKKYqkZLhYIQgMpOG67PlynN7LGjvR11V8iK3dLiYOWyiI/THO/1RaDylHImbpSqSzyBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4500
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10169
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 mlxscore=0
 phishscore=0 bulkscore=0 mlxlogscore=834 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111160063
X-Proofpoint-GUID: CkLmcD0weHCINWblIj2LK-3qVYWQekT4
X-Proofpoint-ORIG-GUID: CkLmcD0weHCINWblIj2LK-3qVYWQekT4
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Dmitry Baryshkov,

The patch f25f656608e3: "drm/msm/dpu: merge struct dpu_irq into
struct dpu_hw_intr" from Jun 18, 2021, leads to the following Smatch
static checker warnings:

drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:569 dpu_core_irq_preinstall()
error: potential null dereference 'dpu_kms->hw_intr->irq_cb_tbl'.  (kcalloc returns null)

drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:570 dpu_core_irq_preinstall()
error: potential null dereference 'dpu_kms->hw_intr->irq_counts'.  (kcalloc returns null)

drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
    554 void dpu_core_irq_preinstall(struct dpu_kms *dpu_kms)
    555 {
    556         int i;
    557 
    558         pm_runtime_get_sync(&dpu_kms->pdev->dev);
    559         dpu_clear_irqs(dpu_kms);
    560         dpu_disable_all_irqs(dpu_kms);
    561         pm_runtime_put_sync(&dpu_kms->pdev->dev);
    562 
    563         /* Create irq callbacks for all possible irq_idx */
    564         dpu_kms->hw_intr->irq_cb_tbl = kcalloc(dpu_kms->hw_intr->total_irqs,
    565                         sizeof(struct list_head), GFP_KERNEL);
    566         dpu_kms->hw_intr->irq_counts = kcalloc(dpu_kms->hw_intr->total_irqs,
    567                         sizeof(atomic_t), GFP_KERNEL);

No checks for these kcallocs...  It's not actually new code but shuffling
them around makes them show up as new in my tests.

    568         for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++) {
--> 569                 INIT_LIST_HEAD(&dpu_kms->hw_intr->irq_cb_tbl[i]);
    570                 atomic_set(&dpu_kms->hw_intr->irq_counts[i], 0);
    571         }
    572 }

regards,
dan carpenter
