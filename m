Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B61AC846E21
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 11:40:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A8610E92C;
	Fri,  2 Feb 2024 10:40:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="abJ2hz3M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2074.outbound.protection.outlook.com [40.107.220.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E4810E3DA
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 10:40:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kf8Og0+vpLzNOSo+Dg6BGdu54ufw61KnvB8mrV/1VgJC9CmYgV+gVl+Rtj8wFsZeP5eKzmXJEDlydjxn7vS3wJF6mRWhNp1MUdjMZPwgcDIacm1xd81XCgAV6iBR63D5ZrxHzVZeWXPHRQmjIH2Da8mwQXIIpLNJwS0LcA4MA4mLiy0s5nVCG9sBHC2Xe15/1wFKoQmfvfEf6dhdhyx5mMozlibwxmnLdc5+lnGmxZfHT/sgv54/xyITdbzURwZ0noU7F2ExE0dqjYvM+2pZQDVSYR2JsdoHIL4OmeRU1v/2q18JxxSP6jUTG+RUxL48GForteHzmllOpFDuVzDfEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6To/UWqsVFRUYJgKhFhH1TGxKrkvuNwWwspZqupyy20=;
 b=LIf6dEyUOE/JdfuogscHhQrJtj4LzyJtGa2FqqaAy5kjGzc2PQfEqS4VUXN0STKjHtUzmWenLeWgvntx6oTruADYMHSrWSn+l/J2UD7ChXUxghiIGKmGC9x69hkNbu5QUMeegF51ya17lCzr5BYbkjy3HKfCVCztkk52KTWpEmZHL25aYa/4q/cNDTSE6Y88MzePj6uI4v9dixOqU37KuzoLawRuA/v4a/CiS0EWQkr4J5S1NqweU0Hogo3tujIuu04ba/Blu4olVtNCSfA15RP2OpQAOqJ8ZzTnuqeCxFlYPcLq8PWR2RzV7TageEc0T25q5EsHXVSBm1umuELUEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6To/UWqsVFRUYJgKhFhH1TGxKrkvuNwWwspZqupyy20=;
 b=abJ2hz3MQ2RxNeZ6hnmTEMxPjCnkDz2oJK8as4riPAt6PZcJAbeKvDBwG1dbzaWo2meRXH++hovmjOovt/jWzWcmMn00Op5dvAtDZF9ApT0tkDpFNeUBFDebdTEqZyxA3ovI0xeRcSfK0RjDZmMEZjcHMEy9F8kLNUNprPM3zfBJXffL7ciTFe1di7EpwVrqFTfV1uUuYWsb6/XatKSp+dIJYlREXZvpTDIxj32dNBCE0s/s5a2SLGdj0d0fOj/1TF7m3L/INu7UmrehIFUoR31YLDWFYIBfE5p4vup5kXvTGSDkw/JgsoL3qkDcWpNR2Qd13BVvGK9jr8+hM2UCcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 CY8PR12MB7146.namprd12.prod.outlook.com (2603:10b6:930:5e::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7270.8; Fri, 2 Feb 2024 10:40:42 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::acb6:8bd8:e40b:2bfe]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::acb6:8bd8:e40b:2bfe%3]) with mapi id 15.20.7270.010; Fri, 2 Feb 2024
 10:40:42 +0000
Message-ID: <96bc6d37-1000-4651-9a26-a8446dd64803@nvidia.com>
Date: Fri, 2 Feb 2024 10:40:36 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/tegra: Remove of_dma_configure() from
 host1x_device_add()
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, patches@lists.linux.dev
References: <0-v1-c76c50cd425e+15298-host1x_no_iommu_conf_jgg@nvidia.com>
 <583b9145-cbbe-4a03-8120-e2a66a6093c7@nvidia.com>
 <20240131153312.GM1455070@nvidia.com>
 <a1597113-3ec9-445c-90d1-62df97406fb2@nvidia.com>
 <20240201200212.GQ1455070@nvidia.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20240201200212.GQ1455070@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P302CA0010.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::18) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|CY8PR12MB7146:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ad38744-d772-4712-c421-08dc23db67b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WWCcp3Kp74E6qdqIeecCGXDHIwG30KYaJ2Cvlnv1vRQmfJY9xnqgXq//EJko2alkl6EpkH1lLUTiRXWqE6RMVE37/a04OYt6pPzUfMxHcTqm0E5CEE6niy+v1+xWde0ju6ECXL2gloARQfmg2NmWO2afCs1fn+hhEKC82hF6QRz6EB1Vz+JvS5Qcb64fiP2T+R9CsvMjIUddObz5SmY24Y/oYrP7u8bhdAe5bRGMD9uCit9xCSd3KDDELAk6iLBhDQtF5mgU8xWv/vAqTHRbsZ2AFA4g09bWf4ds+dKyfBAk2kN6m5Hrwc53KJYlRtlpSq4zzKFwUWmFnggQYmnF4iHx0FRVCjmgvyFErvcxv1lb1GnG9XIu4iDZ9J6GbKUreduo55AUuEEKOQAW35aAGCkuLHqURLqWeMurvci9o5S38nj9+hp0iohGXipBhzsGRwYlCRTEa2l5ZkJpIrYUtjWKSzvymhtnWtIG4vDuAdhtM3qKldO3wYBVUYlm/gJdwARW+3vI+RYd0/ufeU9PQbgbK80ow8KKqYhKYvJgJGVWl99T3SRcfuKQrMfRJ/VcwN36IhVZqOnb6euY/4gDANKtLyH2qOdjlBSCgy0OGrYI1FOrg2sfrZR8RlCnYw0vcmpxbNwl8aph47gcUNSqR8/Iyo1jOcjiwZ8a2DwckOKKUiGyL9cqadp9L661hSp4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5444.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(366004)(346002)(376002)(396003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(66556008)(41300700001)(8676002)(6862004)(31696002)(4326008)(2906002)(8936002)(5660300002)(86362001)(36756003)(316002)(37006003)(66476007)(6636002)(83380400001)(38100700002)(54906003)(6486002)(55236004)(6506007)(478600001)(6512007)(53546011)(6666004)(66946007)(2616005)(26005)(31686004)(43740500002)(45980500001)(357404004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVR0TVNnVUFxeE84QzJJT3doNFJ3SDdUTkJRVElVem5QZTNxa0VBOEN0Rm5Q?=
 =?utf-8?B?QnBzUVR0U1JkMGE4UHRRTjU1YkMwaVR3S01ST05WcE1OdTVTTmtxTk1HSWxh?=
 =?utf-8?B?eUtOVFgyVitPSmN4L2VnOHVyUmpKcnVzT3Z2YjI1UnI5a0Q5TTEvaHFZc1dj?=
 =?utf-8?B?SStlSEpCajZMcThlTUE2bDZGbTNnSGxjajJCdnhSRis0UURJSXpaYU5LNGFF?=
 =?utf-8?B?dnArME5QSkoxUkZaWjk1N2FYQ3ZlVGNKSjI3a2JOSU9ZcWozTnZka2kyQlJn?=
 =?utf-8?B?NEpMWkIvT1hER3RuZmJqWmZXbjdQUWNOQTVvSmlZVldRMnphZkFPYm9YYllX?=
 =?utf-8?B?OFFKK2pFM1pubGVsa1dJS1BVbzBTUGdhc1JuU2RaeDBnZVdNaldSMXl3MFp4?=
 =?utf-8?B?bkxRdy9KMWp1WG01SWpPamk3RHdiMnVkVnpxS3JUZFZvaDcwWk5Kc21hN01X?=
 =?utf-8?B?RTJ2Y1dCeUYvWkZBNm9taXlUeW1lb0U2b3ZQUjRrVzZpYjBlRTl3TzM3MExB?=
 =?utf-8?B?a09nTk83YytUNkZaaVg4Y0FyQzQ0WmxnY1VXb2lvdStzKzhOU2xiK0Z6MGdK?=
 =?utf-8?B?VWpORkZMcU10MWN0OGhUeEplU1ZWdTQ3aHgvWG8wdVN0enB4dmptVUZYZ3NH?=
 =?utf-8?B?V1o0R1U5dU54cFpsdmorUnkxQUNCQmRoS1dlVSttTFhpWlp5akYvMHZLMFNt?=
 =?utf-8?B?NVRJQWlqSmlIUWhCaGhaZXI1dTNZbmoxZkl1cnR2Ty9iQXNjbm1RZC96NWpS?=
 =?utf-8?B?MGVJOVdmSmUyRERqalgrTzRqZFFEQmVlbmVpT25JcnVlSTFUVnRpRFc0VlBa?=
 =?utf-8?B?MXJFRFdIUHg1VlFIcTVScWEzNlZBaFhac3hrZVh6bk1pUG9XOEkyRzFSeW16?=
 =?utf-8?B?VEdMKysxUWR5TzYxamZrNmxxQVpHMUhPR0NNb1U3ZFMvMExJeTVsaG93Umdw?=
 =?utf-8?B?Z0x2VEZpUXgzdGpLMkhUOERCSytsUXlhdlZGSmpKWVBmRSttSjVTdDJ1b2k4?=
 =?utf-8?B?VTNBZnBNcktsd05ZMEFkZkpCNWNWV2k4Z1hiNkRBNUJrSEdxQTNCeGxKTS94?=
 =?utf-8?B?dTZqMXh1cjREcmFka2JRRnNYcFZzRU5wckk2SDhLcWlDc1hHOTFPeHJ1YmFi?=
 =?utf-8?B?OElUd1k0SVgwdXJSNXhmZDNCejg2WTh5SHZ6cWtzeDBvNThCM2tPTXhBOUo3?=
 =?utf-8?B?R2pneldsZVFiR3FKeTdmYUJoaytlMUlPZHB1VjBRY0ZXUTFObExuc1pUenlz?=
 =?utf-8?B?emtoMjBlWnAyRFB5MjNBYnFTSU1mWDdDWVdPVEg1RERDbjlNTVh5UG9ndmY0?=
 =?utf-8?B?MkdWNXdIdHlPRnAxeHZQR0oyZHNjODlFR3RrV3REckNLbytGdTFZVWZFdnB3?=
 =?utf-8?B?Q0cvK1BlSEpOb3lSNzlndGM3dDNVZnVZaE5OMktPcWxxL3VTb3Z1WExZUEdC?=
 =?utf-8?B?MG5BQmRBZFZ3YzlRaDJERjcwekJzb3B4Y3dxWDlmc0pCc3lFY2xaK2pOTldP?=
 =?utf-8?B?azNaV05qdVZ3Rk45K2Q1enE5K3dhNm5KU3lMYXJ0VW9zSUNabUNsdkx5aXk1?=
 =?utf-8?B?azlwNmhDOUNneURTMlJ4QU84RGl6WlRQc3lhOVhFWXBvYnRiUzNxNU5JMjJ1?=
 =?utf-8?B?ZkkxVFhoc2NLQmtGY3dLRG9pNDBadmxQVllVWmFiOFJ3TEZvUjNXakhieE40?=
 =?utf-8?B?Q2p1NGEwekJUdnRpeC9ab01XWFdxcWI4d3E4K0U1U2lsbFI3WUptLzFzRVlK?=
 =?utf-8?B?YXlSYmVZVzlMdnhtQ3I4VTFIQWI1R2I0VXNONHhLb0xJK042NTlxQm5tMVpZ?=
 =?utf-8?B?YUUvTVg2ZFNQcXBXb055YXdUQXdhK2N5NytxY2tLeEx5VTBiMlhnV2EwQU5q?=
 =?utf-8?B?eWZOSzlLVzR5aXM4S1hOY0VBY0h0dXIzbWZKcjNQMzZOSG0zcjdLaGM0RTIr?=
 =?utf-8?B?d2FrWlB3OGlpM3RzRmtVZ3hKaUt0eStLOVlzampTdWxGa1ZhdmtxUDhuK1ox?=
 =?utf-8?B?OXZVVTkyeEVQTWpFKzVRYnR1NlF0RFdmNUZRNzhUZ1U5V1RMRnQ3WUF2RkhS?=
 =?utf-8?B?dDdtejhLWTFzN0NpRDVaTzRseXpqekRFL0h2TFQ4V20rckJKU1hmbHFwcVRV?=
 =?utf-8?Q?C+Le1p8+0cSewVbahFhPzB7l+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ad38744-d772-4712-c421-08dc23db67b7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 10:40:42.6223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cE5gR6jFYVtXql6lJezX8DNtaqtlXv0UjLmOEiVAEqjoAhUu2eb6pJJ49Rn7B5T4PeX+oGIepKimp8Vha1CuTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7146
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


On 01/02/2024 20:02, Jason Gunthorpe wrote:
> On Thu, Feb 01, 2024 at 07:35:24PM +0000, Jon Hunter wrote:
>>> You mean this sequence?
>>>
>>> 		err = device_add(&ctx->dev);
>>> 		if (err) {
>>> 			dev_err(host1x->dev, "could not add context device %d: %d\n", i, err);
>>> 			put_device(&ctx->dev);
>>> 			goto unreg_devices;
>>> 		}
>>>
>>> 		err = of_dma_configure_id(&ctx->dev, node, true, &i);
>>> 		if (err) {
>>> 			dev_err(host1x->dev, "IOMMU configuration failed for context device %d: %d\n",
>>> 				i, err);
>>> 			device_unregister(&ctx->dev);
>>> 			goto unreg_devices;
>>> 		}
>>
>> Yes this sequence.
>>
>>> I didn't seem an obvious place that this would get fixed up later?
>>>
>>> device_add() was done before so the iommu_device_link() shouldn't be
>>> failing? Are you hitting a duplicate link (ie remove the nowarn from
>>> iommu_device_link())
>>
>>
>> Removing the '_nowarn' does appear to fix it, although it is not clear to me
>> why?
> 
> What did you do to remove? Just the letters or the whole line?


Yes sorry, to be clear I made the following change ...

diff --git a/drivers/iommu/iommu-sysfs.c b/drivers/iommu/iommu-sysfs.c
index cbe378c34ba3..7bc9c6d2baab 100644
--- a/drivers/iommu/iommu-sysfs.c
+++ b/drivers/iommu/iommu-sysfs.c
@@ -112,7 +112,7 @@ int iommu_device_link(struct iommu_device *iommu, struct device *link)
         if (ret)
                 return ret;
  
-       ret = sysfs_create_link_nowarn(&link->kobj, &iommu->dev->kobj, "iommu");
+       ret = sysfs_create_link(&link->kobj, &iommu->dev->kobj, "iommu");
         if (ret)
  
> I was thinking the letters because it triggers a large debug message.
> 
> But, what is the actual log output you see, is it -EEXIST?

I see ...

  ERR KERN host1x drm: iommu configuration for device failed with -ENOENT
  
> If it is coming and going is it a race of some kind?

It is consistent without the above. However, I did not think that the
above change would change the returning on -ENOENT? I will add more
debug.

Jon

-- 
nvpublic
