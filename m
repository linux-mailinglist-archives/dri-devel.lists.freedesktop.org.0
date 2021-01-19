Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 696362FBC8D
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 17:36:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E9E86E241;
	Tue, 19 Jan 2021 16:36:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A4889C2C;
 Tue, 19 Jan 2021 16:36:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iVXfXgZO5Zhmq3L/ncrw5zQD0KQq5AjkWnAcezst8LZa1H7iWDrKb9WDmu0/7TLMVg7QX9xMChShIRFmfrlfNgdXJF4FA1zE/PBdHPJnlEcXN6T31KL8yGjq2WdnmqqI0QcWN6WbvkDFdYyeR4ZkC4IYgjbLaAdovIIznsm0+ZvygBILJ+RqGdybCRapbJnAc1+yN0U//iR8oPZjV4biEdHL3Z1q/9VBsgXSyvGUrrEFFlKXRMjmq2xkm+na7i4XfWkGvJ0N0KiT9YwvtgoLlTtGhbI526EUbnqUd7oq3GjdUbw5gsp2f+t2flyjIAdnUYLhJL+LFAlTxDtHUwc3Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tq46SyrdjTEDqvIs++GzpcouHyTyAr3tpRcJYPj2GKA=;
 b=KvqpEPdAmBS13b37IpWZNSgK6iDcbggpDplDePfDjwp/ngSt9yHVt4PmWAWpzAmhxICzGMtvqPWH8VGCQ8Nvemz1VzX8s7bpP0wvmO9lqcuvJP9fH9MfzeDcELLRLv+qd1FPhF8xRQSYSw9xsFzofEeaFMqbCWgwyF6CzSmCc9dP6R/xnafqL4H1mWlOMfUbj+RRdiNowoZ3G02y12aSN+57s2+fzg97qHr4IsgAHblacWietrgEgLAkYdpARcUdeWrflwOCe1fFA4VftfMvsRMSXxwQ37+DPTHAEjA2dtmlpuBTd+U2/G2x2X+I/oXxN3Dtdp65bgCvNEloQd534w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tq46SyrdjTEDqvIs++GzpcouHyTyAr3tpRcJYPj2GKA=;
 b=zk8c7J9ZawW2a0e/japZR73ULwxJNWUnvmAfjlC4HnwaJGIqeSssduZmAL4ON3qHANa4LgEhZDH7AfhQZIaH1JUAceP8ARDz8aIp+W/3OIxXaKd51yINiT/gD2AlfQN3mqDy/mgVzRaYq77yH3N++9ArD5CQZ10aUMiUOV+/HqY=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4591.namprd12.prod.outlook.com (2603:10b6:806:9d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Tue, 19 Jan
 2021 16:36:05 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921%5]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 16:36:05 +0000
Subject: Re: [PATCH v4 10/14] dmr/amdgpu: Move some sysfs attrs creation to
 default_attr
To: Greg KH <gregkh@linuxfoundation.org>
References: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
 <1611003683-3534-11-git-send-email-andrey.grodzovsky@amd.com>
 <YAaLmBMlDRr56erH@kroah.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <3650d98a-2d73-06b8-7f06-ca7728b5c4b5@amd.com>
Date: Tue, 19 Jan 2021 11:36:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <YAaLmBMlDRr56erH@kroah.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:c1b5:6dec:d289:5430]
X-ClientProxiedBy: YT1PR01CA0125.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::34) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:c1b5:6dec:d289:5430]
 (2607:fea8:3edf:49b0:c1b5:6dec:d289:5430) by
 YT1PR01CA0125.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Tue, 19 Jan 2021 16:36:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 83338fc0-bbb5-4fbc-0701-08d8bc9850b2
X-MS-TrafficTypeDiagnostic: SA0PR12MB4591:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB45913779D9DE3988D38B0BCFEAA39@SA0PR12MB4591.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Expih3PI83xriH1zvOWzynfbZV3Osa1b6Z36t16bGpNZxTRTE7S9vw45UsX/cQT5VZTU3y+kz1ftlYKuy75bp71NkgvQBHN3uiQs6DSYwvM6yVulQ/lc9H354s5BM5qjVOKCI387+gLIqJgUKO9OKS7G0io0V/8PwGyGpsSRdH/NgcdFVVBHP7PMWcZQiDK1kAj8A1MGo9WcoJ/VIKx/HJy+fciQE63Z+ykpieQwAO33HgCQPkF4u6Fdo599OLFW7awNd+tGuLTnMvz1/cksfkiiUgs3HVTHB64GkGWQi6Csb3IsMTE6HjyadJMgch8HZG65dL/5Ru2pzuktKSA5GMiUn2pfUAazQ+E+xvbkrPL3HA8bVHZYnOG6VMz1S57k1Jc1wCBhlqxTLyTMkycDLAzLB/DAc1ABNjOy1pgovqvEeYOenvTY5IeCZkY/7XRiRxWtlfF89LCgg7vqE7EetaG9UBuMBTX6Y+21dWRFDtw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(376002)(346002)(39850400004)(8676002)(53546011)(2906002)(6486002)(7416002)(52116002)(31686004)(86362001)(5660300002)(2616005)(66556008)(478600001)(66476007)(66946007)(186003)(16526019)(36756003)(316002)(6916009)(4744005)(8936002)(31696002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SFEwc2xRblN4L3ZtM3QvWDRrVGZxY05VOE00bWVXUTlkTWUzN3dCY050L001?=
 =?utf-8?B?ZVFNN1FlcDlBbkpaZVZHOXh6NGp1b1E1VU84Nk9UU0NMQjQvUWNGaHFlaC9o?=
 =?utf-8?B?SUxvSXd4UjZPcW1Kam5WeVA0eWZnZm83Y3VNUFFSYjlLOEdWcSs1blVTUDd6?=
 =?utf-8?B?dWo4MTVsTi9XYlFKbSt5a0ZZb052b0hMTWJldC9NNXM3RTZ0SDdYK3ZMTjRU?=
 =?utf-8?B?OVQ4czhxOWt4OE1TWWFhZTNNQlBIQzdVMVdkOUFGN3d6QW9GRTBqQmV5Q0l6?=
 =?utf-8?B?QXVvOEt0cHNKaXhkcE5LeTFVRklFcnVmaHh2S1BUaDRFdGQraG5ITXpNdERO?=
 =?utf-8?B?TE9qMzBucy91SmdINlQ1SURTdkFTUzdYakhsSWJiT2FQQ3hjN0RXelFMSVNj?=
 =?utf-8?B?ajRucURPWEhnMnJQd2x5TFFlNkZzUTljUXJTYUtob2EzWWpRRjEzOEkybm9C?=
 =?utf-8?B?bDJ4bmVtUXRXeFJPalVTQ1lDUVczT25yMlBrSHRpaG94T2crMFFhRWcrdkFX?=
 =?utf-8?B?bjVqWVQ2cXFvMUV5RXF5MUFtYlh1UDRyZWhDT1JDcmJmRUxnOHZWd2FHNmtl?=
 =?utf-8?B?OENvaW15R1F5SjMzL0t2Q0JuK0s2QTU1MVlXdzhWWWZOTk15UnQxanQ3Rnh1?=
 =?utf-8?B?R1BHcUNoZDNyR1RsZFlzbUhORlJ0L1VrT2pJS3pVQzhZKzdad3JzQytaLzN2?=
 =?utf-8?B?TFZuWUI0QXdlRnVGbGlqU0htVE5GWDNKU3dGeVAzYk5iV1cyV1RVZnprbmsy?=
 =?utf-8?B?UE1yTnpoZnVnaWYyMDdUZFRWQ0NZSE52RGVxbnZXZ0pqZVNGYmV0b01Kam0w?=
 =?utf-8?B?Nko4a294RUVDV2JhUmlieEpSS0hsZmZDYnF2SkNacTJET0lKMzNSbjJzQWtT?=
 =?utf-8?B?dlBGQXg3Z1NITVFEU0xjZC9OS1piVzh1QUxLVWdGZkhoVVpmL3hGMGtiYTVw?=
 =?utf-8?B?ZjJCVjR5K3dGU1NCVjBxWVh3a01sVFptYzBkYTlJWFVablVLQ25DbDU0d3RI?=
 =?utf-8?B?aVEwZHJYRG1oNWJZc1gwcWI5L1E3bmoxUVJBRjBKVXNYWEMyRm94Rm4vZTdi?=
 =?utf-8?B?U0U0dlh6VmxkcFI1eWw1cTJlVlp3cW84UkhUOGtXU1JGalFBdXhFaEhMY2Er?=
 =?utf-8?B?Y3RlNHAxdExHMkxyVjdjYitTMnVuN2NVSDEzZkNkVEdSdUNHbW5ZT0RaSlJM?=
 =?utf-8?B?Nkl2Y21IODdyMHU4dUJHNDB2eWJwd0VubWVSUmQ2dytSZ1FhTGpoUTM3T0tT?=
 =?utf-8?B?NzRNdHJXckxnTFpwMTRrVUxCSE5zdHZONVJ2dDUrakNldytNMVR2ZHN2OGFV?=
 =?utf-8?B?SlZodmFMTUx4cnp6Z2N1UWQvVTRLcmJJZTJhOW8xUUc3NCtzVUVBaERtVFkx?=
 =?utf-8?B?ZnR3Q3pvN0JRMFF0M3lOcWJrSnVYWEIrL1pzaWVnclZEbGw5cVpReWVWdW1h?=
 =?utf-8?B?UkVSaWdqOGlITUl1OEV1UktDYW9Rd2lYc2syVjBqK2lDb3N0dXAralcrMHBB?=
 =?utf-8?B?VU1kOFpkRzlTdTZsY0N2TEJ2MTNjeG9VdWRJS3BBZ2dlZENOV3J5eHBqVGNX?=
 =?utf-8?B?aGNidz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83338fc0-bbb5-4fbc-0701-08d8bc9850b2
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 16:36:05.0628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OBJpZeE54H/KRygWeUxzsaSZoE9KnDI+H03fKPJTyyD1szigmSu5Nw6xx1yX7fBjQdVhpKLAiG1oA5btKyi16Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4591
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
Cc: ckoenig.leichtzumerken@gmail.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 Alexander.Deucher@amd.com, yuq825@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/19/21 2:34 AM, Greg KH wrote:
> On Mon, Jan 18, 2021 at 04:01:19PM -0500, Andrey Grodzovsky wrote:
>>   static struct pci_driver amdgpu_kms_pci_driver = {
>>   	.name = DRIVER_NAME,
>>   	.id_table = pciidlist,
>> @@ -1595,6 +1607,7 @@ static struct pci_driver amdgpu_kms_pci_driver = {
>>   	.shutdown = amdgpu_pci_shutdown,
>>   	.driver.pm = &amdgpu_pm_ops,
>>   	.err_handler = &amdgpu_pci_err_handler,
>> +	.driver.dev_groups = amdgpu_sysfs_groups,
> Shouldn't this just be:
> 	groups - amdgpu_sysfs_groups,
>
> Why go to the "driver root" here?


Because I still didn't get to your suggestion to propose a patch to add groups to
pci_driver, it's located in 'base' driver struct.

Andrey


>
> Other than that tiny thing, looks good to me, nice cleanup!
>
> greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
