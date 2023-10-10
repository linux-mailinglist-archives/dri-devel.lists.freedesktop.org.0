Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9C17BFDCF
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 15:39:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD41010E375;
	Tue, 10 Oct 2023 13:39:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A67F010E378;
 Tue, 10 Oct 2023 13:38:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gYQ9NuMZQ36I1IUNu2+QwtjXuwKPj7il2wJyVlz7i0Jc8DHR6UW3RRQDqIw6bfxWLEQppuXAgc6VRT8+mTLV4Sn7VsTiXNegq/xzKbO/DN/s6GJJ784pnGbRZlAWEkUccITRPdn+A1QJ7lZHRHY0KKdfQwThJv6cVdC5OXoZQFdvLQx9l3wRU1MrCJvHO0zl+eQd+V1e0r9wO5QXIfCtJoT5Y7IUc5AN3b7zXPvQWJg0h9ynGHels2V054akzQYIcLqT7eJcdwp2YgB2oTZh3JUM9zBl+cGyNe1/7gorLy7Evkdh3EQvHczBOuc7ShUXYY9EaE0rmUzQ7fGJWPuU7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PIwmqFBhg3wSTu6llPJQMo9Ki5096wWhpwBYM299x7A=;
 b=bVNWV/uVFgobKTAZXOPkQHVflALcUtKxOdPjgAN7T6twRDptQdesP/U+aygGEOl36Z96GCMwLcFs1KqFsRmFbMC16ile+O7NTVphhM/8LEDNQF7n1+r7z1z0GrSHouj7BY60sq9AtSE7W1xfVx1OJ/uu4B/PQWvS2yfedZR3boNGNMEJN0/kuMuB+ug2duapZRkHIL1GgYyGfSWC48Nrp3T5Xi/uIypwrA97zaSkKtrMI83BebAgqsBOMuM7gL11aPzp4sMxk+ELBtFIkUlULpEi7t8M81Ll9x3+nL0zuZUQiTUdVcsgSnTB5Kjr9Z54V4oEaxCapDEVUFA5VX7x7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PIwmqFBhg3wSTu6llPJQMo9Ki5096wWhpwBYM299x7A=;
 b=GuYl4mb+ami5sPn0yL8V3/DbNHfwCFE/dlWHoI5OarixsIyOAe/ORC5t06SMMTZyAMvtdM7hLxFTWJrt5I9o/EFMP7qObkXexi7LuFLYH1ZG/3uanKFsVSZ0zoLS2UDRNz1J0mkR3Q5hm8ekWr3p2O4YlV0dvUE9jk1m11iFhY8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by PH0PR12MB5500.namprd12.prod.outlook.com (2603:10b6:510:ef::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 13:38:55 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5%4]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 13:38:54 +0000
Message-ID: <c9d53b05-68d0-4244-86cb-cb110c2c4af7@amd.com>
Date: Tue, 10 Oct 2023 19:08:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/16] platform/x86/amd/pmf: dump policy binary data
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20231010125917.138225-1-Shyam-sundar.S-k@amd.com>
 <20231010125917.138225-12-Shyam-sundar.S-k@amd.com>
 <1f3e39fc-2c2f-72d5-ce61-16e7e5d257be@linux.intel.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <1f3e39fc-2c2f-72d5-ce61-16e7e5d257be@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::10) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|PH0PR12MB5500:EE_
X-MS-Office365-Filtering-Correlation-Id: 48260d52-6f5c-4d57-8fd9-08dbc9963f26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rkdSkZLNC026rnHDodQVaA2NTh3nEtgdP107/8jG5uvUy4v3Ml/c428ItOtljVNpkNxOKQXPCdaqqO+ulTMOXCoqHfIgrXMznCUUWtxXo9E6j9GF3Ma/J4ERBfmhF3GVZFGUzDJTCRmF+a63VK73NaYKfHbbsNO7lGuUR2U1s/+W+rmumBDuaLExa4mcJGIiENCUySttWPMU18eIikulUc1aI6y4ZlOFh3nXB1hnPsVXQzQFiOLxNsiUtvCZG9LI1A5scQVS2MWGe2jFBecCbHHfy0jle+wHjz5mMO0mR0DpLbry9JMKlsbwdIOppucGvvqaJ1JlW4E1960U+OwOtsAaQwY2t4303IDEel7zeDlTErW9Xmu8gJMd+rB0SlybRt0lsyPcori2GkhysSekR1hRWKPo/E6b4oF+tv48OoFPUogptgtKRxlDwgvRLV1BdV87t53Mr8u9DgYn7iRaLiTYuWajRp4hXtThsTwR8QxxZ0ZtfmHlmAXOCK2Y07R7SXdUY8VwdDfuQ8RJKLkriF/HPgANqwV/FmRHty6TP6oZ1LqfDVoXxNGWDghrG9jotGTlCHZBeH1ziAMoTNFiYPp2b9KdeXqwSTGgRent8/54O1lnoWh6J3dCvdTGepOjCqERbPbaMckyQpv9zUR5XA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(39860400002)(366004)(396003)(136003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(6506007)(41300700001)(26005)(8936002)(38100700002)(8676002)(4326008)(66476007)(66946007)(66556008)(6512007)(6916009)(5660300002)(6486002)(7416002)(478600001)(53546011)(2616005)(2906002)(316002)(6666004)(36756003)(31696002)(86362001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ei8vRi9IbDFHa0c0NnZjQXZqRjhTRy9CUXd5L01ZSGVzNWdJa1pZS2dsNk9l?=
 =?utf-8?B?L3pUc2czSXZyckFIeFFtdFJTRWd1YU5HYlVaRUprbDBEeGNSUkJTRmxVQlZo?=
 =?utf-8?B?RXdiS1pkS29WRmZjNGFpWXc3eGlFRE9keHRpbjZCQ0V0WjRqZGt2ajM1U2cz?=
 =?utf-8?B?WjA5cFQzZzhCVCt6MHVnc2kwR3NkdFRnNlBhRlN0TmhGT1VNK0ZsMXk4QjNU?=
 =?utf-8?B?d3ZWenU0UU1EdWVIZDkzWmVNdEs5d0FEZG84QlhUSUNvakJsSmRuaXo0UDE1?=
 =?utf-8?B?bVJUVmpDbHU5MEV5aGFrTUp2Y0xJMVFRUXpMRWlsdkorUzM4RmRvdHpmemgy?=
 =?utf-8?B?SU5LTHNHQndZTnVmTWtTdVdRejQzb1FUSnoydmRWV2Q0THBhQkl3WGhNaWlY?=
 =?utf-8?B?NmZKUUZYQ3FHa2d1UjFhU1ZmRmhJWFVQejNZcC9JN085czhLWnVGZEhlSGRm?=
 =?utf-8?B?WHhTczNjVkhMNkV1bkoyRkI3aTl2a1FZWjV2Q3J1cHhLMzBKb2xvZEc3eVF5?=
 =?utf-8?B?MGhJaXUzMGRnUWhTZXBBandyZ2grMm92ZUk3N21VWmw1TFVra1dkQldtaWUz?=
 =?utf-8?B?SzJzbVVsWTJzc2pyOHhNUkpCVHg5Rkh6K2w2R0lpK3o1OWEvZGE2K0I1YUJW?=
 =?utf-8?B?UHpHTWs4ckVYUEV2eDd6WkVUZVJUa0pWRzViVjh3Sm9GU283RDBCZTZFbU1N?=
 =?utf-8?B?TTFGZWR5MzFudGhmRmV0NE5HQThRb0lYT0hpT0F4THdaOTlqaEYwTDF0Rk9q?=
 =?utf-8?B?bWU4WFlVdWJnT0RnRkZ6b2Y0cnBVTTB1V3dzUmJ0aGdiVE1lMlpMbDloQWQ0?=
 =?utf-8?B?RmwwM1hwd01WZGYrYzdzckNtckZzL21OZ00zK0lOUmVxMm1KRGpSYU1xT2Uv?=
 =?utf-8?B?eHN2UFFUdnp2WHJMSzJ3TWZuYnE5djhBZWNFR2ZBQ1haektxT1dJMmRMSVR3?=
 =?utf-8?B?ZkhUcnFMaUhlaGtnN2QzTzgyYVMwamVlcDNOWndBZUlscExVMml1WkdNTUpJ?=
 =?utf-8?B?ckZKQzI2aGVFV1AwTk1wMHBBenEyczJTaHVKaG9iQWZaNmV3KzN5NUlNUnBp?=
 =?utf-8?B?K2w0OWlTN1h4aStwVmRhTXpjWFMweW95NjE0R3VPNHlnOERFSTY4Mkd1ZzBI?=
 =?utf-8?B?d0VwL2gzN0pZZENtK1lXRDBxNTR0SG9uVGNBWDF0WWc0MlYzTGRieWNQYUFC?=
 =?utf-8?B?aWsxUW82ck5lOEN5UVNUUjl3aTdLN1hXaVFIOU9tUUFsYjZLdkZhc09iNER0?=
 =?utf-8?B?Z0FoeFVDR3M3Q2xmYXUvajVjeWtOOUpVSzV2UkxzQUIyUGw4NVR2eitqeGd4?=
 =?utf-8?B?VEY0WkFjd1hRV1N4cWtTTXRiRUYvOU1ZOGF6S0MydURCOERLWEt0WmZWalZE?=
 =?utf-8?B?dVBlZVUxRnhuTjE1UGgxRndzdGM4Z1E0cGs4QUhad0JZenFLTGVYYytFaEhD?=
 =?utf-8?B?VzRLbzNYZmovSlpCM2J6NkpRSUlmL3lsM2gwR3phQXJSNDVwNjE5QWVIaGl5?=
 =?utf-8?B?UHdwM2tHaFpYbHgzWSs3QmpoTHpmWGZrdmhOdTRXZE00ZFBONStCRnVxSmFJ?=
 =?utf-8?B?ajd3UHhDKzgrSEZucDFHK0tIRHA2TEtJbndsMEQwVy8zWldRSElZYmkvZXZB?=
 =?utf-8?B?UUJkaHE3TGQvKzFFU2htRnViQmlRUmxreU9xMHB3b0o2MkxUSWZnVXlmVUlj?=
 =?utf-8?B?a2NlVllDQVJrSmMxTjdyb1pJTDVKZGlleW42NEVGVTVhSWdFT1ZXN21wUGVG?=
 =?utf-8?B?MWNYVzRGMHUrZGdvUnk4cDl2UUd1ODlFR3NqaVBRWFVubW51a0ExYlNCVWdr?=
 =?utf-8?B?Mk9CRFcwbU9PNlRlVVFUT2pwYkhadmMreU54S0FaWVRaazVXNWNldzBZbTg5?=
 =?utf-8?B?WCtmSmppMzd5Ti9nbFFGNFQxV3BFTmxnQVVKLzNmU2YzK2ZPVjJKbldhdE1L?=
 =?utf-8?B?NlNPbmU3a2tlQzB1RHhNQ2JrV2Nra3l2blQyTzR0WloxM3BFbXBJZ0N3bTdo?=
 =?utf-8?B?OHpFMUNDanRpbDVSSG0xbEVQMy9wWGtZZFhsY3dlWWhwS2JWU1FiM1RCNFc0?=
 =?utf-8?B?Nk9EQUxLVlFhVjZuaXYwNjB1bzJQMEhISk5JM2RjUldCREgwUGdGUWNJN1RJ?=
 =?utf-8?Q?wU5bAf4rclg/xryTeXYPSCXbW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48260d52-6f5c-4d57-8fd9-08dbc9963f26
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 13:38:54.7936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fopC++jab0vJ8VyOni01gg1VQkzfDM0ueYae69tvJqkiUpijFaSZrNTQFzoA30OdI8VCSWqdUerGnxJPA7OM0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5500
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
Cc: Xinhui.Pan@amd.com, Patil.Reddy@amd.com, basavaraj.natikar@amd.com,
 dri-devel@lists.freedesktop.org, jikos@kernel.org,
 amd-gfx@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 markgross@kernel.org, Hans de Goede <hdegoede@redhat.com>,
 benjamin.tissoires@redhat.com, mario.limonciello@amd.com,
 linux-input@vger.kernel.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/10/2023 6:38 PM, Ilpo Järvinen wrote:
> On Tue, 10 Oct 2023, Shyam Sundar S K wrote:
> 
>> Sometimes policy binary retrieved from the BIOS maybe incorrect that can
>> end up in failing to enable the Smart PC solution feature.
>>
>> Use print_hex_dump_debug() to dump the policy binary in hex, so that we
>> debug the issues related to the binary even before sending that to TA.
>>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/platform/x86/amd/pmf/tee-if.c | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
>> index 994daf945795..e4386f503ad0 100644
>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>> @@ -275,6 +275,12 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
>>  }
>>  
>>  #ifdef CONFIG_AMD_PMF_DEBUG
>> +static void amd_pmf_hex_dump_pb(struct amd_pmf_dev *dev)
>> +{
>> +	print_hex_dump_debug("(pb):  ", DUMP_PREFIX_OFFSET, 16, 1, dev->policy_buf,
>> +			     dev->policy_sz, false);
>> +}
>> +
> 
> You forgot to add the empty version of amd_pmf_hex_dump_pb function into 
> #else part (so the compile fails if CONFIG_AMD_PMF_DEBUG is not set).
> 

It's there (see below). I have just grouped the functions that come
under #ifdef CONFIG_AMD_PMF_DEBUG and #else so that's more readable.

>>  static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
>>  				   size_t length, loff_t *pos)
>>  {
>> @@ -289,6 +295,7 @@ static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
>>  	if (copy_from_user(dev->policy_buf, buf, dev->policy_sz))
>>  		return -EFAULT;
>>  
>> +	amd_pmf_hex_dump_pb(dev);
>>  	ret = amd_pmf_start_policy_engine(dev);
>>  	if (ret)
>>  		return -EINVAL;
>> @@ -327,6 +334,7 @@ static int amd_pmf_open_pb(struct amd_pmf_dev *dev, struct dentry *debugfs_root)
>>  }
>>  
>>  static void amd_pmf_remove_pb(struct amd_pmf_dev *dev) {}
>> +static void amd_pmf_hex_dump_pb(struct amd_pmf_dev *dev) {}

Here is the empty amd_pmf_hex_dump_pb().

Thanks,
Shyam

>>  #endif
>>  
>>  static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
>> @@ -341,6 +349,7 @@ static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
>>  
>>  	memcpy(dev->policy_buf, dev->policy_base, dev->policy_sz);
>>  
>> +	amd_pmf_hex_dump_pb(dev);
>>  	if (pb_side_load)
>>  		amd_pmf_open_pb(dev, dev->dbgfs_dir);
>>  
>>
> 
