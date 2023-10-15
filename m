Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DF57C975A
	for <lists+dri-devel@lfdr.de>; Sun, 15 Oct 2023 02:09:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B392710E0C0;
	Sun, 15 Oct 2023 00:09:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2081.outbound.protection.outlook.com [40.107.237.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71A1710E07B;
 Sun, 15 Oct 2023 00:09:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ta23EcaCMcF1AvD0blypWFnZltDIIg2D9oEAIa+j3ecLSCDSTcbtRw4DPE3FG5CJY8VKRBC8bdydSjrVFBa8pBqJR5qY3Vj6qqb7Exew5iAHZJKBCErvj01rwd21F/8pUw3ERJuv9tPHY4rTq7n3VI4x/y3/9ZsyOFoehclA8MkbUq3zMMdJxwWLsjk4KKq3fjfq5W2nZ4WxIQj6+J9KGCxqwwPZGN2iuO1fy0wPyrBFleE8FOB/dOtdsAFC+us+PIDIoo3+qfAnGdppcUUcYCXZ8O860pSaQPWLYEsMFwwj+XQ45626UhrPWLqO4Yj/69wnd7edckdZpisn8fK0pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=014sDnm1UPr5BkiUgg3mdtnTyY8HeRX8AYI5SiMwVps=;
 b=mosVagK5GWUy1ioflkNgXmoUmMzD+LLV7eAX1aTsTd1sEXhmwwOYQX/nW/SjTRkgwfWUu+PekBd8MecNUyeTyfcgbeVyagWGo385PxNaD2lQsDIyQxbFI0M9iGrRRy3OBfRuojsP7fZCjMmSgavHUFhWQoMtIdgDfEGLxggwc1rdpiQvHAvhjFP6mtDFFcTc3hi7rQx+DICdUzFAL/8nqA8c/jFCfYj4mWRlXOQU16Uo9zWYClXpURDtRkrN6+mSDRWQdafphimHXGUCSUMZenfHeip94e7w6bBdCODDdhHX0fSNdUlS1dxIBHtbpUhvmQMAm3S0AgXnGyQQ954dOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=014sDnm1UPr5BkiUgg3mdtnTyY8HeRX8AYI5SiMwVps=;
 b=t9CGaB5+G6FKe9fvfPcsyOPo8Js7OWH6sBudCyESy78K8alNgCXBn8HhWejSJI2/gAmzuxVxm4mzoyp27sktdrAg3lzvNoHw1kl5j9tu35bo7BwRIBchsAa7FRaOYCNiNXVWvHaQ3adAxSjpT7yJGCzzOlujlwsAPaLmlHLpKvQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 SN7PR12MB8002.namprd12.prod.outlook.com (2603:10b6:806:34b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Sun, 15 Oct
 2023 00:09:36 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef%5]) with mapi id 15.20.6863.047; Sun, 15 Oct 2023
 00:09:35 +0000
Message-ID: <c91d3a47-df4a-4be8-8f27-c850289df281@amd.com>
Date: Sat, 14 Oct 2023 20:09:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.2
Subject: Re: [PATCH v5 5/7] drm/sched: Split free_job into own work item
Content-Language: en-CA, en-US
From: Luben Tuikov <luben.tuikov@amd.com>
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20231011235826.585624-1-matthew.brost@intel.com>
 <20231011235826.585624-6-matthew.brost@intel.com>
 <23cceeb8-5d86-4923-a072-b9e72b74d36b@amd.com>
Autocrypt: addr=luben.tuikov@amd.com; keydata=
 xjMEY1i6jxYJKwYBBAHaRw8BAQdAhfD+Cc+P5t/fiF08Vw25EMLiwUuxULYRiDQAP6H50MTN
 I0x1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+wpkEExYKAEEWIQQyyR05VSHw
 x45E/SoppxulNG8HhgUCY1i6jwIbAwUJCWYBgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIX
 gAAKCRAppxulNG8Hhk53AP4k4UY5xfcje0c5OF1k22pNv8tErxtVpgKKZgvfetA4xwD+OoAh
 vesLIYumBDxP0BoLiLN84udxdT15HwPFUGiDmwDOOARjWLqPEgorBgEEAZdVAQUBAQdAzSxY
 a2EtvvIwd09NckBLSTarSLNDkUthmqPnwolwiDYDAQgHwn4EGBYKACYWIQQyyR05VSHwx45E
 /SoppxulNG8HhgUCY1i6jwIbDAUJCWYBgAAKCRAppxulNG8HhnBLAP4yjSGpK6PE1mapKhrq
 8bSl9reo+F6EqdhE8X2TTHPycAEAt8EkTEstSiaOpM66gneU7r+xxzOYULo1b1XjXayGvwM=
In-Reply-To: <23cceeb8-5d86-4923-a072-b9e72b74d36b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0285.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6d::21) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|SN7PR12MB8002:EE_
X-MS-Office365-Filtering-Correlation-Id: 6762c38c-229d-48fa-22be-08dbcd130338
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FCrcnbpQU5fnwgo4OOc+tSQhh23M6NzPS3bGdZyiwVP+tWPjh86b03hC9L2BkoeHXGGGZPa2qLIjPVPG6TnCB1L3ufMCOu9PlM3ow4JLaZT7RXviVkkScWweGP8WY0OZe8oqPeUgaUhhqNdPvUOeap//1Zz4LoBWb/A9YodoYdcGVpex8+j6086VODmuJvBr1SEvF1S4hBFs9fd2UawlXJd6pj6wxSTYBI8MntkT3XSsqutHS73RwLFluiSxTvlAoRwSb7alTdiFQ4U6h0BDmJJArSWBy5J17QPeb3eX5S221KQCxdzIyjyb6su+ZdDHuFZC64hihPSmzVDRrbXPjwk7ulnFk7j40FdPBN7pWb6jtdsrZM2ogP5Ev+yG9C/1QKmJpAye/JnkJIx4JtlAaEbMEhnmwfneU6t/GDUcJ3uWyAuTkTprKN6iDf1LekfQZNyYA9Hy59MC4f7td+yETVEzxcdfWvpIlF0F6nE7/azh+JpiTGWId/hldl2GBThK2a1OZpfm1bdW4x8jOUqRL1AwdrzQTd94yvacgpntlKNM8x6/hmykarrqvtCAUHp+bO5hQcJPb5eI4GDhflHcUWpmUsPVobSZdp1XuNSWmy+nJ8+ddseB8hnd7DNU3Ks/GFWuZtfpGmFz5rr48q2okQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(396003)(376002)(346002)(366004)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(4001150100001)(2906002)(7416002)(86362001)(31696002)(316002)(66556008)(38100700002)(66946007)(66476007)(53546011)(6506007)(6512007)(6666004)(6486002)(478600001)(83380400001)(2616005)(26005)(44832011)(5660300002)(41300700001)(36756003)(8936002)(8676002)(4326008)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VW9sSVAvOSsxdGltR1g0djJwUVhzYXJqM1MrZFVESEc3NlRKV2tWNEQzMHdu?=
 =?utf-8?B?MWh6RXU5V2FnRjYxRGVhejFvSUFlNlNIMTRnTTRIRkI1VXpsU2N2UlN0cTRQ?=
 =?utf-8?B?QjNFc2JITHJaMTZRaUV6VTJkYzBjWGd1UU9IYTZOem9rZWdCRVM0R2cvVk5V?=
 =?utf-8?B?WWJhZnBIMk0rb1ZBTHdWdVZhcDJMOGsxaEt1ei85aFo3dFJVbXUxZ3VJNVVO?=
 =?utf-8?B?cUZZaVFialB3bzNYS1FhLzZhREoxdmhTQ0xVZURKVVJ3ajRNTzcxSC9mMk1Y?=
 =?utf-8?B?aElWLzJWQ09id3h3bFIxQUVpSkNhb0ZRcDlJUXpEaWF4RnVIQTVjRDc5eHlT?=
 =?utf-8?B?cDVnNCtvTW9Cd1VZVnRsUXJFTW45dmdKN2xrdkx0NUQ2aVpVdGNTOTc2Zks2?=
 =?utf-8?B?YXFzeERvb0pxcFRJSUVDU1A2ZjlNYUl4YWlSRWFOMC9IKzFTTC92N0VtTUJY?=
 =?utf-8?B?NjlCM3NnR205U2tVZ2cxWHc2cDMwc1Vuc2JjZDhPNDdhRE5vaEZvWEtJaC92?=
 =?utf-8?B?ZVlRZnY2OHZEUEdQdHpuWXd2dkhwaUZPRDBrL2hzYjJTL0VlQkY5UTVnWHlw?=
 =?utf-8?B?WGUveHlHMmw0UFIxeUROdXhndTVUbG80NWNOZjBGdVZQVWdpMm9iZDNvUE1k?=
 =?utf-8?B?TkdJYTVnMTVpTSs0eVBDa08xL1p1SVNodTNjK2FWV243VHJ4VVhHaGV1ajBD?=
 =?utf-8?B?ell0dVB1NVg4RDR6TjQ5aGJ1U0VxTkE1ZDcrd21aMWhrSjM1d3NkL3JvQ3BQ?=
 =?utf-8?B?M3dmT2g4VVVlRHJFZFZEYnFnNkpTc3hRclNJYnFtS2JaUUpXbjY0QnRaUk90?=
 =?utf-8?B?dFZNeEpvK2NrQXZkZitndytMM2l1Y1lTV0t1TWlvTGZVa1g1dEpBcUdhZW9i?=
 =?utf-8?B?MStZNGVuSWtKWk8yNWh4NVM4bFdjNWg0Z2pkRDNMNVhqb3VWajJvMXh2K3Vl?=
 =?utf-8?B?WU83cnhSeFRyaDVMMlNQZFU2Mk5PUnRGazY3V0pyd284WktnSzFrakxlL2dJ?=
 =?utf-8?B?TkU0bTM5Lzl0STUybGx1WG1HMjFRU2tlUmxFaHhZZGcxY3FoZGkvZUwyQ1Fz?=
 =?utf-8?B?bzVoWXBnMDNDV1haMmhkbmdZMXVQcHdYVys1YjdOUFN1OFRnb3kxaW9TY3Bl?=
 =?utf-8?B?bXJhK3pPb2JoOWF5SlhWaEwxY1pCNWlTeUxRUERIL3piaWFmSjcxNFg3d0xL?=
 =?utf-8?B?cS83QzNUanc2QUtTdlBOMkxSZGRXWDVHeWR4eHEzVWEvNzFLTExZeHdtUmJU?=
 =?utf-8?B?a2RYZXgxaGhFcEU5anptazdnWTJLY0UwSWNTd0ZtUURuNlRQLzZ6cnF0Y3Ew?=
 =?utf-8?B?V01CZy9lM3pQcTdjUGt5SzhpdEZjTDQ2Si9kdXR6S0JIZlc5NEcweFF1bmdP?=
 =?utf-8?B?djczRWQ2ZWNpMTJ1MVBPYWtxekllZ2lSdy9BbGNTZStheEczUmxXTmRlT2FQ?=
 =?utf-8?B?OTRrbmpwVFJNdmxLY0ZPOVQxb1IxQWVaeE9iSkFzVWxyWnF3eG1VeCtVMU1N?=
 =?utf-8?B?VlVZbVdQN2FiVGVaNlYvbVUrWVBzcU5jY0ttUnhmYllLckg3WkhvOGpWKzBt?=
 =?utf-8?B?OXJPUS9nSTJ2WkpPTWxzSHRiQ1NKWEZWWm45bjNUNi9seXRGWFl6SkdjbDFD?=
 =?utf-8?B?YU5hdmI1SnNGeHI5eHNKNmpvU1QzUWp4MTJrR0J0ZVNGNGUweTRudmM5SHBB?=
 =?utf-8?B?b2lmYzJnOGVjVE9OS0RpK1BRT3dIaFhJNWJlc1ovYi95ZURpL2o3VDZtd1dV?=
 =?utf-8?B?dFNOTTA0dUdvSk5iODl6UjlYVG5xNElBYUJQeUlBWVJIYllZZFZOdUdEaGlK?=
 =?utf-8?B?VldNL01PUjZ2RWQzendzK0hHYzBTL0Fta21zUGtUWGgxckJnZGdTL3RvcmU2?=
 =?utf-8?B?K3NVeDU3NUxqK3ZLTmFZaE9Ubll1cllpVXJiTFpBR25pamlNZDFReWVndnE4?=
 =?utf-8?B?L2pYejhEZEoxeFpTUmRDUzBqdCtIUWZDYWQ4YlVkYS9HSlltZVdVTmljR0tD?=
 =?utf-8?B?cEtFaURianVSamc1OFlKV0lWaCs5citRSEQvZDA2a2I5RVNySWM1Ulp0Q0RZ?=
 =?utf-8?B?aWRWa2l4QWpmTk1OMDFyMUlDQU9rTU12K1FkYlZaRHF2NlM2YmlxaUlBWUwr?=
 =?utf-8?Q?g4QtnozheU4mvQbxM9p559wik?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6762c38c-229d-48fa-22be-08dbcd130338
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 00:09:35.0193 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I2R00pzOUaYIfFbJ+q3rB9K7/CV8z7N5rzOPqhOonTiOcUYCEnOZ6vx4z+uZYeks
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8002
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, Liviu.Dudau@arm.com,
 mcanal@igalia.com, boris.brezillon@collabora.com, dakr@redhat.com,
 donald.robson@imgtec.com, lina@asahilina.net, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-10-13 22:49, Luben Tuikov wrote:
> On 2023-10-11 19:58, Matthew Brost wrote:
>> Rather than call free_job and run_job in same work item have a dedicated
>> work item for each. This aligns with the design and intended use of work
>> queues.
>>
>> v2:
>>    - Test for DMA_FENCE_FLAG_TIMESTAMP_BIT before setting
>>      timestamp in free_job() work item (Danilo)
>> v3:
>>   - Drop forward dec of drm_sched_select_entity (Boris)
>>   - Return in drm_sched_run_job_work if entity NULL (Boris)
>> v4:
>>   - Replace dequeue with peek and invert logic (Luben)
>>   - Wrap to 100 lines (Luben)
>>   - Update comments for *_queue / *_queue_if_ready functions (Luben)
>>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> I wasn't able to apply this patch on top of drm-misc-next at a48e2cc92835fa.
> 
> Create a branch off of a *clean* drm-misc-next and rebase/reapply/cherry-pick all
> 7 patches on top of that clean drm-misc-next branch. You should also run
> scripts/checkpatch.pl --strict on all your patches, or integrate it into the precommit
> hook, see githooks(5), so you don't have to run it manually.
> 
> Set format.useAutobase to whenAble somewhere in your Git configs (global/local),
> or use --base=auto to git-format-patch when you format your patches before
> git-send-email-ing them.
> 
> Repost your patches.
> 
> The base commit will be added to the bottom of the cover letter. It should
> be an ancestor (or tip) of drm-misc-next (git branch --contains <base> --list etc.).
> If it is not, your base tree wasn't clean, and you should redo this process.

Poking around I found out that this patch set is based off of drm-misc-fixes.
Had the base been included, it would've made this easier.
-- 
Regards,
Luben

