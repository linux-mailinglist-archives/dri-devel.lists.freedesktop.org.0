Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8632615803A
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 17:55:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C62D66E9C2;
	Mon, 10 Feb 2020 16:55:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690079.outbound.protection.outlook.com [40.107.69.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FA256E9C2;
 Mon, 10 Feb 2020 16:55:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kTavgaUaRyjuVUEJ4rBDym/rWNRrPJUU27NLxzn8S9WZJPW+zkkfmGqXD2UyLnYs3wzslWn5H9vyda+SH7HCQNXeHaI33bo2GCMiAW46iAQJ9AlQWeJ4T8WrV2jAKZsqEsqu7gHvraBv5tQYCmU7t4Os9zaTO9MBmRKFf10HRwVMLTLeqEdVU/mYFqKiJXGiYQ5hQIVW77H0vrxGaVYNn7+1A8lAVIBfhaWsmMExNGU9RyCC/EZAaPpcvqDEpvalWmEcVbrX5z/U+Z3JiPGIH7Ptzsr61mw/gtwyblewOm8dzoMJ/p4oPDyRqkPy4F3uhSPLj9AyGNlV1buk6l2fHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wUag9vYQroBmQc3VWFuBTgewzqrDm880+5+imMy26XM=;
 b=fErffhJFvBh8Pu87DFM/EOkLo3Ns2RPgS6lxBghm/IFJmzHMyAnYb9EDnZzcuV4Z8pqis1e2shmW2KHMqyhsjXvOxl8uuu0k7PgkbgeMb/KeAkPD21NO5YL4ZC4UV11arbkTgA4WZ1eCD89siRiwbwS/vqDEVQQxR6QIjj5gr4asdmuUHE6Yopj57xGq8xiMVBao1qrebAlLa8Tlyv6RTBY2DHUFjsJELT8YNaHX+d8pyGE5JSergVWdg1XB+MH/jgor2MUOytpuPKVnOcfJPrIkm4t8qKD9QVv6hLo05tSzosB5u90Gv3lk49kWPHZHFHUhmaVrButEwOlqW5Y5Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wUag9vYQroBmQc3VWFuBTgewzqrDm880+5+imMy26XM=;
 b=ZJ590B+6AtvePVgplVlZj0HbsdFjL79A7vtKmk5NC8bwlLql0I1PPJXHk3piSZXtmZZZRiG+3/jO6YUiBxGAnO41Hxk45Htg3EP/6wcEmIzM8RjdYTct+Am4iPc5KmkWVpO6uB+NtsA1mK+sFLpqn4IVUpjb4+8slemNvXrUeZE=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Andrey.Grodzovsky@amd.com; 
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1824.namprd12.prod.outlook.com (10.175.55.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21; Mon, 10 Feb 2020 16:55:13 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::610d:b9b1:dbd1:1150]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::610d:b9b1:dbd1:1150%6]) with mapi id 15.20.2707.030; Mon, 10 Feb 2020
 16:55:13 +0000
Subject: Re: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>
References: <1574715089-14875-1-git-send-email-andrey.grodzovsky@amd.com>
 <0de5ad33ca2ff86fee13a453aa9096c274afbd3c.camel@pengutronix.de>
 <d710aba7c3acc537bfb1c20362f7c8dbee421f02.camel@pengutronix.de>
 <740fb929-e788-075b-87db-e2524ed4b086@gmail.com>
 <CADnq5_Np=OFgqAb4TPRz5yqx1YZSwWybS=F6R_r6r01QRrzADA@mail.gmail.com>
 <61128c11-9e65-bc21-6306-ea4efea18b76@amd.com>
 <90de1234-a103-a695-4ad7-83b1486e15ee@amd.com>
Message-ID: <02ba868c-e904-3681-c795-59a4e48926d5@amd.com>
Date: Mon, 10 Feb 2020 11:55:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <90de1234-a103-a695-4ad7-83b1486e15ee@amd.com>
Content-Type: multipart/mixed; boundary="------------684F2B71D5B38DBA69CA8C66"
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0020.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::33)
 To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
MIME-Version: 1.0
Received: from [IPv6:2607:fea8:3edf:fc00:539:d09a:c77b:eb95]
 (2607:fea8:3edf:fc00:539:d09a:c77b:eb95) by
 YT1PR01CA0020.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21 via Frontend Transport; Mon, 10 Feb 2020 16:55:12 +0000
X-Originating-IP: [2607:fea8:3edf:fc00:539:d09a:c77b:eb95]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fe7a1446-44ff-453b-0501-08d7ae49ff0b
X-MS-TrafficTypeDiagnostic: MWHPR12MB1824:|MWHPR12MB1824:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB1824A9B6A6528BEE9C392FAAEA190@MWHPR12MB1824.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-Forefront-PRVS: 03094A4065
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(199004)(189003)(86362001)(2906002)(5660300002)(316002)(235185007)(110136005)(31696002)(33964004)(53546011)(54906003)(2616005)(16526019)(186003)(36756003)(31686004)(478600001)(8936002)(52116002)(8676002)(81156014)(66476007)(81166006)(6486002)(66616009)(66556008)(66946007)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1824;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Td9R7Zn11J7TqVxMhnbTqYD6ul+v+dnstzCtmAaumBpG3aIVTPhz4DIVEQAXQ7SbQha12iImvv+8ZH5gfxyMFBfcsmYptpfZ0dX25iC79Kqx0Ao46qR1SMV2it0usl8FDtB9VAon6z48Cq13XuGvpGS+0YQp6XQrqzyxlXGz8MbPwJkAJPvaz0CiC01ph44OmBxws/Uopya5sQWLVWMgtGqz5ADIl38mu6RTIZusGAWzHZj8WhxEbPtWs104R107ezqQiNp3zhzpBlfzNm+SYX2dF+Oa/UVU5f0bjFndJy06leEBA2Lq40Vhraecd9ya8/JCaxJeTbUkW7OnBxl3jYinB4mpQUSAMlKxgj2adyY14qoDGrsT3ix5iO5fp5yy367bv4Vj1dZFUbDV+CDfHgUH4sUewsTqKG0bzaIbPMAFvw834v/CQWWCF5x9H21c
X-MS-Exchange-AntiSpam-MessageData: 21dY4L9aIgiCm5tY0xvS5QZXReqSt3JIjkJIeQ0HhxODUVvIiYQDU5XvJsdZ+p+siHfVYOsWBJwDN5ovb5P85fIICdlXu156WBUPYk6bk9z8+aNaYTeF+Du9gNx5usYtCU//QkRgGucioCl/x3i/otCNOtdurYxgkPRdAN+C3G7Bjk5aWoC6UfwrZlErEDOXS4yoOpXLJdI37ywqepFRbg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe7a1446-44ff-453b-0501-08d7ae49ff0b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2020 16:55:13.5050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EGz5zwQQaIzFthQniMzjrdsgE/CNekqqNRy9yz4REtJN5K0kA4Ngn9sNsCsTp+QqlWooaTtSXtEoGOlYJzNWIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1824
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
Cc: Emily Deng <Emily.Deng@amd.com>, steven.price@arm.com,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------684F2B71D5B38DBA69CA8C66
Content-Type: multipart/alternative;
 boundary="------------CCD5EDC85EF42F20E5AC02CB"

--------------CCD5EDC85EF42F20E5AC02CB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Lucas - Ping on my question and also I attached this temporary solution 
for etnaviv to clarify my point. If that something acceptable for now at 
least i can do the same for v3d where it requires a bit more code changes.

Andrey

On 2/6/20 10:49 AM, Andrey Grodzovsky wrote:
>> Well a revert would break our driver.
>>
>> The real solution is that somebody needs to sit down, gather ALL the 
>> requirements and then come up with a solution which is clean and 
>> works for everyone.
>>
>> Christian.
>
>
> I can to take on this as indeed our general design on this becomes 
> more and more entangled as GPU reset scenarios grow in complexity (at 
> least in AMD driver). Currently I am on a high priority internal task 
> which should take me around a week or 2 to finish and after that I can 
> get to it.
>
> Regarding temporary solution  - I looked into v3d and etnaviv use 
> cases and we in AMD actually face the same scenario where we decide to 
> skip HW reset if the guilty job did finish by the time we are 
> processing the timeout  (see amdgpu_device_gpu_recover and 
> skip_hw_reset goto) - the difference is we always call 
> drm_sched_stop/start irrespectively of whether we are going to 
> actually HW reset or not (same as extend timeout). I wonder if 
> something like this can be done also for ve3 and etnaviv ?
>
> Andrey 

--------------CCD5EDC85EF42F20E5AC02CB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Lucas - Ping on my question and also I attached this temporary
      solution for etnaviv to clarify my point. If that something
      acceptable for now at least i can do the same for v3d where it
      requires a bit more code changes.</p>
    <p>Andrey<br>
    </p>
    <div class="moz-cite-prefix">On 2/6/20 10:49 AM, Andrey Grodzovsky
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:90de1234-a103-a695-4ad7-83b1486e15ee@amd.com">
      <blockquote type="cite" style="color: #000000;">Well a revert
        would break our driver.
        <br>
        <br>
        The real solution is that somebody needs to sit down, gather ALL
        the requirements and then come up with a solution which is clean
        and works for everyone.
        <br>
        <br>
        Christian.
        <br>
      </blockquote>
      <br>
      <br>
      I can to take on this as indeed our general design on this becomes
      more and more entangled as GPU reset scenarios grow in complexity
      (at least in AMD driver). Currently I am on a high priority
      internal task which should take me around a week or 2 to finish
      and after that I can get to it.
      <br>
      <br>
      Regarding temporary solution&nbsp; - I looked into v3d and etnaviv use
      cases and we in AMD actually face the same scenario where we
      decide to skip HW reset if the guilty job did finish by the time
      we are processing the timeout&nbsp; (see amdgpu_device_gpu_recover and
      skip_hw_reset goto) - the difference is we always call
      drm_sched_stop/start irrespectively of whether we are going to
      actually HW reset or not (same as extend timeout). I wonder if
      something like this can be done also for ve3 and etnaviv ?
      <br>
      <br>
      Andrey
    </blockquote>
  </body>
</html>

--------------CCD5EDC85EF42F20E5AC02CB--

--------------684F2B71D5B38DBA69CA8C66
Content-Type: text/x-patch;
 name="0001-drm-etnaviv-Always-execute-sched-stop-and-start.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-drm-etnaviv-Always-execute-sched-stop-and-start.patch"

From c3fa87856608463f14dddb03346c31054f3137c9 Mon Sep 17 00:00:00 2001
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Date: Mon, 10 Feb 2020 11:44:39 -0500
Subject: drm/etnaviv: Always execute sched stop and start.

During job timeout always stop and restart the scheduler even
if no HW resetis taking place.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_sched.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index 4e3e95d..270caa8 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -89,12 +89,17 @@ static void etnaviv_sched_timedout_job(struct drm_sched_job *sched_job)
 	u32 dma_addr;
 	int change;
 
+
+
+	/* block scheduler */
+	drm_sched_stop(&gpu->sched, sched_job);
+
 	/*
 	 * If the GPU managed to complete this jobs fence, the timout is
 	 * spurious. Bail out.
 	 */
 	if (dma_fence_is_signaled(submit->out_fence))
-		return;
+		goto skip_hw_reset;
 
 	/*
 	 * If the GPU is still making forward progress on the front-end (which
@@ -105,12 +110,9 @@ static void etnaviv_sched_timedout_job(struct drm_sched_job *sched_job)
 	change = dma_addr - gpu->hangcheck_dma_addr;
 	if (change < 0 || change > 16) {
 		gpu->hangcheck_dma_addr = dma_addr;
-		return;
+		goto skip_hw_reset;
 	}
 
-	/* block scheduler */
-	drm_sched_stop(&gpu->sched, sched_job);
-
 	if(sched_job)
 		drm_sched_increase_karma(sched_job);
 
@@ -120,6 +122,9 @@ static void etnaviv_sched_timedout_job(struct drm_sched_job *sched_job)
 
 	drm_sched_resubmit_jobs(&gpu->sched);
 
+
+skip_hw_reset:
+
 	/* restart scheduler after GPU is usable again */
 	drm_sched_start(&gpu->sched, true);
 }
-- 
2.7.4


--------------684F2B71D5B38DBA69CA8C66
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--------------684F2B71D5B38DBA69CA8C66--
