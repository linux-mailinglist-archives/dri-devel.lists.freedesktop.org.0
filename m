Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A3D633FA7
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 15:59:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF7C510E403;
	Tue, 22 Nov 2022 14:59:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F69910E403;
 Tue, 22 Nov 2022 14:59:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ep5o2zx3quAUFc2RK9loUoZXy1eEx2qqVer0Wdlf29fk9JLmqs5Aw6KePQ8yEo7Nk7qrMn2WlHEWOSDGhrAr26rpxBee7TC//dTL4F1J9Hx1OYA//JVeOJIYTMdBjkLfTswAaOy9aGxmJfO1TSQrG9Bo+XYciwfQbH86JiVwKp/deEKYk7J1iSz+vw3EOuLwURjqin4xXriEu/HNQIMPjkzzzDLOt22VvPbbVMDTXOpX48eUbg4U2waxGX9KBW9a1Ak5hT50OQTBHvYeMGKKI5ZQRm+WyFBjS6LjThSP3v72KywkWlGNUxoDeSYAQ+FJv/3puqPumJuMA1kTQXkCoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LXBDInt9hpKMJhRt9PfFd5cmdk9769hhb29370zxzPE=;
 b=AmBSSRdr0cvf8PyNk++zVnNGW8EgJiMvqEt4MZalAr9PyNoScLk/Ntgsx8yOitoW//9KkMIdqb7F6Ut7xDylcWW5mN72FFbs3F+JwhdF7WAa4MyzqqaFpVtndJnzmnkCyaaX0wHp1yTKq8XXU9xpgCBZRiWVN+tHVkyoUWBkEe6Hr9QwlagGJIIcLjOvDk3zUrMJjrC+nGqL6LtptCAj6LXlytU1SgLyYHSanXCnJiDdpXAYNkabx5tRZ5u46FXbVS2Rml70VrQApD4MPQo1B1tA4pADnOtuP1PzEJKz3a8N9jkQ527pjpWYi75I4z+IXVvWXVZfKr8VzVoN7ramBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LXBDInt9hpKMJhRt9PfFd5cmdk9769hhb29370zxzPE=;
 b=M7mMNytBdSlgWTlshsh3dzZceNRxWFGGhrZyC9As4It7E+uMXZO6sSZUdSdMlStlPZ2b7dFI4e2vZZfdEv3zNGU1BoOiSv5KuVfRXQjM+St3yPLKQ0yYBS5CQMPCCLg7xEmGZXLkUVHGsmw/fu0EuojoCgRy/XSTZ8b4jSaHlQA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4614.namprd12.prod.outlook.com (2603:10b6:a03:a6::22)
 by CH2PR12MB4325.namprd12.prod.outlook.com (2603:10b6:610:a9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 14:59:36 +0000
Received: from BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::3959:cdff:85bc:f148]) by BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::3959:cdff:85bc:f148%4]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 14:59:35 +0000
Message-ID: <0167740e-7581-e85d-68f0-dc3e01d2a9a5@amd.com>
Date: Tue, 22 Nov 2022 20:29:23 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH 1/2] drm/radeon: Fix PCI device refcount leak in
 radeon_atrm_get_bios()
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>,
 Xiongfeng Wang <wangxiongfeng2@huawei.com>
References: <20221122113043.18715-1-wangxiongfeng2@huawei.com>
 <20221122113043.18715-2-wangxiongfeng2@huawei.com>
 <CADnq5_NxLhU+zeNv4Esm=3Wn-=qHkRCzOmqT9a208BVZUn29pw@mail.gmail.com>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <CADnq5_NxLhU+zeNv4Esm=3Wn-=qHkRCzOmqT9a208BVZUn29pw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0073.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::6) To BYAPR12MB4614.namprd12.prod.outlook.com
 (2603:10b6:a03:a6::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4614:EE_|CH2PR12MB4325:EE_
X-MS-Office365-Filtering-Correlation-Id: 403ba1cf-98d2-4cbf-3802-08dacc9a2b41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gmSXyTJ2VIiaDuaMOGFIDJxagmErfwPG/5GR0lVr/nfqMK+zRkjQGiFYM6m5TplCCSXa320UwyaLnF3JURHnPTV1eSyrYNTlY0UJw3dZ10wTw3e4OtyA+UHx2msX/nrnmzqAkfKW14Tjhg2VfqCib2HCUBCBPK9xJeOKUItEDM2Lv1P5P8PNZw3OdQZPP1jpR2Yx5kMpQ9UfXUvPs/2pnG2jW/64uZB587GPK4CeoRL9KevHnlvRUvRMhJwoPzcqxCN0PKRsLXT/dV4iLUFwGf1vheAaTssntSk508cFt/2rLuaPVYvQLjEy1iRqRVD+7zo2znDWwrhAgpG8CecENHTJVXA+kKPhHOVyap1mxKXfwXgeYsRQGNa78YVmo/bWU6YV0v4BuzYKIEsgZdg7rrMSpsv3djlY7yEaYZ/0FURIq+WTMstXitrPlR/p8bscTOUroCGJHhBC79VS0QAzy09ukTHitFmcDq7oOrI76QiM+598lHf9KsYivYJCdEJo/aWuZ5SjIZI01ix/VkNhoguT5TSOXoxbY9LIeMK4s2ZjoDOZ7DGbvM5THhyIoORpKvcGCSPaTrSGBM6olLgSB7CHe2dP3SPZNQjE9Q6yteCQbqAPmHYMwGguvxdYrLmgRCfkPBYWZQ/YXqp9zFo3n215aq9HytWL9CkpUBFE63gMc0bn5ppo1okfxynq0rTf3b5NGqJzRzwvEN7fzXwdYN8Y+ODwIPzR1bL1nHpOs/U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4614.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(376002)(396003)(366004)(136003)(451199015)(86362001)(41300700001)(38100700002)(66476007)(2906002)(31696002)(478600001)(8936002)(5660300002)(53546011)(6666004)(2616005)(6506007)(4326008)(6512007)(6486002)(66556008)(66946007)(8676002)(316002)(186003)(26005)(110136005)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlV2QVpUZWlBOWhUMFRQVzA5cmJlVERnRnRobEJoZTJmdGdTcFpUcVV3U0lh?=
 =?utf-8?B?V3FIM1VSa2VOdngzeThla25UU2dMcWxpdDdIODhKODVMQ042T2NqbVJmRm9U?=
 =?utf-8?B?U2V5UTgwV215bFVhZDNoem1BODd2K01sNThmbjNscUMyT05JQ2Q0bTZ4N3ht?=
 =?utf-8?B?TU5oR29JMjlyWmZPR1NSZ3ZSancyNHRTU0puWVNIQzgxZGhsTzdoVlg4R0NV?=
 =?utf-8?B?V1J3Q1ZnQmxKeXd6TndoV1ZBVGpDTHpBbUFwSHRMT0N5aVpEbTZjUXorRnRx?=
 =?utf-8?B?N3h5ZS82SXRCNmFZbjlsWkdhbzhBUjhNb0s3MWQ4T3JSamFvc0Y4d0pOM0xN?=
 =?utf-8?B?QWRUVUVEWHJ3cEc2VmtZcTZhSVExVTRDTFVySTREMHIrOWxMSStSM05WcU5O?=
 =?utf-8?B?cm5rTU5ZY1FnZFJrbGhPVm9JajRZZkI4b0EwMzNHeFlTZkZEZmttT3NsdnVJ?=
 =?utf-8?B?amZpeXFJOEN5WWNqRmZpOUViN2s2aFNGWlB4Z1dRRmVHUVdPYkRKTHoxWkgr?=
 =?utf-8?B?RGZyNHk4dDdKK0xKWk1VdEd3M1EyYmx1Vk4wNW9SKzM4ZXh0RHF3RG5nbUZz?=
 =?utf-8?B?Q2VlKzc4c1FhNmh1azREMWg1Qm9QZXZyVGxFa25DTDh6NTRodmNWWHBGVkxB?=
 =?utf-8?B?UHE3QXFZMkVQWkNXN3FuaDhlVzFZL082cWZralNrdVMwK2RBZGowZ1pYQXFt?=
 =?utf-8?B?SGxGYkVyN1dZaWZ4MHE0R3g0cWJrdnlYSzdpbjRPTG9OMmVwVUM3K0w3djB4?=
 =?utf-8?B?UDI3cjdhTUFTR1NOWWVVWG0zYXExbTAzVmsvdDJGU3hKSWE1K2p1UkFXUC95?=
 =?utf-8?B?Z0FGTHpza2NKVU9ZRGJ2R2RQTG5aNHNmVFMxT04waTdIcElONmZJQmdwM0U1?=
 =?utf-8?B?dnVrd0ZGWUhwTmVRNEdPMWFtV1RTbXFrbFZxdnF4VytvOFRna0NrQy9NMnpH?=
 =?utf-8?B?YlhZQmpTUml0b1ZXbWM2ZDUrRFdSWjNoWnRtb0haQjZzWHRKTkpqTllmNzN3?=
 =?utf-8?B?b2ZNeVFuYVJvT2ljdmtCQ212YmhTS0xncU84dzNyK2Y3LzJ0TjdUaVVRRDE1?=
 =?utf-8?B?NitNOHQ5OFVPVmpXVUU0YzJhSTdVdVBaaE1LUUtRTmU3bmR0OWNwbWlkL1B5?=
 =?utf-8?B?TjlYdUlpSFNWcDB4OERVTmc2Sm5Xalo0a3puRWxjZ3JDS0svYWtWU2tQSE56?=
 =?utf-8?B?V0Q3V3FWcjAxQldmS3FIUjZQUWNLQnRjSFZxRnMxVWk5WHRjVDBPZW5NTzZE?=
 =?utf-8?B?TjdsVTNBaU1nWE94QW9vSEo3ak9tb1U1QnFacGZ3VitmS1BTTndHamdzY1lx?=
 =?utf-8?B?OE5ZSGQ1c1Z0QWsvNkgwN2M0MllkdzZEMm0yLzk1ekNON08yaWRmSldDTnlY?=
 =?utf-8?B?a05Ra3hGNlNXQlpORTNhVkpIbWxpczcxYjJnUVUwSzA4RlFUcHc5MDF4M2hh?=
 =?utf-8?B?UU9ObnpoYXR2Vm5BQXdoMUd4RzBWZmJNY2tPcjR4VFFXZlhtUmhqM21rdFEy?=
 =?utf-8?B?WENxRG1VRHJnU2Nsb2wwaE5KMkhibXpiN0NmU3hxdkJNMWw5cjYvRTNJS0FQ?=
 =?utf-8?B?RnZ6YUpZakVOOVBYZElUU1pqMHM4Q3dKK3lsZlNvZTZrZUN5RE11OFZ5eG1D?=
 =?utf-8?B?RnFqZEMycnJ6NjIxMG1SUCtLV2ZKTWhTa2NRTFdvcGdmanM2dE5XajJ5K2xZ?=
 =?utf-8?B?UU96eFRvdWZIeFUrZ3FlYkFLTVdNcUd0MXBtU3RHNkNPS3pRK0YxVDdxb1Bj?=
 =?utf-8?B?Z1BSM2s4NVE4TzFHTWY2RWJUam0wRElHZFRyeVRGNE1scFdMMVpXZzlKT1kz?=
 =?utf-8?B?OERycTRJZ1MzV2ZRTmNXcTkvUmpXZjlMeGFMcDNZREhZeTF5ZVUxQS9sZFFl?=
 =?utf-8?B?aGVmOGpKYnpVNE5nQ3FzSE1KNC90anZzSHluRzhkdVhrN0REQ1llRWRHWjRm?=
 =?utf-8?B?cmV1VGxnV3ZMdFpHeUJLaVJSUy9wQUtmTXpLYlVTdGlGNkxsUGxsS0MwVHhr?=
 =?utf-8?B?UGpHaDg2eHZYR1QyblA4dFZEOWN4MkRiempQeEhkM3ZqcTJnWTVMUDBvekh5?=
 =?utf-8?B?OVo5ZW9iNXlCMVdscjRRRTJ4Y25JWEZodkhpczM0R21vcWJMeTIxNWh4SS9O?=
 =?utf-8?Q?36DwCrVIqor7zP2P+7TOSsMUX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 403ba1cf-98d2-4cbf-3802-08dacc9a2b41
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 14:59:35.2664 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7gB6/Zdjrzt9xKcGMEjHKrfr2p7loVRg4fPJFqua4oIGScPFpm0dILDPmTAgT7Na
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4325
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
Cc: Xinhui.Pan@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, yangyingliang@huawei.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/22/2022 8:19 PM, Alex Deucher wrote:
> On Tue, Nov 22, 2022 at 6:12 AM Xiongfeng Wang
> <wangxiongfeng2@huawei.com> wrote:
>>
>> As comment of pci_get_class() says, it returns a pci_device with its
>> refcount increased and decreased the refcount for the input parameter
>> @from if it is not NULL.
>>
>> If we break the loop in radeon_atrm_get_bios() with 'pdev' not NULL, we
>> need to call pci_dev_put() to decrease the refcount. Add the missing
>> pci_dev_put() to avoid refcount leak.
> 
> For both patches, I think pci_dev_put() needs to go into the loops.
> There are 2 or more GPUs on the systems where this is relevant.
> 

As per the logic, the loop breaks when it finds a valid ATRM handle. So 
dev_put is required only for that device.

When inside the loop this happens -  "decreased the refcount for the 
input parameter @from if it is not NULL"

Thanks,
Lijo

> Alex
> 
>>
>> Fixes: d8ade3526b2a ("drm/radeon: handle non-VGA class pci devices with ATRM")
>> Fixes: c61e2775873f ("drm/radeon: split ATRM support out from the ATPX handler (v3)")
>> Signed-off-by: Xiongfeng Wang <wangxiongfeng2@huawei.com>
>> ---
>>   drivers/gpu/drm/radeon/radeon_bios.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/radeon/radeon_bios.c b/drivers/gpu/drm/radeon/radeon_bios.c
>> index 33121655d50b..2df6ce3e32cb 100644
>> --- a/drivers/gpu/drm/radeon/radeon_bios.c
>> +++ b/drivers/gpu/drm/radeon/radeon_bios.c
>> @@ -227,6 +227,7 @@ static bool radeon_atrm_get_bios(struct radeon_device *rdev)
>>
>>          if (!found)
>>                  return false;
>> +       pci_dev_put(pdev);
>>
>>          rdev->bios = kmalloc(size, GFP_KERNEL);
>>          if (!rdev->bios) {
>> --
>> 2.20.1
>>
