Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1C55091E2
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 23:13:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB5010E482;
	Wed, 20 Apr 2022 21:13:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061.outbound.protection.outlook.com [40.107.92.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 728B310E482;
 Wed, 20 Apr 2022 21:13:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P0JXiXr5kKsBSKhGqEnAnYHQPUpfBa3O61A9QZQFIA5mZyQhnbCi2KcUk+Ew3GJZQ6wo4az0mf/QLAqwm3ptmbcoNvYabPQn1r/QGIJndcCg6fzIdsJSf7/WbdZ1Ew11eRQ78/vt6/oTPHlc9pigXIbGPnkkrRcBP235x84QqvstZ/oGS+Oa2bDJlZCO6dIA3XgeXV3Ie1bpbD7j1FSFaaRN+pgcZXnjRCjKz3HfCz3k1IqU19m5g61LHbgBCVkJolPdfcoE8W0X174PWBVpa29Z0rUORbD9TsYY320Dhd04FZmLzUNMtxj6MCCwc/kYqswqDVuDa4Ygi1HhDqDlxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L4rYOQJfKwMqO9X2IfnJs/vOZGl3dSgBhOwj/tCCAr8=;
 b=YB+WZl5mHF8v3BeIWWonIvlbqFwNXiKqg2yJX4juE3TAQLx2JMdZmVyBB8YoJb7A2cS8DLrGa/91dWdzrqRyKtDRPDAl0okWwgbRKyc98IMUiGnEjeOz6JqVgDIJjQl7YiOi653ZNhCt+pnz7Xg+S0muy0lBJg2eQkRsJazZABWqcCYg6c8brJ0MmE9EbUd+L4Bd54+s+6XpontX2lf+odk24G/KqS0bMAuIfVcZlVoIdJ1XEaYq/OQVMFJvmYAf0Gmw3JNKdBu7J8BJOvGpiH80nAO+xxh1hbAVd8ljhLlIP2Trc5v1avLMsYY0M/avkdFQ2VVfccafHiRAHj8FoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4rYOQJfKwMqO9X2IfnJs/vOZGl3dSgBhOwj/tCCAr8=;
 b=wEy2C+Pm0OD+mSGQ1N8ph16BtFAjE1szK6knM3tNYscLJn0f9e/MNA12Q0BvujW8KKdOOTUPq5oLMrjrr2/Oy5TzTqC0p3/PEjIPB7WlrYxnB0qcY0316LlBjtyNr5ZXWvBephOYvKndzjYRhD675fOp51LQn3ldbcTx9ojAut0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4526.namprd12.prod.outlook.com (2603:10b6:806:98::23)
 by MN2PR12MB3263.namprd12.prod.outlook.com (2603:10b6:208:ab::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Wed, 20 Apr
 2022 21:12:59 +0000
Received: from SA0PR12MB4526.namprd12.prod.outlook.com
 ([fe80::8515:3855:bed9:3f05]) by SA0PR12MB4526.namprd12.prod.outlook.com
 ([fe80::8515:3855:bed9:3f05%9]) with mapi id 15.20.5186.014; Wed, 20 Apr 2022
 21:12:59 +0000
Message-ID: <fefcb57e-cc28-d9c1-2fad-997ed3856a88@amd.com>
Date: Wed, 20 Apr 2022 16:12:55 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCHv4] drm/amdgpu: disable ASPM on Intel Alder Lake based
 systems
Content-Language: en-US
To: Paul Menzel <pmenzel@molgen.mpg.de>
References: <20220412215000.897344-1-richard.gong@amd.com>
 <d4ba3998-34aa-86d2-bde9-bc6ae9d8d08d@molgen.mpg.de>
 <CADnq5_MgvcGPWf2gYn_3qCr+Gq1P39tvv-W-o8NhivvMpMwUBA@mail.gmail.com>
 <91e916e3-d793-b814-6cbf-abee0667f5f8@molgen.mpg.de>
 <94fd858d-1792-9c05-b5c6-1b028427687d@amd.com>
 <efc1dfd1-2b54-aee5-1497-4b800a468141@molgen.mpg.de>
 <CADnq5_NGTbTjn87tAsTJAMOKZ9niS7Mb=JDmjUH4KJXfDH_p_g@mail.gmail.com>
 <295e7882-21a2-f50f-6bfa-b0bae1d0fa12@molgen.mpg.de>
 <67e98c3e-cfa3-ee51-4932-bbad8de5ffd8@amd.com>
 <462dce7d-73fc-ea8c-0a8a-5e8722ee1967@molgen.mpg.de>
From: "Gong, Richard" <richard.gong@amd.com>
In-Reply-To: <462dce7d-73fc-ea8c-0a8a-5e8722ee1967@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:208:91::16) To SA0PR12MB4526.namprd12.prod.outlook.com
 (2603:10b6:806:98::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e367d28b-558c-4c28-6cb9-08da23128c14
X-MS-TrafficTypeDiagnostic: MN2PR12MB3263:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB3263FE6672A8185468CD391595F59@MN2PR12MB3263.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AHPJax/X72QvyYlMxFDrObjAUutj4qp43KtxlDqZKAtG9e0KzOYhm5rpPmQRsxZkQqRmuV/U0n4nfRkW3FylY9rxtLpziBTOICkLSvMxb5zOudY4U3IYdWBNbT+JjXdmuK+VdezPkZ/LLKpNN+fW61YLYN/nJjUVNQ9vCWp0P+Gat+rJN0dUg+oiofKUfyYj2XOLwQJ8MCTA2aiz22VjwEHn8wGBuGgxCSkzlcpKYlaNzeqi7WbKJ1MA8qwfLbsTcWh31JLtdrkYNiD/PbfkLAe3aNz/jGcLoY7IpA+ez6GID8dYlwhfaqFBDv2yFRIgcGs0wkTiRUyx4VhKc4qIUDFsuNsncXy333wTuH+kJxGnv60XzN3xwk9zuW/nHq185v4Lx1UlTWY5yh9a2Fe2s3hZnqRMu2W/xZrhX7GVAWVM+W1JK5U0R1zfOA+hZ73K3PQlar0Wz6xGakkldCkEEMFZA+zJ6u4OEsPEHv2Vb6WwiZ6ewhTmhqyH4JcTTg7+9oIFuL8PwON0gdO5vZGc4n5zEb6n4ullvrer3AQxV5uGeYvzC7BFHTqyssiPypFEPe9H1/pTd9EnJF+QxnQ8fJO6DCslIU9oNFNhHXiKTAgptCzFijVwhJcBD6K9HZ9j18UbRyZ9+5ZeER5lPd51ylnU0xWSnVjrYOWnTqdSUIiexCiCgIBCp953ouY3O3BAfHzgc9fyuUWv48N2RPAfdKbHU6EnUlaDQCpGDkddW6bjl/OpTM9h9KGF79YyXY8d
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6666004)(6512007)(53546011)(966005)(26005)(45080400002)(6486002)(186003)(6506007)(31686004)(38100700002)(2616005)(6916009)(83380400001)(54906003)(316002)(4326008)(36756003)(508600001)(5660300002)(8936002)(86362001)(66946007)(66476007)(31696002)(66556008)(2906002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGE1Znp3cFgwUkJpaHNSN3QxbW1oUjlwT3hkWm9JdGpNbWxoVzdqSnZFcUlB?=
 =?utf-8?B?d0VLVHlpbDhGT1Z5dzJlYkNTMllUdUZweE5yMVBqQXBsQXpBZ2hnQ1hkRjd3?=
 =?utf-8?B?S0JQKzJleVArM3pDdVVSbno3UnZja2NYY1AxRWpzeEI1aUdwWE9NZUtPWDc3?=
 =?utf-8?B?TFVtOTdUK2NyVVdZQmcrckEzNXNmZE03RWZHS091MXlWV3RGMzVrTU5SVVJS?=
 =?utf-8?B?UDZzQTByOWl6MVFNL3ZQcVRsUklhRmt3SjFDK3JhSHBVejRock5NUmt2Sm14?=
 =?utf-8?B?cWlIcEFUVjUvMnFzMUl5MjRVNW9oS01YdDdHK1JuYWdkWEJlWTVOTGdZSzhQ?=
 =?utf-8?B?aG5OcWNkTldkblAwMWFHbDVaM0JOQUV2aXMyM3NQVHd5N2FsL3NKb2I3RzMz?=
 =?utf-8?B?QURrR2xDd1FUQkhvM2ZXM3hQWlRJbThDc2Q1RDdGaWhLTmJ6bFZveG5oUjhX?=
 =?utf-8?B?OGVNdUFVc1VwUmZsV05NbjZNRUFpTExnUXl6aWptdTRWSWR0WmxIZHZVWEtB?=
 =?utf-8?B?VjBhQUk5dnhYbnFCYXBQTnpLTmZaQ0hqWUtZNEJQU2RjVXVzY0xXaEtVNW4w?=
 =?utf-8?B?dVVyTHQ4V045NzZMdm9SWitYWXJiRWREZXI0VjFudmpHMzl0SG9WUUZlSVl2?=
 =?utf-8?B?THhqSWU4anI3c0xIVERzVkNXUHZ3cTVKdTNqTVhjRTVSS0NMMmtGNjg1UXpB?=
 =?utf-8?B?K0JwN3dzZndtYlErc0VJaHJ0U0czdmI2Wm9iRDM1NmVjUktXV29HZVo3QmFF?=
 =?utf-8?B?U0pla1cxSHlnUXlHVDA1ZVpnLzNScHJCZ2xYc3JvMDFvTzdsaVZxL3kwUm9M?=
 =?utf-8?B?ZnVmNWhoQWJXN0Ira2FJMkFWMXVENXpBSklVSlB2M3l3RHZkWG1DZWR0Vngr?=
 =?utf-8?B?WlVtSkxrcHNQd0RwMWdQZTU5aGlaL3lRVWoyQWdTWWpTUG9jci9BdTRYd0lo?=
 =?utf-8?B?eWZEUHhRZEJaYTVRNHdDRlN1MGNSbGd3a1pMQndxdm5BdVpGN3ZOMTM3YmVX?=
 =?utf-8?B?OGxmdGpFZ2lleTdPNklQeEwzbFpOYW80Q3ZCZ3FNNkdFVGFDR2M1RUNsMHk5?=
 =?utf-8?B?K0xVdTJvVG5HTlV6cTFOVmRBR1o4RmhQWnFGc1B2Ykw1VHBEbVROYUI5RUph?=
 =?utf-8?B?L2lHeWZZbEFEVHFBTEFWcHVDc1lzNUNROXAxM0EvY3dGejNoODR6bHpFNEFq?=
 =?utf-8?B?MGFJZXVPOTdlS3o5MnMzbHFoLzV2QWNNRjJLK2pqdVNaYmpsQzd1NkcxMkhE?=
 =?utf-8?B?dXI2UGRJdkJEZ0Frc09GeDFpdmxlS3hRVGs2L05JT2o0bWYvaUpGQjk1K0xG?=
 =?utf-8?B?RGo1b0xkd252MEU2TVV1L1NFbVZzUWFaMml4V09rZndhMG4zZ005RXd6S09r?=
 =?utf-8?B?N3h4elMzbGZad2tnUHA4aVhCOEp1Wi9NV1pEdGRZVWVGRC9tVStrbmdMUVYx?=
 =?utf-8?B?eCtLU3QwV2JnMTAyMG5xVFV6Z04yckNZUDNwZTJPY0NQWnZLbHFHbnR2aHNB?=
 =?utf-8?B?WXhVd3czL2VtUEVNd3hJRmVEekIrTEMxRUpPalJsdU5ZdU04MFdXSG11VmJH?=
 =?utf-8?B?Rm9xb0w1YzFjWWJqVmZZL1BNdkM1cEh4M2dpSUpDT0JKRE9nb0o0ajFpZVVP?=
 =?utf-8?B?ZFFRRGdZS1QvMS9zaENyN0gzL3ZmS0EvdXY2RDZBR2xLY2ZVLzVFRERuMGFR?=
 =?utf-8?B?cS95RURnNEsrWk56OWJYMlFkVDNPNkhkc2NyQlNFc0ZxYkc2Q2tXRDU4V3Vz?=
 =?utf-8?B?NlNnem44Z245Q0pnNGhoaHdwUVZkRWxidVUrUXZOa1ZUMTNKWmo3TVh4SmUr?=
 =?utf-8?B?NUErWkZZQ2Y3ZVdTZXlUMVVBTGExR0picHJ0YTZQY3pMYlZtN1RjYmxUcUZ2?=
 =?utf-8?B?YnZIOXZ2YjB3d2Jmd0RaRTBXbEdVekRCVFN2ellsdkxhelgzU2dsNlRLNkVK?=
 =?utf-8?B?MDgwTkxDWnpmTEFPYW4xREtVL0dib0xCNzY3RmhUZTlrVWxRWDZMMkxXSUhX?=
 =?utf-8?B?Nm5OaUpQQTZkK01meWxVU1JRcWNOYTVaeU9DaHc0SWV6MXFtOTlJTDMrOVAw?=
 =?utf-8?B?bkRNWjdEUTZHUUtzMjZTU0lEcXhpZldzaE9ENXpDOGhTTEFtMGZ5VThWKzhk?=
 =?utf-8?B?aGZsMURqdWtNcldEbU81UkxMRE9sK2VkcCt0MW45T3pieUtHSWNNa1BTNW0w?=
 =?utf-8?B?dHdEY1RGS1NtSnNQdm5ENWg4ZlI4RzRZa3BvL1dxMjFkVkkzdTh4d1ViaGZD?=
 =?utf-8?B?L1FaMGhob0M0WmQ3MHJ5V1BwUXVBY3FyQXVwaTZFUDB2RHI0eHg2eFVUZmNM?=
 =?utf-8?B?NnZjNklsNWhOME9JRFVMZGRjejduUEhRUkQ2Si9ENUZWc1daMTlSQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e367d28b-558c-4c28-6cb9-08da23128c14
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 21:12:59.4284 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eDaLvaF3FXazRWd3LHyje/eKgR3Goe2Wfa2B6ovmYoveAZFUIBEK+YGxmLC6Wbb/8KSCUxJmfwdRg70f79DszA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3263
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
Cc: Dave Airlie <airlied@linux.ie>, Xinhui Pan <xinhui.pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>, amd-gfx@lists.freedesktop.org,
 Alexander Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/20/2022 4:02 PM, Paul Menzel wrote:
> Dear Richard,
>
>
> Am 20.04.22 um 22:56 schrieb Gong, Richard:
>
>> On 4/20/2022 3:48 PM, Paul Menzel wrote:
>
>>> Am 20.04.22 um 22:40 schrieb Alex Deucher:
>>>> On Wed, Apr 20, 2022 at 4:29 PM Paul Menzel <pmenzel@molgen.mpg.de> 
>>>> wrote:
>>>
>>>>> Am 19.04.22 um 23:46 schrieb Gong, Richard:
>>>>>
>>>>>> On 4/14/2022 2:52 AM, Paul Menzel wrote:
>>>>>>> [Cc: -kernel test robot <lkp@intel.com>]
>>>>>
>>>>> […]
>>>>>
>>>>>>> Am 13.04.22 um 15:00 schrieb Alex Deucher:
>>>>>>>> On Wed, Apr 13, 2022 at 3:43 AM Paul Menzel wrote:
>>>>>>>
>>>>>>>>> Thank you for sending out v4.
>>>>>>>>>
>>>>>>>>> Am 12.04.22 um 23:50 schrieb Richard Gong:
>>>>>>>>>> Active State Power Management (ASPM) feature is enabled since
>>>>>>>>>> kernel 5.14.
>>>>>>>>>> There are some AMD GFX cards (such as WX3200 and RX640) that 
>>>>>>>>>> won't
>>>>>>>>>> work
>>>>>>>>>> with ASPM-enabled Intel Alder Lake based systems. Using these 
>>>>>>>>>> GFX
>>>>>>>>>> cards as
>>>>>>>>>> video/display output, Intel Alder Lake based systems will 
>>>>>>>>>> hang during
>>>>>>>>>> suspend/resume.
>>>>>
>>>>> [Your email program wraps lines in cited text for some reason, making
>>>>> the citation harder to read.]
>>>>>
>>>>>>>>>
>>>>>>>>> I am still not clear, what “hang during suspend/resume” means. 
>>>>>>>>> I guess
>>>>>>>>> suspending works fine? During resume (S3 or S0ix?), where does 
>>>>>>>>> it hang?
>>>>>>>>> The system is functional, but there are only display problems?
>>>>>> System freeze after suspend/resume.
>>>>>
>>>>> But you see certain messages still? At what point does it freeze
>>>>> exactly? In the bug report you posted Linux messages.
>>>>>
>>>>>>>>>> The issue was initially reported on one system (Dell 
>>>>>>>>>> Precision 3660
>>>>>>>>>> with
>>>>>>>>>> BIOS version 0.14.81), but was later confirmed to affect at 
>>>>>>>>>> least 4
>>>>>>>>>> Alder
>>>>>>>>>> Lake based systems.
>>>>>>>>>>
>>>>>>>>>> Add extra check to disable ASPM on Intel Alder Lake based 
>>>>>>>>>> systems.
>>>>>>>>>>
>>>>>>>>>> Fixes: 0064b0ce85bb ("drm/amd/pm: enable ASPM by default")
>>>>>>>>>> Link:
>>>>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Famd%2F-%2Fissues%2F1885&amp;data=05%7C01%7Crichard.gong%40amd.com%7C509e0378edcf477605a708da231114f0%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637860853537880384%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=SoXDKGHUiiQN4rcL7FpCotouWFt0kkAbcHyO3esfNlE%3D&amp;reserved=0 
>>>>>>>>>>
>>>>>
>>>>> Thank you Microsoft Outlook for keeping us safe. :(
>>>>>
>>>>>>>>>>
>>>>>>>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>>>>>>>
>>>>>>>>> This tag is a little confusing. Maybe clarify that it was for 
>>>>>>>>> an issue
>>>>>>>>> in a previous patch iteration?
>>>>>>
>>>>>> I did describe in change-list version 3 below, which corrected 
>>>>>> the build
>>>>>> error with W=1 option.
>>>>>>
>>>>>> It is not good idea to add the description for that to the commit
>>>>>> message, this is why I add descriptions on change-list version 3.
>>>>>
>>>>> Do as you wish, but the current style is confusing, and readers of 
>>>>> the
>>>>> commit are going to think, the kernel test robot reported the problem
>>>>> with AMD VI ASICs and Intel Alder Lake systems.
>>>>>
>>>>>>>>>
>>>>>>>>>> Signed-off-by: Richard Gong <richard.gong@amd.com>
>>>>>>>>>> ---
>>>>>>>>>> v4: s/CONFIG_X86_64/CONFIG_X86
>>>>>>>>>>        enhanced check logic
>>>>>>>>>> v3: s/intel_core_asom_chk/aspm_support_quirk_check
>>>>>>>>>>        correct build error with W=1 option
>>>>>>>>>> v2: correct commit description
>>>>>>>>>>        move the check from chip family to problematic platform
>>>>>>>>>> ---
>>>>>>>>>>     drivers/gpu/drm/amd/amdgpu/vi.c | 17 ++++++++++++++++-
>>>>>>>>>>     1 file changed, 16 insertions(+), 1 deletion(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c
>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/vi.c
>>>>>>>>>> index 039b90cdc3bc..b33e0a9bee65 100644
>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/vi.c
>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/vi.c
>>>>>>>>>> @@ -81,6 +81,10 @@
>>>>>>>>>>     #include "mxgpu_vi.h"
>>>>>>>>>>     #include "amdgpu_dm.h"
>>>>>>>>>>
>>>>>>>>>> +#if IS_ENABLED(CONFIG_X86)
>>>>>>>>>> +#include <asm/intel-family.h>
>>>>>>>>>> +#endif
>>>>>>>>>> +
>>>>>>>>>>     #define ixPCIE_LC_L1_PM_SUBSTATE 0x100100C6
>>>>>>>>>>     #define 
>>>>>>>>>> PCIE_LC_L1_PM_SUBSTATE__LC_L1_SUBSTATES_OVERRIDE_EN_MASK
>>>>>>>>>> 0x00000001L
>>>>>>>>>>     #define PCIE_LC_L1_PM_SUBSTATE__LC_PCI_PM_L1_2_OVERRIDE_MASK
>>>>>>>>>> 0x00000002L
>>>>>>>>>> @@ -1134,13 +1138,24 @@ static void vi_enable_aspm(struct
>>>>>>>>>> amdgpu_device *adev)
>>>>>>>>>>                 WREG32_PCIE(ixPCIE_LC_CNTL, data);
>>>>>>>>>>     }
>>>>>>>>>>
>>>>>>>>>> +static bool aspm_support_quirk_check(void)
>>>>>>>>>> +{
>>>>>>>>>> +     if (IS_ENABLED(CONFIG_X86)) {
>>>>>>>>>> +             struct cpuinfo_x86 *c = &cpu_data(0);
>>>>>>>>>> +
>>>>>>>>>> +             return !(c->x86 == 6 && c->x86_model ==
>>>>>>>>>> INTEL_FAM6_ALDERLAKE);
>>>>>>>>>> +     }
>>>>>>>>>> +
>>>>>>>>>> +     return true;
>>>>>>>>>> +}
>>>>>>>>>> +
>>>>>>>>>>     static void vi_program_aspm(struct amdgpu_device *adev)
>>>>>>>>>>     {
>>>>>>>>>>         u32 data, data1, orig;
>>>>>>>>>>         bool bL1SS = false;
>>>>>>>>>>         bool bClkReqSupport = true;
>>>>>>>>>>
>>>>>>>>>> -     if (!amdgpu_device_should_use_aspm(adev))
>>>>>>>>>> +     if (!amdgpu_device_should_use_aspm(adev) ||
>>>>>>>>>> !aspm_support_quirk_check())
>>>>>>>>>>                 return;
>>>>>>>>>
>>>>>>>>> Can users still forcefully enable ASPM with the parameter
>>>>>>>>> `amdgpu.aspm`?
>>>>>>>>>
>>>>>> As Mario mentioned in a separate reply, we can't forcefully 
>>>>>> enable ASPM
>>>>>> with the parameter 'amdgpu.aspm'.
>>>>>
>>>>> That would be a regression on systems where ASPM used to work. Hmm. I
>>>>> guess, you could say, there are no such systems.
>>>>>
>>>>>>>>>>
>>>>>>>>>>         if (adev->flags & AMD_IS_APU ||
>>>>>>>>>
>>>>>>>>> If I remember correctly, there were also newer cards, where 
>>>>>>>>> ASPM worked
>>>>>>>>> with Intel Alder Lake, right? Can only the problematic 
>>>>>>>>> generations for
>>>>>>>>> WX3200 and RX640 be excluded from ASPM?
>>>>>>>>
>>>>>>>> This patch only disables it for the generatioaon that was 
>>>>>>>> problematic.
>>>>>>>
>>>>>>> Could that please be made clear in the commit message summary, and
>>>>>>> message?
>>>>>>
>>>>>> Are you ok with the commit messages below?
>>>>>
>>>>> Please change the commit message summary. Maybe:
>>>>>
>>>>> drm/amdgpu: VI: Disable ASPM on Intel Alder Lake based systems
>>>>>
>>>>>> Active State Power Management (ASPM) feature is enabled since 
>>>>>> kernel 5.14.
>>>>>>
>>>>>> There are some AMD GFX cards (such as WX3200 and RX640) that 
>>>>>> won't work
>>>>>> with ASPM-enabled Intel Alder Lake based systems. Using these GFX 
>>>>>> cards as
>>>>>> video/display output, Intel Alder Lake based systems will freeze 
>>>>>> after
>>>>>> suspend/resume.
>>>>>
>>>>> Something like:
>>>>>
>>>>> On Intel Alder Lake based systems using ASPM with AMD GFX Volcanic
>>>>> Islands (VI) cards, like WX3200 and RX640, graphics don’t initialize
>>>>> when resuming from S0ix(?).
>>>>>
>>>>>
>>>>>> The issue was initially reported on one system (Dell Precision 
>>>>>> 3660 with
>>>>>> BIOS version 0.14.81), but was later confirmed to affect at least 
>>>>>> 4 Alder
>>>>>> Lake based systems.
>>>>>
>>>>> Which ones?
>>>>>
>>>>>> Add extra check to disable ASPM on Intel Alder Lake based systems 
>>>>>> with
>>>>>> problematic generation GFX cards.
>>>>>
>>>>> … with the problematic Volcanic Islands GFX cards.
>>>>>
>>>>>>>
>>>>>>> Loosely related, is there a public (or internal issue) to 
>>>>>>> analyze how
>>>>>>> to get ASPM working for VI generation devices with Intel Alder 
>>>>>>> Lake?
>>>>>>
>>>>>> As Alex mentioned, we need support from Intel. We don't have any 
>>>>>> update
>>>>>> on that.
>>>>>
>>>>> It’d be great to get that fixed properly.
>>>>>
>>>>> Last thing, please don’t hate me, does Linux log, that ASPM is 
>>>>> disabled?
>>>>
>>>> I'm not sure what gets logged at the platform level with respect to
>>>> ASPM, but whether or not the driver enables ASPM is tied to whether
>>>> ASPM is allowed at the platform level or not so if the platform
>>>> indicates that ASPM is not supported, the driver won't enable it.  The
>>>> driver does not log whether ASPM is enabled or not if that is what you
>>>> are asking.  As to whether or not it should, it comes down to how much
>>>> stuff is worth indiciating in the log.  The driver is already pretty
>>>> chatty by driver standards.
>>>
>>> I specifically mean, Linux should log the quirks it applies. (As a 
>>> normal user, I’d also expect ASPM to work nowadays, so a message, 
>>> that it’s disabled would help a lot.)
>>
>> In general rule we shouldn't generate additional log unless something 
>> went wrong with the system.
>
> Please run `dmesg` and see that your statement is false. That’s what 
> log levels are for, and in your case, it would be at least error 
> level. Also, I claim, something indeed went wrong, because a quirk had 
> to be applied. So please add a notice log level, that ASPM gets disabled:

 From my previous experience with upstream, the maintainers simply don't 
like adding logs unless absolutely need.

I can add a pr_warn or dev_warn, but I can't guarantee that maintainers 
will take that in my case.

>
> Disable ASPM on Alder Lake with Volcanic Islands card due to resume 
> problems. System energy consumption might be higher than expected.
>
>
> Kind regards,
>
> Paul
