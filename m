Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 498CE37C013
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 16:27:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2386B6EC1A;
	Wed, 12 May 2021 14:27:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060.outbound.protection.outlook.com [40.107.223.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 971846EC14;
 Wed, 12 May 2021 14:27:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U+Eewd0CLuSwSrxK2iNd+N11Ag2uXXSflAUMvxU58wk/3a8nRqswUDjkXSihqO4RcikcJepDLP0yoh0vazSKq7r5syxS/WOUHcB70kN1rxf8jJv3+wVmF3gLirQ/P1K6CNkLkA7gVH2ECM5fqEwYx0zHjyg2kZ1m77fpBMPWBVwwQXIW1l4g7Tc1ojGxxPB1WlxHIbNHK6R+Awgbc3/5gwE6QrKyN8chv9RO1SlIOMqIOTV2XhH+hbKaSPyr9vc+4wr6pvlgvJMsKpch31WTsNkphvIplt8XbnNpyZZjV0Jk2cxAQDapvNyMXFHGyh3HHv5K+lGkmPJ3yjvJbzq4RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvCJ3p4J5b6j3Y4MhS7JBFeYIKw8tX02HYjT2myyNew=;
 b=NClw1aosdmAom2YbdRgfYIU24BgaLP+kgESmVxFQBbjzAY/KYYkSGbYcZYD3RgX65BSz9cvDalAXMqu/sLeafv3s5TiWxsoi3SlzP0KSUFVYW8AWMO+zkObdrhb4lXzILyMTsYQAV4BLZS/RMgEhV6RXaRobxMdaEf2c1wBgKy7UwqzX29+8yNPAAlyxyGspDvs/l8pvApZs9QfPJLtSz6eo0rc2R8EY5FlBE2w7v1TgTfq4QgBxnIJUR1syFGNSt/kLO3FCYy4+/3zMcMCFhL6QrJCncU+GbgY9PUOB7jAnTQjwHPOiN8CdgbfdujO8NgIzbkvBlJ8FEHxLMNYL8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvCJ3p4J5b6j3Y4MhS7JBFeYIKw8tX02HYjT2myyNew=;
 b=nuzT6bWjXxYiWGuUlPvhCLkzrocNnKXBxeykUb8ZHUJA22yXqLzNURmZJ5B25myLUh1ss5V5YTxsxl0TBD8cAkn1INPtYwnTpEzalCJqxwN2NKsf7sNTJc+XTh0H/nv19TtT9YQubOuNbTdDfz1bVwNMte1diF1vXxJX/G4wwbI=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2845.namprd12.prod.outlook.com (2603:10b6:805:75::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Wed, 12 May
 2021 14:27:33 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4129.026; Wed, 12 May 2021
 14:27:33 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v7 10/16] drm/sched: Make timeout timer rearm conditional.
Date: Wed, 12 May 2021 10:26:42 -0400
Message-Id: <20210512142648.666476-11-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
References: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2607:fea8:3edf:49b0:7576:4f76:97d8:1487]
X-ClientProxiedBy: YTOPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::45) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:7576:4f76:97d8:1487) by
 YTOPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.30 via Frontend
 Transport; Wed, 12 May 2021 14:27:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7617c67-b5ff-49a0-b218-08d9155214bc
X-MS-TrafficTypeDiagnostic: SN6PR12MB2845:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB28452375343F55BD175C6129EA529@SN6PR12MB2845.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KhyuVcsMoQnPkmDdtW1RBzrl3t+epjt0mjR37Gb5T3amsd9DFfRP6189FvF7IQghX39P5HgtZfyF0yoGJrZE/RPGjW8b2xosncgsEF136E+3wHuSh3163ujmXV+lKMIvPNVhQITmlK6vc56CPt7FX2LNGLPh0drXsEfwPtyq38+hsCifRucPtiCDWKnhU7RU0N7A20FqWMc277KoGT0LtrW+9plHP/iI2GP0iQ8iAdnxK7eQxkV8obGvhrKY5p+huUlctCmFhd3bOZCFySSbCha11mK1ZMwSS1AlAWV/Ad4a9+bLHuvwwyQal5D1OJ8nQxokfreCFT9Fc4kQ0qqCeUNeHiPFr1/2YSn0GBGVenJMd+coF3gZg1NXWx094y5qWC5w8pDQrXaTKKznqz1SmrgU8/leRMAvn0TXsIbgf7GIMcmQ4wTYvoeSr+8iZeVyUkZhq/TKwHvEybm8GuYta3yOYhxrJOS1yDQPkw48CnuMJxUBvb3uO0U1F0fGIoc0AGZv86WyywQFweFaGjr8EFMX+Y71+JR6BnDpvsF4Ez7I5KLH1bEutQ6xhao9OAG5pB6kAb+8KKF7AnAJyqWXmd/rW+ELefisxrRxUJ6oUgc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(396003)(346002)(136003)(366004)(6486002)(8676002)(54906003)(316002)(6512007)(16526019)(6636002)(478600001)(1076003)(186003)(4326008)(44832011)(2906002)(6506007)(8936002)(5660300002)(2616005)(38100700002)(66574015)(36756003)(86362001)(6666004)(66476007)(66946007)(66556008)(83380400001)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WnA0NmI2WmdTK3pyMjZpQmxkakpYUUxkd1NEc1NYRDFldXMxcm45Z3RDU2FV?=
 =?utf-8?B?NFk5blVaMU1PMU8zVzhIeEVuMERZTHhJL1dYenI0YXBOcFNJVmMrN3orY1V0?=
 =?utf-8?B?M3FyQXBFTldpZmNudy9naVdUNGh3YVNpSDlPY21xVk5UcEVENUJWRTY2RUc2?=
 =?utf-8?B?a0NnOUpDZXA5V3J4ZDY2RStjM3RzVGNVUnc2a2h4RlA0VXRIYUYyS3k5YmQ5?=
 =?utf-8?B?Ukl4QldRa0pWakhZSHlEeGJteXFqdVFLYmU1Qi9yc09PTG9UYmdDbWNVZWJn?=
 =?utf-8?B?eEI3V0p6Zk9DU1B0ODVyMU1oZFhjMy9hcEtZV3hPY3ltY2V5blR2YzhaQ0ph?=
 =?utf-8?B?MnBicU9MTmFpTTZtKzc4R1RUSGV2V1U4K3VuNnA3WHlPRUVKeWF0T2RGaUdK?=
 =?utf-8?B?MlI1cW0yZVE5UUZyN1loSFp4ZFFaNWwrSFRRc3JkVWNHTlYycVR3RGgwOGtF?=
 =?utf-8?B?WFg5THhhb2x1THNKSXhaYTNoNnJpL2VQdlp0SUNWNVNBUHZVcTNUdWRGd0tw?=
 =?utf-8?B?ZktXYmMzbFhNZktVRHpLdE43eXF2OVUxOElVV1VTbklYRVI3OFUwNStCd0ow?=
 =?utf-8?B?enV0YUswSC9OSXdBdXJyQWFrZlQzOFpmZjJsZlhqQ2pLdUROWXpjQUN2VTNU?=
 =?utf-8?B?T2p5NmdFaWlMWCtsNEliakZnWENSNGI1OSsvb2RJZ1orWGxURzNKb093Tmxk?=
 =?utf-8?B?QlJBQjR2Q0F1dFNWRHlGRi9tOS9MbXhSNnpLTlovM0J0TkYyaFg2ZHhhUitn?=
 =?utf-8?B?MmNiOHk4MHZ3Tk5HeSt0Y0gzK0F4dGI2Mm11Z2JZQkc2ZHE4b3hwaE9ZODVr?=
 =?utf-8?B?WnhTRnZxWk9XUER3VkVyUUtmWWkwSUZNTzFjOXhCd3h0L0sycWtqM09sUG9t?=
 =?utf-8?B?cHA4YXVqZGt2SDJzTXAydkNIK2V4Ym1IMng5ZUppeGF5VGJQS1ZpbktWRnFG?=
 =?utf-8?B?N2JaakpBZGR4OWk0c2JFc0lURWkzdkxHaEtUWm00Zmc4ZWJXZVNJN2ZNT084?=
 =?utf-8?B?QU5FSGRIOHZiK2tzSUlRODd1eDlaR2JFS0M4WExTUVpDdy9ianU2enV4aE1a?=
 =?utf-8?B?ZnVzRHVPUjZKM2JobnNZRWwrbHRMSHFoSmRtcHRZZ1lZMUs3c2RoSXZOS1Ju?=
 =?utf-8?B?SGpxcmlJY0daN3kxMzl5NXc4M3ZVdmRTQlN0ZCtIc01KRkRMTFZRZ2xvNnY0?=
 =?utf-8?B?WG1lSWtLTG43N3ZvK1BwWFZ6RDdLdy9XRnpJbVNlVmVOdjZ5TTBNT0lyVnJr?=
 =?utf-8?B?NXlEeTI5c0dHU2s2TTRxT3JodzZ0d2V4bzU3czVSb3FnUEFGckZMU1AwRHFL?=
 =?utf-8?B?ekV3dC9vQ1had0VuT3JSUDc4UjJuNW5oTXNBZUxpWi9YTmx6RFhQM0crQ0JN?=
 =?utf-8?B?cUFwc0M3WmR1VTBseTVHamplT1NGaDZ6dThWRmoyUkd1Q0gyYTE3ZDkyNTU3?=
 =?utf-8?B?T1ppK0ZRWW56cXMwNlRqVElrcEtrelNHdzVDYkRGRmQxZjVHVmJkeFhYWXZQ?=
 =?utf-8?B?ZHR0cDlESGxjcTJDbWxEZjNGeWRhZk1xQnpjTXFaMVA0eXd2TU1ZZkR3TWFj?=
 =?utf-8?B?Um4wbVNDSlk5QXNEVlRnTkNuRXF2Tk9yNzNKenVHREFYbzJEVTZPV01QNXNC?=
 =?utf-8?B?THdPTWdKT0pJckZPYzhTU2h6NHBIdTU2Wmh4bE5uMXVmWExFbEFua0lzaEhX?=
 =?utf-8?B?V3IzekhTSS9kTXpYOVVWdThtdzlxNk5vVkhLZUlobXFmODlpUzRrTXpDaGNW?=
 =?utf-8?B?MXNzMGlrdXJ6VE5UT3VlN0R5SVQzTzE2akZET2lEV0NUaWZlYVdtd3NpbUhK?=
 =?utf-8?B?ZzgwcnhLdlBPNDNxa0s2dVc2Ty9DQ1duZ3NMS25qR0xzdUd4UlAraUwwbUJY?=
 =?utf-8?Q?sm1Zh9fAAQps3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7617c67-b5ff-49a0-b218-08d9155214bc
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2021 14:27:33.1106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MSzpb4eWgClP/ko3EO32H9TwmiF7WT7dWTws8GSqK+BnTDsgBsii8mhwdYouToTo2sSwFo+RDOHj4ifOEO2Bhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2845
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
Cc: gregkh@linuxfoundation.org, Felix.Kuehling@amd.com, helgaas@kernel.org,
 Alexander.Deucher@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We don't want to rearm the timer if driver hook reports
that the device is gone.

v5: Update drm_gpu_sched_stat values in code.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index f4f474944169..8d1211e87101 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -314,6 +314,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
 {
 	struct drm_gpu_scheduler *sched;
 	struct drm_sched_job *job;
+	enum drm_gpu_sched_stat status = DRM_GPU_SCHED_STAT_NOMINAL;
 
 	sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
 
@@ -331,7 +332,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
 		list_del_init(&job->list);
 		spin_unlock(&sched->job_list_lock);
 
-		job->sched->ops->timedout_job(job);
+		status = job->sched->ops->timedout_job(job);
 
 		/*
 		 * Guilty job did complete and hence needs to be manually removed
@@ -345,9 +346,11 @@ static void drm_sched_job_timedout(struct work_struct *work)
 		spin_unlock(&sched->job_list_lock);
 	}
 
-	spin_lock(&sched->job_list_lock);
-	drm_sched_start_timeout(sched);
-	spin_unlock(&sched->job_list_lock);
+	if (status != DRM_GPU_SCHED_STAT_ENODEV) {
+		spin_lock(&sched->job_list_lock);
+		drm_sched_start_timeout(sched);
+		spin_unlock(&sched->job_list_lock);
+	}
 }
 
  /**
-- 
2.25.1

