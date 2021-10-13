Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8973842CA22
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 21:33:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A9B089BBD;
	Wed, 13 Oct 2021 19:33:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2058.outbound.protection.outlook.com [40.107.237.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 544BD89BBD
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 19:33:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=of9vDh1ut9PvE3Lj5nBMwdZ+nArzSZYPrs1kuD+6MRVY/sn2ncxF42Wr8hfe52BuTTxLrCsGOqiy7FLPYGq8/ZUMhjaj1cIJQDrB2F9GUais4QMElJYW6hI7ljz/VPh2ANKQEiT51C5Ff2zjq6CqgF8/WnvnEISKPJFPwj7RIG8SCd60pmIvc4fs607kRw6DgP9Yaf65vIINXpoYuwFFMa+vEwCG2W5k3uinuWpMr/fwYUfrcSfSiiTb/xNxg7e9rHTAAzqZ42SyqY8rQSFm5R4JK37Yrpdo8BWQh0+ymwmnU2Q5nUqb2+tRSLMLrGNalkW0P2uJNSdFRkAHe4MqCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2GB/fBYEQims2hxlGBFzP4bpAj32g1WSmp+/yQbqxg8=;
 b=KURE45bWdwj+Rv01adGtgBdPdCj59LGBGkDJ7KKkBJifUtx99ExXHfZfiyslUsdCVgp5byw7YQRTCZw7H2I28M0h6VcnG0+StCyUe5paphryjosMZOq29BS6UfQ2nDxHCqORLh6N3Aw0wwaoiX1U59PbMhzxCJrJJMsBoEjRaZiiwEZ1nOp52nD5z4LuSYZ5kIlnwZskdXu/Jh/j1Hi8KGWq9Mlolqg5juUbYj6Erh2SJkaCWv9DNjVKqUv78/FLxfjRbnjqyuNFrAskRe78rB9nLKdeJ0+Tu2IY1h42MfkdwiwVJNzUunEiiH/dZSWZxYcIcYarFecCk6k8jtNapQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2GB/fBYEQims2hxlGBFzP4bpAj32g1WSmp+/yQbqxg8=;
 b=CZq6I9ZzkaD7NDEtVanWi64LfAETtaxvAYlmpmynwGGZ8nPVoHNltPKepfbhojj/JoEVc4t7Uc/rnbjv0tefY83Gaq5hLyVK9psb5v6o+ImZTH0RoQTQePZhPdTPYNcbYZvRbyowVZniT47nZvw+qFp/3a+Wkzrzy+0kW34D9ag=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4554.namprd12.prod.outlook.com (2603:10b6:303:55::21)
 by MWHPR1201MB2525.namprd12.prod.outlook.com (2603:10b6:300:e0::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Wed, 13 Oct
 2021 19:33:46 +0000
Received: from MW3PR12MB4554.namprd12.prod.outlook.com
 ([fe80::700d:46f0:61ab:9c1c]) by MW3PR12MB4554.namprd12.prod.outlook.com
 ([fe80::700d:46f0:61ab:9c1c%9]) with mapi id 15.20.4587.030; Wed, 13 Oct 2021
 19:33:46 +0000
Subject: Re: [PATCH] drm: Update MST First Link Slot Information Based on
 Encoding Format
To: Jani Nikula <jani.nikula@linux.intel.com>, Jerry.Zuo@amd.com,
 dri-devel@lists.freedesktop.org, lyude@redhat.com
Cc: Harry.Wentland@amd.com, Wayne.Lin@amd.com, Nicholas.Kazlauskas@amd.com
References: <5e463fbc3d633eea1078e838ba5be0065ffbeb1e.camel@redhat.com>
 <20211012215848.1507023-1-Bhawanpreet.Lakha@amd.com>
 <871r4oykh5.fsf@intel.com>
From: Bhawanpreet Lakha <Bhawanpreet.lakha@amd.com>
Message-ID: <b7af88e3-ed97-0f13-53ff-9e591844f62e@amd.com>
Date: Wed, 13 Oct 2021 15:33:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <871r4oykh5.fsf@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: YTXPR0101CA0012.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::25) To MW3PR12MB4554.namprd12.prod.outlook.com
 (2603:10b6:303:55::21)
MIME-Version: 1.0
Received: from [IPv6:2607:fea8:9dd:3f70::28d8] (2607:fea8:9dd:3f70::28d8) by
 YTXPR0101CA0012.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Wed, 13 Oct 2021 19:33:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f2ce39c-4d41-4825-194a-08d98e805f33
X-MS-TrafficTypeDiagnostic: MWHPR1201MB2525:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1201MB25250ACEDBC56B3294C4B9A1F9B79@MWHPR1201MB2525.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xQZY+4dMhDiAXjDGiThuYvKER0I8e4eTPNmfcRgcyviVpCzY7oc7PdnhQdE2bfNgVZreZxcQTgi/bdJKYSQU1NlN5xobCk9+rW7INeSNpxfu9tJfrqypcLrtxuuhPEjYs1Aj0pPki9TXsTDHN/jALIQOQAja3fD057ocDznR42DDb3tEBkP1J41wNs9Stf2bFnVHR0J8sCL7WAqCjVFtGQFd9NVDK7aelyaliTjQJyllEON6B1OwFgLX2q2jyJWVpcOfsVo5SIXHb5LMsxRjGqzethvQUO4XQLwKCQFFUWSNlq1g65/hXJQOY15PkM89x0Igt3k4A+INUq+WIuuyGkaN/jzg9CNik8GUKYVCgxxWw6ZlEiWyIkrDCI8cLP3osWy+iMH+ABQFfVpQctftoZdeRszqYUgaK+IT4y0WHSGJzgDKYrng2mERIbAwREv0lt0ckTOAoetPAQWODnPBusW3nDj0Xm2P5W4NNrl6fOoFRG7pvUg6hFBTb8/gCsUwSkWO388uXoItttgvGXxEZKW684lLwwsmrG8hL3RO+D/8A5a1k2dUzEQ6qVJvsRBbUaKOuG3SmHerLCubrTfpisaM+sLEjg5YVFXuZSrGSnQaeZgse6peiYvKhwfCaHq+i8TsDnlDfTCsun4gfO+MmhWVjLC5osYvSQYF4FQXRqxFtHyNMmuBTZS+fFx26rNDzxJ2wVxlNZGoqCGlpgVCSoxwVceKUeWVd+t/kMACY6I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4554.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(31696002)(36756003)(66946007)(508600001)(38100700002)(83380400001)(86362001)(53546011)(2616005)(66476007)(66556008)(31686004)(8936002)(2906002)(5660300002)(186003)(4001150100001)(316002)(4326008)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFdkVVBseTZ6b1I4YXFrNWRmWVNJZUd5VkxSdXNVM3FiTWJtNHhRWXo2NUMz?=
 =?utf-8?B?cTZQaTlNNnNHVmF3T1B4S01GeGNBOUw2dFNONUY1VnNrcStpSHVuektzQk0r?=
 =?utf-8?B?TUNkSzBFbGtlbkx5SXVza0JJdGNDUitIQ3laZ2R2N0txVlBiUVN0Z0VacW45?=
 =?utf-8?B?aXduZDNWcVUwWUwwSTdySTFMK1d4b0wxR2hhejY0Zmk1aG1zcGdycDhRTXNO?=
 =?utf-8?B?d0UvZkpac2J4aWl0ZFRpQ2ZoblE5b0FpTmRRL0U2UjFpS0l0NFNvcVZYL0hG?=
 =?utf-8?B?S3FncVQvWmNYeEtFZUF5SDZuRGNnU2VyRWxodWh5V2xhWmNsU1lFaEtQSHJK?=
 =?utf-8?B?Wk5ibEoyVjRzRzJzd2lZZ1R6MFlZZW1kOTZheEhZSnZhZVJKbGdUZUFud3V4?=
 =?utf-8?B?eFoxblFDSXhtK2ovZE9DUGtkeDRsU3dHUm15aFF4MnF4K1hpOWE4ZHV4cjhu?=
 =?utf-8?B?QjloMHI4TGF6LzNBdmhqRHQyL3BzM210NEtKQnVSWnZOcFkxMHExSWhiRWVP?=
 =?utf-8?B?aUlkZ0dvZkhlT0V5TGw3eWlNdlhoNHdWQWIxUm1ZcGdGWVNncjFxMVQzNGdF?=
 =?utf-8?B?UVprWEF2SVAxTFBjSWlzaWxBM3NvNjQ1S1ptUENtQ3h2U0pTN1FiK0pSR1Zv?=
 =?utf-8?B?dWVKWG40cFBmT0htcktIRS9HQU9tT3RuSkxVSzhTdnJVb3h4OVo1QW9SMHNR?=
 =?utf-8?B?WHlsQzAycmYzbjVvTGljTTZLNVBrdEIrSEdualJqZVYrcWtoemFMUS9oRWtF?=
 =?utf-8?B?R050a0dxU3NNL01KdTRrRXFXYmhGdTZrL2R0L25tS3pWYTh3Yit6UnV2Z2t3?=
 =?utf-8?B?Um5EeHRwNVhodjRNdjErdm9yU2JJNDg5UVlZWk5mTE9SclJmMCtrRURHTzZr?=
 =?utf-8?B?dkhoNytzVk1wd0g0ckh5Y1lDbmF6Z0FDRkh5VTBuTGRDeGhRWnZFQ0tLK1R6?=
 =?utf-8?B?U2hhYlpXRldUSHFxRzlQakZQZDRqekxXOWpwTXgxaUU1dDNlTi8wTml4Mkw4?=
 =?utf-8?B?TnVOTFVRa202dmFoWjFZTkpzZ1FDWXByMGVDS1IwQUt5LzZoUmtyUVlqM1NF?=
 =?utf-8?B?akl6T1pJbkVsZVJsaFJLMDBSYzlQUDV6QkwzVDlPeFFpUCsvbS9pc0piRFdi?=
 =?utf-8?B?UGs3TWkrUUZyRHJONURWc2FWSENCdFJqMFQzck9FU2pQS1N5LytoL2hTR1Nx?=
 =?utf-8?B?eUorVG1LNEF3aEJNeENTcEFoSjcraHI4aE9Lc3VXMWtzZWV3QzFpakF5eVVK?=
 =?utf-8?B?azRyR2xMVWtlWkxtdUcrdVMxalBacG1Bb0JUUkhTSEFONnNOUTgwbzV2STFW?=
 =?utf-8?B?WGNhUjJMSWE5R2pWaEZKUUdWaDFuQkNrTi9hbHkzMFVhNXJKakNyY045SUxl?=
 =?utf-8?B?Y3hCQ0t6eCs4aUU0NUZMZ1BqVDR0SWZSTXJ2VzJjYnpweXZodWFvblNRSWJn?=
 =?utf-8?B?Y2hTYlJsd3JmRGpOWVQ1ODFxTE1MZDJRa3lqUWhLSFdkd3ZIdkcyUENTWUo5?=
 =?utf-8?B?SkQvaFNTTUQrQ1A1OHhMWHRXcXgwd1RkRkxIckRBZ0UrT25sclR0azJIVHMv?=
 =?utf-8?B?aXdoaFVRV0R5ZzAxYXZtMitrZklteFE2NnE1bzNZSkRkUFdKRGxERzhGdXhw?=
 =?utf-8?B?azYvbDF5b2VJb1JpYWs4YnZrMERud0FxR3p2Y1lYTklBcW9ieER0bjljVnho?=
 =?utf-8?B?SmVzYzU0S0lscUl2K2JlRXhYaWJYTVhMRjFpVkZBeTZaOXkvbVJmWE1xbDRJ?=
 =?utf-8?B?Yk83TXA2Mnl1citBZWNlY1ZFWjI2MUt5U3VBeW1xbmlVRFAydHRXTGtJMGRh?=
 =?utf-8?B?OFo0di9QOERQRlh2V25DUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f2ce39c-4d41-4825-194a-08d98e805f33
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4554.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 19:33:45.6556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nmOsz+6KQ4hcMgnb8T1Ypooe74oNyQdY+JV7lWYN1dhRXXpx75hZIVPmWms+8/VE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB2525
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


On 2021-10-13 12:09 p.m., Jani Nikula wrote:
> On Tue, 12 Oct 2021, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com> wrote:
>> 8b/10b encoding format requires to reserve the first slot for
>> recording metadata. Real data transmission starts from the second slot,
>> with a total of available 63 slots available.
>>
>> In 128b/132b encoding format, metadata is transmitted separately
>> in LLCP packet before MTP. Real data transmission starts from
>> the first slot, with a total of 64 slots available.
>>
>> v2:
>> * Remove get_mst_link_encoding_cap
>> * Move total/start slots to mst_state, and copy it to mst_mgr in
>> atomic_check
>>
>> Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
>> Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
>> ---
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 28 +++++++++++++++
>>   drivers/gpu/drm/drm_dp_mst_topology.c         | 35 +++++++++++++++----
>>   include/drm/drm_dp_mst_helper.h               | 13 +++++++
>>   3 files changed, 69 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index 5020f2d36fe1..4ad50eb0091a 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -10612,6 +10612,8 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
>>   #if defined(CONFIG_DRM_AMD_DC_DCN)
>>   	struct dsc_mst_fairness_vars vars[MAX_PIPES];
>>   #endif
>> +	struct drm_dp_mst_topology_state *mst_state;
>> +	struct drm_dp_mst_topology_mgr *mgr;
>>   
>>   	trace_amdgpu_dm_atomic_check_begin(state);
>>   
>> @@ -10819,6 +10821,32 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
>>   		lock_and_validation_needed = true;
>>   	}
>>   
>> +#if defined(CONFIG_DRM_AMD_DC_DCN)
>> +	for_each_new_mst_mgr_in_state(state, mgr, mst_state, i) {
>> +		struct amdgpu_dm_connector *aconnector;
>> +		struct drm_connector *connector;
>> +		struct drm_connector_list_iter iter;
>> +		u8 link_coding_cap;
>> +
>> +		if (!mgr->mst_state )
>> +			continue;
>> +
>> +		drm_connector_list_iter_begin(dev, &iter);
>> +		drm_for_each_connector_iter(connector, &iter) {
>> +			int id = connector->index;
>> +
>> +			if (id == mst_state->mgr->conn_base_id) {
>> +				aconnector = to_amdgpu_dm_connector(connector);
>> +				link_coding_cap = dc_link_dp_mst_decide_link_encoding_format(aconnector->dc_link);
>> +				drm_dp_mst_update_coding_cap(mst_state, link_coding_cap);
>> +
>> +				break;
>> +			}
>> +		}
>> +		drm_connector_list_iter_end(&iter);
>> +
>> +	}
>> +#endif
> I wonder if we could split this to separate drm dp helper and amd driver
> patches?
>
I believe that was the original structure but, lyude recommended to put 
them into the same patch to see how it is being used
>>   	/**
>>   	 * Streams and planes are reset when there are changes that affect
>>   	 * bandwidth. Anything that affects bandwidth needs to go through
>> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
>> index ad0795afc21c..fb5c47c4cb2e 100644
>> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
>> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
>> @@ -3368,7 +3368,7 @@ int drm_dp_update_payload_part1(struct drm_dp_mst_topology_mgr *mgr)
>>   	struct drm_dp_payload req_payload;
>>   	struct drm_dp_mst_port *port;
>>   	int i, j;
>> -	int cur_slots = 1;
>> +	int cur_slots = mgr->start_slot;
>>   	bool skip;
>>   
>>   	mutex_lock(&mgr->payload_lock);
>> @@ -4321,7 +4321,7 @@ int drm_dp_find_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr,
>>   	num_slots = DIV_ROUND_UP(pbn, mgr->pbn_div);
>>   
>>   	/* max. time slots - one slot for MTP header */
>> -	if (num_slots > 63)
>> +	if (num_slots > mgr->total_avail_slots)
>>   		return -ENOSPC;
>>   	return num_slots;
>>   }
>> @@ -4333,7 +4333,7 @@ static int drm_dp_init_vcpi(struct drm_dp_mst_topology_mgr *mgr,
>>   	int ret;
>>   
>>   	/* max. time slots - one slot for MTP header */
>> -	if (slots > 63)
>> +	if (slots > mgr->total_avail_slots)
>>   		return -ENOSPC;
>>   
>>   	vcpi->pbn = pbn;
>> @@ -4507,6 +4507,18 @@ int drm_dp_atomic_release_vcpi_slots(struct drm_atomic_state *state,
>>   }
>>   EXPORT_SYMBOL(drm_dp_atomic_release_vcpi_slots);
>>   
>> +void drm_dp_mst_update_coding_cap(struct drm_dp_mst_topology_state *mst_state, uint8_t link_coding_cap)
>> +{
>> +	if (link_coding_cap == DP_CAP_ANSI_128B132B) {
>> +		mst_state->total_avail_slots = 64;
>> +		mst_state->start_slot = 0;
>> +	}
> The values never change AFAICT, should we store the channel encoding
> instead, and use that information to initialize the values?
>
> (Alternatively, why aren't the 8b/10b values initialized here if
> 128b/132b are?)
I agree, 8b/10 are the default, but in case where we switch from 
128b/132 -> 8b/10b we should be updating them here aswell.
>> +
>> +	DRM_DEBUG_KMS("%s coding format on mgr 0x%p\n",
>> +			(link_coding_cap == DP_CAP_ANSI_128B132B) ? "128b/132b":"8b/10b", mst_state->mgr);
>> +}
>> +EXPORT_SYMBOL(drm_dp_mst_update_coding_cap);
>> +
>>   /**
>>    * drm_dp_mst_allocate_vcpi() - Allocate a virtual channel
>>    * @mgr: manager for this port
>> @@ -4538,8 +4550,8 @@ bool drm_dp_mst_allocate_vcpi(struct drm_dp_mst_topology_mgr *mgr,
>>   
>>   	ret = drm_dp_init_vcpi(mgr, &port->vcpi, pbn, slots);
>>   	if (ret) {
>> -		drm_dbg_kms(mgr->dev, "failed to init vcpi slots=%d max=63 ret=%d\n",
>> -			    DIV_ROUND_UP(pbn, mgr->pbn_div), ret);
>> +		drm_dbg_kms(mgr->dev, "failed to init vcpi slots=%d max=%d ret=%d\n",
>> +			    DIV_ROUND_UP(pbn, mgr->pbn_div), mgr->total_avail_slots, ret);
>>   		drm_dp_mst_topology_put_port(port);
>>   		goto out;
>>   	}
>> @@ -5226,7 +5238,7 @@ drm_dp_mst_atomic_check_vcpi_alloc_limit(struct drm_dp_mst_topology_mgr *mgr,
>>   					 struct drm_dp_mst_topology_state *mst_state)
>>   {
>>   	struct drm_dp_vcpi_allocation *vcpi;
>> -	int avail_slots = 63, payload_count = 0;
>> +	int avail_slots = mgr->total_avail_slots, payload_count = 0;
>>   
>>   	list_for_each_entry(vcpi, &mst_state->vcpis, next) {
>>   		/* Releasing VCPI is always OK-even if the port is gone */
>> @@ -5255,7 +5267,7 @@ drm_dp_mst_atomic_check_vcpi_alloc_limit(struct drm_dp_mst_topology_mgr *mgr,
>>   		}
>>   	}
>>   	drm_dbg_atomic(mgr->dev, "[MST MGR:%p] mst state %p VCPI avail=%d used=%d\n",
>> -		       mgr, mst_state, avail_slots, 63 - avail_slots);
>> +		       mgr, mst_state, avail_slots, mgr->total_avail_slots - avail_slots);
>>   
>>   	return 0;
>>   }
>> @@ -5421,6 +5433,10 @@ int drm_dp_mst_atomic_check(struct drm_atomic_state *state)
>>   			break;
>>   
>>   		mutex_lock(&mgr->lock);
>> +
>> +		mgr->start_slot = mst_state->start_slot;
>> +		mgr->total_avail_slots = mst_state->total_avail_slots;
>> +
> It feels wrong to me to be copying stuff from mst_state to mgr in
> general, and in atomic check hook in particular.
previously we were setting it directly in the mgr, and this was 
suggested by lyude. I am not sure what the alternative is.
>>   		ret = drm_dp_mst_atomic_check_mstb_bw_limit(mgr->mst_primary,
>>   							    mst_state);
>>   		mutex_unlock(&mgr->lock);
>> @@ -5527,11 +5543,16 @@ int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
>>   	if (!mgr->proposed_vcpis)
>>   		return -ENOMEM;
>>   	set_bit(0, &mgr->payload_mask);
>> +	mgr->total_avail_slots = 63;
>> +	mgr->start_slot = 1;
>>   
>>   	mst_state = kzalloc(sizeof(*mst_state), GFP_KERNEL);
>>   	if (mst_state == NULL)
>>   		return -ENOMEM;
>>   
>> +	mst_state->total_avail_slots = 63;
>> +	mst_state->start_slot = 1;
>> +
> The magic values for 8b/10b are now duplicated to two places, with the
> 128b/132b values in a separate place.

8b/10b is the default (to make sure we don't break any existing driver 
that doesn't use 128b/132b). Are you against setting it as the default 
here? or do you mean we should use #define for this? the magic numbers 
are currently being used directly right now (inside 
drm_dp_find_vcpi_slots, drm_dp_init_vcpi).

Bhawan

> BR,
> Jani.
>
>>   	mst_state->mgr = mgr;
>>   	INIT_LIST_HEAD(&mst_state->vcpis);
>>   
>> diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
>> index ddb9231d0309..f8152dfb34ed 100644
>> --- a/include/drm/drm_dp_mst_helper.h
>> +++ b/include/drm/drm_dp_mst_helper.h
>> @@ -554,6 +554,8 @@ struct drm_dp_mst_topology_state {
>>   	struct drm_private_state base;
>>   	struct list_head vcpis;
>>   	struct drm_dp_mst_topology_mgr *mgr;
>> +	u8 total_avail_slots;
>> +	u8 start_slot;
>>   };
>>   
>>   #define to_dp_mst_topology_mgr(x) container_of(x, struct drm_dp_mst_topology_mgr, base)
>> @@ -661,6 +663,16 @@ struct drm_dp_mst_topology_mgr {
>>   	 */
>>   	int pbn_div;
>>   
>> +	/**
>> +	 * @total_avail_slots: 63 for 8b/10b, 64 for 128/132b
>> +	 */
>> +	u8 total_avail_slots;
>> +
>> +	/**
>> +	 * @start_slot: 1 for 8b/10b, 0 for 128/132b
>> +	 */
>> +	u8 start_slot;
>> +
>>   	/**
>>   	 * @funcs: Atomic helper callbacks
>>   	 */
>> @@ -806,6 +818,7 @@ int drm_dp_mst_get_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr, struct drm_dp
>>   
>>   void drm_dp_mst_reset_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr, struct drm_dp_mst_port *port);
>>   
>> +void drm_dp_mst_update_coding_cap(struct drm_dp_mst_topology_state *mst_state, uint8_t link_coding_cap);
>>   
>>   void drm_dp_mst_deallocate_vcpi(struct drm_dp_mst_topology_mgr *mgr,
>>   				struct drm_dp_mst_port *port);
