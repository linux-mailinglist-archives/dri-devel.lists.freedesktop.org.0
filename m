Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5AD4F61FB
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 16:43:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E90F10E22A;
	Wed,  6 Apr 2022 14:43:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2057.outbound.protection.outlook.com [40.107.220.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B50B10E1A2;
 Wed,  6 Apr 2022 14:43:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BSGJMO60M+Lf2VaP57q14fE9kFvazq/+scgjEkiMrOPtw1KXupFfjF3lJURacBkLkyrTqlE3UPubHn7TcnHS4r/zOY331MblcGOxb6CFAR3iDsnSh34+C+nIFXCFKpLQ+UYuNvMYl2ElSHJuP0PwUAwJqVS9htO4pp0QtmQ0iB7FGtOgPTYVrMnT8I0COSGNQZZu2wNKYV7cnILPKotgL1HmkiGYD0AWOSpiJvMf+QtV76EswisjzG4Gdgd9/xBLzOc7nUNLjSc2CHjCZxKmRef4jg7GJHI3puyIJ9gKukqMVq0OEZBEeMw9noURgTDcWQ0II0f5gYiMNpiXwWLjGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e0tG722rojWuzBmjzfN/8GxYdGBqBp6+3mapqtEfS9E=;
 b=D+m74p7pyw+V/k//MIHZV9qn0Ap7RnE/RLRA5OYHw30flhHP3B0NjVz2PKP1eMTmXXPA7Uhs2Ye+Tt6H+0/UB3iIv0szqaGrVFWbSBJ0e9Ia4he9hthbhfygvF7tyLqiHMjs83CQ/5XPmd5+PMzrDrK0rbC/X5/Z4rorydu6sMEiBSPvxhvxSILvdDmzaB3cjegkv99xq226tx+VDREJpWGYiNEF24iqBkKuaIkiLKHRBm2Vx2g8cOCqLZYXRujgz1OT3Sfsw01t8VOTEZrid5DEbqrceLAJeYgvrf21ZmsTBn8wRJw2uGME24gMF8nP9IZeJGmy3caijxpLRUsOKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e0tG722rojWuzBmjzfN/8GxYdGBqBp6+3mapqtEfS9E=;
 b=wrblmX0U68Mgm+v/swwjy5+rMJOpu83DVb6DMyTa+UjrJ/5bHIWzVQXYFymiLuQ8dNg3J1YqrHSiheFJeoHqm8H0WEz/WlcsQo35rqVUI3dPcKLn/PpbZRQNY215KEpuojifL+kUVvIT9G+JxdKaugp2CAFPNppmEzu81QpI59g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN8PR12MB2899.namprd12.prod.outlook.com (2603:10b6:408:6b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Wed, 6 Apr
 2022 14:43:25 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5144.021; Wed, 6 Apr 2022
 14:43:24 +0000
Message-ID: <f742b6b8-4056-543c-17a5-ae373ca71b45@amd.com>
Date: Wed, 6 Apr 2022 16:43:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/amdgpu: Senseless code and unnecessary memset
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, Grigory Vasilyev
 <h0tc0d3@gmail.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Melissa Wen <mwen@igalia.com>
References: <20220405173632.2663-1-h0tc0d3@gmail.com>
 <614a4844-fa5d-8b8e-0628-894394f31608@amd.com> <874k3670ez.fsf@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <874k3670ez.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR0301CA0021.eurprd03.prod.outlook.com
 (2603:10a6:206:14::34) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b64d9cd4-eb2a-41fc-294c-08da17dbcd81
X-MS-TrafficTypeDiagnostic: BN8PR12MB2899:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB28994460BE369E524CA2AC6883E79@BN8PR12MB2899.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NY/PPDxst2sIfjtAeVDsHQ0hYdgHyjPnBTloWEVu1wb2xFCxG4AKNDO27IljUVUh0secik4Eq/PG8/SZumPcT6RucvLIs17RbI4VS9P0AQ2cVTwR7Jf3iKRg4X3/qeOvSLyuLRtViwUGk6EJXaDtv5MPYA4p5Ot40W+HT9dZVZxu2S+GQefVKeIx7ynntoi3Wzp/rLhzEiiozbGIWpo4EfwFen/oKDWuwrOmEaohWKEiB/Hes+C50iZ/loBNosUXTR3JSSN6lC1uZ3SFEfcRFRPcIwenIjiX4q+twErh5xnoGte8w66RFnNZw5nDkVTKELhM6NdS9WK0SkJSA7ExiQRt5qHj2DyUGNEoH6RgV8/kIAVMFipSX9Z17qeiobE6disWdbymccw2caQJ/CpSx8JteYnJvx0XMaNxtKQE3Fl800ljs6NYnvl22U9JrA4hYfupUTOzCl12R3MA+Um9rqa1sHYATCIjp6AjkTZ6F/2k2lxW/j5zL08QMS4+2U9exi+1vn6CD3pwbsOZAqLJfbfnbJ8QkoWB+TD0HHMlodH3IC77n3iORTUvOhiivlPYoTooDRFTj3H9sJQhF3Hfs/PcT27kVXS7TGmMbo9+HuETdVOKmUZ+jT8ivjbEXk5cbobbHhLmvOW8Ir3hUAttb4IbFsY5r/KohQhrvzBTwVnoIZ0Inwe9EGVuGnx7usNltx9ecqAs4QqV2f06T1jClF9CZN5bTLyj/XW5lnSpP+w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66556008)(54906003)(110136005)(38100700002)(83380400001)(2906002)(8676002)(4326008)(2616005)(66476007)(66946007)(316002)(186003)(31686004)(6486002)(6506007)(31696002)(8936002)(36756003)(508600001)(6666004)(86362001)(5660300002)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXVaM2FKdmdib2IrTSt4a2VBcSt0ZDJjOHZiTDJuYWowazBnaXVwTmhPcmVU?=
 =?utf-8?B?NHhsSVJneVczcFhUdkFqaDF2RWlyLzYwMHhCSmk1cmNUQTY3NTM5ZXNSdUpI?=
 =?utf-8?B?MU1TTTNxQTIvTzRHZnpIQVk0NTMya05VOHJiQm8wR29FRG9jRDRIVVJlMWNs?=
 =?utf-8?B?eWFJYWZZalUvRzJWVnJVaGZjSnNRZDVPcm1UNXErRytQRmo0RmNPNlpDV1ZX?=
 =?utf-8?B?SmNXS25ZVVZzaDlvajR2ZDhxSlEwQ1hLUUpuV3RVZVJLa1pUUVUxU2xFaEI1?=
 =?utf-8?B?TXE3Y29iWlFkWEswQWJnUloxUHdiV010dXFUOEtiL0F1ZGtZbnQ4Q2dwTUdS?=
 =?utf-8?B?VksycmQxdDhFOHllZDA0WlZjMElwVndYeEVMMXNPU3ZEdUxJNHorVXNiQnJX?=
 =?utf-8?B?dmw0dFgzdDJoeG0xS2hJTFNMSUM5bE9qR1ZVdXA3NkhhUWR0OGtCdThQVklq?=
 =?utf-8?B?RXBDMjJhK1lPYzdxQm9kMk9PTy9sT1crN3FsWXRrU3luSzF4ek42L3B1K2pr?=
 =?utf-8?B?QVBEbkdaaGo2ZTBQSjU1VVkwdmowNUROK1FvUkNpZ2ZhcXJsRHJnTzFHMW5V?=
 =?utf-8?B?UEZ4Q0liMFhWWmVVdU9WbklqVzBUcTNiNWx6K2V6MEFEdEZ4MEFaQkU1WkEr?=
 =?utf-8?B?OVB0OTVqVmRqVXFzVFFjK0pXQWlob1dWVHY2NmhxSUE3d3c4S2I2VU5wMk0z?=
 =?utf-8?B?K2lxeTdQUWI0dldmdW1KS0U0cmtad2VqMDFKRWJUcmNFY3FoZWNRWHp1eUFx?=
 =?utf-8?B?b1UwRUxqWUFja3Uvb09vWTNsalA2OEJTZW5DNG9VSFB4WjdSc2RQTXBEdUpz?=
 =?utf-8?B?d3hlZVlSenV5WUVmZkg2Sjhkc3QwWnlDYXNpYkRsbUIzeUM0cGZwUkwzRlBo?=
 =?utf-8?B?cWlTY2J3d1NCRCtMWFQxOUt4eHo3cFVNblVmZ1pUSkpqNWFBMzlpUm04MU9h?=
 =?utf-8?B?NitjN0FHUmFJeURvazdPRHpyVVoxZ04rWWFKQ2Z1OTRlYk4va2pSMzJVVkpY?=
 =?utf-8?B?OTVDWmVKaG1ab0FmaFNsU3dYeTZ0blNMVE5SeWZhWXg0anB2NVh6VTNMeGNs?=
 =?utf-8?B?RTdzcmtDU29xR0w3aDJMOXFPNHVTUXVXLzdjZ2kvMW9RWlp2S09yS2lnY0Qy?=
 =?utf-8?B?c0tKMVZTZ3F5UXFicGw4ZloxbEdnMGZmck9mTnc1TlF2U29rSjdaMXordGZ2?=
 =?utf-8?B?dXM5dW5melZSVmhaeHJCTzBpek5HaWZMV2d1d3RaMXZoMmpnYSsva3BlNElT?=
 =?utf-8?B?WXAyNlpzTEp5WFVIUjB6Q2FNVDJCaHRCaGxvRjlvN0lyNGFnSHZWZTQvTkhK?=
 =?utf-8?B?VVYrakI5UVE1a2UyaEZVU3NJQUVjaW9nUmx5VjFTejB0TnZrTXVoVWZ5aW4w?=
 =?utf-8?B?OUUrSE5ZdTYvQmtRQnI4dzZvSllpS1prRUVsaDZzVkcrR1B4UkxLYXExVW9R?=
 =?utf-8?B?bTlWTkNFd3h6TTRHckNIbGdvSjM4Qzl6aC9MZ2x1ZTlFRnNtNE9yMUxIZktQ?=
 =?utf-8?B?bjFaU0FIRmxZQ2YrNmxyT0VCSTZHKzlZVzlaUGhacWdoY2tyY21tSHIvb292?=
 =?utf-8?B?MGp1MDlmcmNvUjRmeTNLSkIwSDhhK0RHWHBGYWp4UUk1UDZaOGREQm5Wenlr?=
 =?utf-8?B?eUFUMEtCWE1oM0ZMWWpqcEpTakZZRTFudWtodVl6TExOYzR3YzFxeitXUTg0?=
 =?utf-8?B?bkdQNnR5OFZzRG90dko2OUpadUNRWjBkSnI0bFg4Z1Jsc1VxNmp4dmRMWDQv?=
 =?utf-8?B?RlB3QjFRN1pKK3pmS2RTNGs0Zk0xOXErZU12eFdGYkpjdVJ3Q20wbmozQTdT?=
 =?utf-8?B?ZnI3Z1VrMXJlSjY2dGt4REF5UkFKNW9KN0pLUDhoYlFlaDVRODhBS21kY0Ry?=
 =?utf-8?B?dkVlSWU5NHZjODBaMjRqcThCcVUxbUhLT2hsU21yQi8vcWlIU1B3T0tZQ0Vt?=
 =?utf-8?B?NGJlSTNGOVVVaXlldW9zMmI4Tk40MUNQVlNhR3Rxd1ROTk5mODYzWTNMcHdT?=
 =?utf-8?B?a3pUTWpKQ1pBZkVHcUZDUGVPbFhiTytkNkNwc2dEWHYzQ2o4Y1FYTkhVTUpQ?=
 =?utf-8?B?c2tHbVBLQUJOWFcrNDYrVVJYejJ0MVpRT0F5VkwzZzNqSXNQNXZGZkc1RzMz?=
 =?utf-8?B?bjBNQk1QQ2RBbW1icDBvekY0aGJqaUtDanprODZhdC9QVXlhTXBEMkttWWdT?=
 =?utf-8?B?VkxFdHh4TmhiOWFCeW5sc2ZOVlNMUnRIa20wNGtrQzN1QldmVXN5VHRnYkg2?=
 =?utf-8?B?MURrNnhjUVM1R0JLWlB3QVYxWnhIZURMU1I3UzRLSEdWbEQyeG5FWU1VWktI?=
 =?utf-8?B?NjFxM0hCemtacDl6L3lDRGQ0dGZvTlZvT1YxdVhMVUJsaGE5WTJmUkFqSU1v?=
 =?utf-8?Q?mxhMGpsu7cDruUCQ4H9jec/5f9Ez5RktyXuxsrZPXeEMf?=
X-MS-Exchange-AntiSpam-MessageData-1: ICfeOWufZuN4Mw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b64d9cd4-eb2a-41fc-294c-08da17dbcd81
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 14:43:24.7854 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wdIZNZoeGt9ZRnm4kZAgfdKBJh7/7oKuQqwQ2pkIxpl7bIp3untvG6Tq4s9daiup
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2899
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
Cc: Jiawei Gu <Jiawei.Gu@amd.com>, David Airlie <airlied@linux.ie>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 06.04.22 um 16:26 schrieb Jani Nikula:
> On Tue, 05 Apr 2022, Christian König <christian.koenig@amd.com> wrote:
>> Am 05.04.22 um 19:36 schrieb Grigory Vasilyev:
>>> Using memset on local arrays before exiting the function is pointless.
>>> Compilator will remove this code. Also for local arrays is preferable to
>>> use {0} instead of memset. Mistakes are often made when working with
>>> memset.
>> Well actually memset is preferred when working with structures which are
>> given to the hardware parser because {0} won't initialize paddings.
> Not that I'd know anything that's going on here... but it sure seems
> strange to me to be passing unpacked structures where the padding might
> matter to a "hardware parser".

Well to me it is an absolute miracle why the heck compilers don't 
initialize paddings.

We had so many ups moments over the years and I really don't see why it 
should be more optimal to do this.

Anyway, the memset() is used intentionally here and I don't really want 
to change it. What we could do is removing the second superfluous memset 
and use sizeof() instead of hard coding the size.

Regards,
Christian.

>
> *shrug*
>
>
> BR,
> Jani.
>
>
>> So please don't use {0} in any of the atom bios code.
>>
>> Regards,
>> Christian.
>>
>>> Signed-off-by: Grigory Vasilyev <h0tc0d3@gmail.com>
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/atom.c | 8 +-------
>>>    1 file changed, 1 insertion(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/atom.c b/drivers/gpu/drm/amd/amdgpu/atom.c
>>> index be9d61bcb8ae..537e48fbbe6b 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/atom.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/atom.c
>>> @@ -1538,11 +1538,9 @@ struct atom_context *amdgpu_atom_parse(struct card_info *card, void *bios)
>>>    int amdgpu_atom_asic_init(struct atom_context *ctx)
>>>    {
>>>    	int hwi = CU16(ctx->data_table + ATOM_DATA_FWI_PTR);
>>> -	uint32_t ps[16];
>>> +	uint32_t ps[16] = {0};
>>>    	int ret;
>>>    
>>> -	memset(ps, 0, 64);
>>> -
>>>    	ps[0] = cpu_to_le32(CU32(hwi + ATOM_FWI_DEFSCLK_PTR));
>>>    	ps[1] = cpu_to_le32(CU32(hwi + ATOM_FWI_DEFMCLK_PTR));
>>>    	if (!ps[0] || !ps[1])
>>> @@ -1551,10 +1549,6 @@ int amdgpu_atom_asic_init(struct atom_context *ctx)
>>>    	if (!CU16(ctx->cmd_table + 4 + 2 * ATOM_CMD_INIT))
>>>    		return 1;
>>>    	ret = amdgpu_atom_execute_table(ctx, ATOM_CMD_INIT, ps);
>>> -	if (ret)
>>> -		return ret;
>>> -
>>> -	memset(ps, 0, 64);
>>>    
>>>    	return ret;
>>>    }

