Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B80A31D12D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Feb 2021 20:50:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDC026E49D;
	Tue, 16 Feb 2021 19:50:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2059.outbound.protection.outlook.com [40.107.244.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E5A6E49D;
 Tue, 16 Feb 2021 19:50:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BlOmhxavHNdw2ejnfCxaC/G0AfHeMl3XSFDKTzo45bx1AeZrj4sxhSV9RGQTkijc98Jf1SBeSxhV0RLSyLvsgLcEA+Vs1hrMnLiSCeYlyQ3zZCS0MH/wsF7Kn+PDcXD230qF7Vuy9x6s8oiSRsbvml1r/rSUQxzhib28ZTzDYZLPR3vfpieEEyWbIjVxjiIrccgDj/02lkKwtKiyYR3v71P3p5ITct546d6Mx9h65TU3aX2ePWf559rgLCfChhRbccW7p3SCDmM6KGcydfRzGw3kC1ldvgFaSZhafGTrsfQdH9lT/moipu4+MszHL775tNwt0LCOqJBpfieMN9TwPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rrdoCR+mydOQKlBIvOYX7UGrJOCG+THYAzShPYrYKtA=;
 b=kWq6+etSIIQutcF63FHTMmGFGbXRSCxeOJChYsGyfRul19A0RUkQ1V8VLsFLYNorUlMWu7eEaHSbVRmQ8j39/DtFty+hIAPaJS5k6IMSWUbljQriVaPYQzAy2B7QUH2btF0SbRxqoRjzVVqEJhkZoyGTYstUAmA+R5Cg1oH6W7z26C+87T+eujBI1fD891TV5OLFgwyzNF/GFwu3x6WVdISdTQ2xlz1otXkVgAAsY8dbFgg/fe1fJdJtlNsGt2TepyJ0ZSh/L5Fn3iX4Jhkj9d5BDnHKKjPv21sJccXIGax2HTy8PCKq5XzQEidyIbnAQe1DIDQkRK/qsuCEyjjvkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rrdoCR+mydOQKlBIvOYX7UGrJOCG+THYAzShPYrYKtA=;
 b=G23BNOoBDY9aWci3IGOHaRT7GbT+91G2mQzUOWQZIjkzyIA4Ta+HVH5gK0DnT5aP0ifsHdnkG94+Is0W1FLXDNjcOVJOULbO983Y/+Sa3Za9dSWiQjWwukuz1HARgeb8H77/wAqj8C8PxpE/nFmkSSTCNxemaIhK+HJKTxrhklc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB2583.namprd12.prod.outlook.com (2603:10b6:4:b3::28) by
 DM6PR12MB3209.namprd12.prod.outlook.com (2603:10b6:5:184::33) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.34; Tue, 16 Feb 2021 19:50:14 +0000
Received: from DM5PR12MB2583.namprd12.prod.outlook.com
 ([fe80::9c57:59fa:b83c:2942]) by DM5PR12MB2583.namprd12.prod.outlook.com
 ([fe80::9c57:59fa:b83c:2942%7]) with mapi id 15.20.3805.038; Tue, 16 Feb 2021
 19:50:13 +0000
Subject: Re: [PATCH 2/2] drm/amdkfd: Cleanup kfd_process if init_cwsr_apu fails
To: Felix Kuehling <Felix.Kuehling@amd.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org
References: <20210212064034.29912-1-Felix.Kuehling@amd.com>
 <20210212064034.29912-2-Felix.Kuehling@amd.com>
From: philip yang <yangp@amd.com>
Message-ID: <01f8d87a-13b6-5b0b-cef8-0e5c713a9fe2@amd.com>
Date: Tue, 16 Feb 2021 14:50:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210212064034.29912-2-Felix.Kuehling@amd.com>
Content-Language: en-US
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0003.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::16)
 To DM5PR12MB2583.namprd12.prod.outlook.com
 (2603:10b6:4:b3::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.226.38] (165.204.55.251) by
 YT1PR01CA0003.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.36 via Frontend Transport; Tue, 16 Feb 2021 19:50:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e82520b5-126c-4f4a-d06b-08d8d2b41378
X-MS-TrafficTypeDiagnostic: DM6PR12MB3209:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3209364A74E4385E7B1B551CE6879@DM6PR12MB3209.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:198;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YtLXS04GsY62SK1/Z6V6D84X9eKTXgSadvyoaSe73Wzgr0EDnhhJqd5F6tC5bHElSnC/NgQ5kzhdX1Roi0AZ6HXgybtvUHefIgR3EhZU0xR3us8E9o1xE+ndUaaDsvkntg2xXJw5mEzcCZqG2QbiFOIywVRclLp+UyCLInrKoJVGLs4buCRbCIpYfAhEk8BknblM8LhE7Vg5/Ayn0fSRKBoXKhsEK/0SqMb7IlhBp/VPSwRWBEDmBg2ymQWshxURoFr/yU+detn0/Ij02jMvWAGew7sriaQs5XwQtgJbs/oFF5Pc4SIiLBsCCD027z/FWcOiaMqxLvpVhrPX59nqDwbV6JrdEV7IP4YeZfbR+yLCRIFaWSxxw4/X6P74UqHHhRq4mRe9wdPDJdWMfeEXzg/R7ulJL3TDhBtBMx9Kn3RsP4OwnkfGw37gRml3Tsef7fdFKSclHM22TAMH8HI4MCEDegRXSub3zQJAj+GTL1vGef5SKJEY/nN/7kjoVFxYxq4DLYu7TyhyrrcPMFrryPIDPiu/8BxkmeaJsWLe62fwYWQS4OKFmc6H2p+3W3Ci7MFK0xHQAQJkwzR4BwucSeP7xBhM9LVTnPso1vWhsoM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB2583.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39850400004)(346002)(136003)(376002)(2616005)(66556008)(66476007)(5660300002)(31696002)(8936002)(2906002)(66946007)(36756003)(52116002)(956004)(8676002)(316002)(6486002)(16576012)(450100002)(16526019)(83380400001)(478600001)(31686004)(186003)(53546011)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VVg1enBqNkVDQ1hNVHJ5TDZUdUhsRVd2a2prTnVDME5GdWwzREsrL3NvaGJn?=
 =?utf-8?B?TWQzcER1Q1F3QzNJWDdNTzRXT1hVSXYxWUV4YzhJdHY2V09PSmJYQzl2S1d2?=
 =?utf-8?B?N2crYTBjRmY2MWRZMVZuSFFtakJQRHFzeFBXVVV0dXV6RkdlRnVITTdLN1VT?=
 =?utf-8?B?Z0xVbjFTQ0grcHNnQUNVQkFKWFY5MGVKZzMwTTB5YWp6WklSVVJIdSs5U210?=
 =?utf-8?B?MlRQUWJxRGxOOWVxTVpwajMyVDZ0YnltemxQZnhHRTJFQm8zWkV1NXJJdzBl?=
 =?utf-8?B?RGpVcEMzekxselEwVDBLTGZZQjJZcGl1OWlSM1VOZjJlZVBqeXI0bnFnN3lC?=
 =?utf-8?B?Nm1XL1JJY2hpVWpsNjVnWHZDaUthNzAydGpUQ05YRmZ4YkJyVW1kM3lFRzhq?=
 =?utf-8?B?OVFSeVRGL2lHMlBMTWNJdTNudG1RYUVWTjFKT0VoNFZnOUpwODgrSnprZmFs?=
 =?utf-8?B?NFI4VkRqYW1NblpNbzZEelZuR25zMW41UytUdzlqMTVDV3dxTjBicERwL2ti?=
 =?utf-8?B?a2ZObUVldDNMWkFuQ0FQTjFZQkNETWJxMUVqekhvU2kvSlZkWHhpa3RDbE5K?=
 =?utf-8?B?bjQ5SjVZOE5nUDJKQUJrTXZ4T0pLYXYwL0FnNVkwZk9RWmVyUjFDWHlZQ2Zp?=
 =?utf-8?B?bWcwSlllQXNIeDZlaUhNenFFT1IzUDd5bmlxNUFjVitFSWl4Z2tFMmljL1Z1?=
 =?utf-8?B?UEpaWis3ZDU0YjRvZ3hYcGo2NHVCOE9FNkdXVHRGSlZrSjRqZGZ1cFZCMitD?=
 =?utf-8?B?Si9oY3paSXE5bkQ1LytBR2dpUXdBbU4vb3JKSFV4QXdpbG5ZUzYzOW5wYTlJ?=
 =?utf-8?B?TzU3SUozTmh3empsajlPYWxrQ1NnSUg2Y2ZPOXV2RWtXaGNvdWp4cWlZaUd3?=
 =?utf-8?B?OGtsdUZGbGhJQUhwRnZlcU40TzgwQjNlT0F3ekJnb0NjNUMrMGRnQkFqL0Rq?=
 =?utf-8?B?QVBycGwxWmlNOGNMOWYydnpqNksrSnQxN1RIYlJ0a3JsYTNBVnhDdSs5Nm83?=
 =?utf-8?B?aVlRWEZmUWpubktiTlZHYmp4cFVDSlFJdnBQUHlXYXJiempEZkJ1VEYrbXJ1?=
 =?utf-8?B?YTlBd0Zia0h2NmZiQWprclBkeTZ6Z3l4S2RuOXp5ejYzcG5ZM2xnVVhoYXk0?=
 =?utf-8?B?QkhSZVU0Sk92bHpTWFZ1Z2ZYSzFJQjdsNEQxK2JOODZmWDVjMW9KeFJseDgx?=
 =?utf-8?B?TXA4bzZ1MS9kenFDK0h1YUFCVzc3YUxlYkh4SHI3VjZ4NnFmRTRtNU9ycXhC?=
 =?utf-8?B?Z2ZpNjhuYkU4NWlBamdwdVpHbGh3T0ZGMUNJSDFmWWVCRHM2aWc3N3hXYllL?=
 =?utf-8?B?SzNIR25CVDRPK1lZS0orRTN2SU5BbDlhZkRIZFdZVmhYYnc4YjFWZFJpYWgv?=
 =?utf-8?B?ejZvTDFPZTBMZEpGQXBHSCsrUkxlSTdoUUVPZndJSkd6Unp1Yy96dGhMMjNm?=
 =?utf-8?B?SndiWVNmQ21CQ3BlZDFtUWxYNklTNGxjOUpoNldkQk10RjRBT0s5YjFNb0pj?=
 =?utf-8?B?ck9EV1FUWElicHk2anREV2NkOHYxazgwQkJpTjBZUWwvWjA0OCtDb2V6ekxY?=
 =?utf-8?B?enBCNHU4UTdXRFlqTUJ4eTk3bG1neGJMdWwyZmdBd09WL2tUOWsyNU15NU5B?=
 =?utf-8?B?NFYyQXM2dk12dTdkdXlZSnl1clQ3QUNtdEFSSWtwdkNIcjhDSG1pWDJOWVdu?=
 =?utf-8?B?TXNGWEIySlBUVldHQm9aTDdKaW5iQ3R0YVdQK3kwWEJkc1NsOVkySmt4UmU5?=
 =?utf-8?Q?KGb9Mw5cJWD7EWBFvTPB91W4V2MiS6vB3EkZXgC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e82520b5-126c-4f4a-d06b-08d8d2b41378
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2583.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2021 19:50:13.8874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /sIchc/TjGsK/FKAqYYqW0xS0/EcmxopJWCoUnbSAdrO2a88t4P0/TaxU0IlL8lt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3209
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
Content-Type: multipart/mixed; boundary="===============1471385912=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1471385912==
Content-Type: text/html; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <pre class="moz-quote-pre" wrap="">Reviewed-by: Philip Yang <a class="moz-txt-link-rfc2396E" href="mailto:philip.yang@amd.com">&lt;philip.yang@amd.com&gt;</a> for the series.</pre>
    <div class="moz-cite-prefix">On 2021-02-12 1:40 a.m., Felix Kuehling
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210212064034.29912-2-Felix.Kuehling@amd.com">
      <pre class="moz-quote-pre" wrap="">If init_cwsr_apu fails, we currently leave the kfd_process structure in
place anyway. The next kfd_open will then succeed, using the existing
kfd_process structure. Fix that by cleaning up the kfd_process after a
failure in init_cwsr_apu.

Signed-off-by: Felix Kuehling <a class="moz-txt-link-rfc2396E" href="mailto:Felix.Kuehling@amd.com">&lt;Felix.Kuehling@amd.com&gt;</a>
---
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 145cd0a17d50..a4d7682289bb 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -775,10 +775,8 @@ struct kfd_process *kfd_create_process(struct file *filep)
 			goto out;
 
 		ret = kfd_process_init_cwsr_apu(process, filep);
-		if (ret) {
-			process = ERR_PTR(ret);
-			goto out;
-		}
+		if (ret)
+			goto out_destroy;
 
 		if (!procfs.kobj)
 			goto out;
@@ -826,6 +824,14 @@ struct kfd_process *kfd_create_process(struct file *filep)
 	mutex_unlock(&amp;kfd_processes_mutex);
 
 	return process;
+
+out_destroy:
+	hash_del_rcu(&amp;process-&gt;kfd_processes);
+	mutex_unlock(&amp;kfd_processes_mutex);
+	synchronize_srcu(&amp;kfd_processes_srcu);
+	/* kfd_process_free_notifier will trigger the cleanup */
+	mmu_notifier_put(&amp;process-&gt;mmu_notifier);
+	return ERR_PTR(ret);
 }
 
 struct kfd_process *kfd_get_process(const struct task_struct *thread)
</pre>
    </blockquote>
  </body>
</html>

--===============1471385912==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1471385912==--
