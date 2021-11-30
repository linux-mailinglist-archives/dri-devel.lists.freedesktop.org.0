Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 907B2463CE4
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 18:35:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A768F6E81B;
	Tue, 30 Nov 2021 17:35:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2065.outbound.protection.outlook.com [40.107.244.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C4F6E81B;
 Tue, 30 Nov 2021 17:35:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SjIxmE4/e0GmdHI6W0TBtjIAIwm1gScdMhk6WrPSh/3L2TBvIU/YCobdkmfb6kCVqVfWkSrQNEJSIUABiDLsxN/aMdk94gZS5KrYIiyE/Qai+AKmHywHr4zQdYKeJuX1nFTYpAwl0+CpKcz4t2gSoF07nrNiqzBE4QK5ZcA2gojjJrAtvr2AmnBzCuXUGbjHwHpA7E/5cXWM5/cGoYYoJp5/N1oyBC3M3xuKakpUlFNT3xD27ck90vFlIni2b5FkxrG3oP2+1MLDwjgpmn5VWNRDNmw7cVy4ytCFf4sUZPKP3l/v48A0sfIvtJTn2r0vU9tOJBogGJXTgMfjM1iApA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PgOvg1PK/JvXeQJBSTwu7z2Jlhz0Vvbfw/LHaTi5aG0=;
 b=L8OLcwR9Afp0kAe4ALg6aiBD4kuDxCfkf+1Dm7vCGK7SuzciTnWw0NL60nvEs/YoRgAlXvwSrhNeauiIasWLhPdibsedFeVstldxPiVgmLoNAmJY8eLh4jPdWud8r7jS8qcMiwiO5CL/01ly3In+pUowHUyvd5Vh+0cbr/4w71qJmNuA74+CI0oHJhRlYKYRSks+P8NVe5LJx8YO6FS2wn7QALmbw3JJS766vdj83xcPgPXfeU7p4AS6DdxXgfCEHxdUST4+/baBb6VLfrAoRK9jYdZevrg0vOFQNnJ+F8+hDyCYIozv8Gx2Zme2yG3JCFhWaRGXPXN7q6fq5KrbpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PgOvg1PK/JvXeQJBSTwu7z2Jlhz0Vvbfw/LHaTi5aG0=;
 b=tJUjDl7Qyb1v8rgBVXJ5JRpADAGd2hovH3dbcT0PlNAvd2PbHiBplCzM6U9xIwYcRvZ8Xyo+WXua5grOb1rtnOs0heByp1vhMZ9O2KQVgc9Sa6sc/PjwuaFmVepagtXM18bStCUD20KlRr7oM3m7b9S8OchyUOxIqlKlBvg+Xds=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BN9PR12MB5146.namprd12.prod.outlook.com (2603:10b6:408:137::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Tue, 30 Nov
 2021 17:35:03 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9dfe:ccc6:102c:5300]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9dfe:ccc6:102c:5300%9]) with mapi id 15.20.4734.024; Tue, 30 Nov 2021
 17:35:03 +0000
Subject: Re: [PATCH] drm/amdkfd: Fix a wild pointer dereference in
 svm_range_add()
To: philip yang <yangp@amd.com>, Zhou Qingyang <zhou1615@umn.edu>
References: <20211130112644.116604-1-zhou1615@umn.edu>
 <b78771ca-2ca2-a369-b67f-dc479eb87d90@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <4a457ba1-67df-993f-1a7a-9868a954de99@amd.com>
Date: Tue, 30 Nov 2021 12:35:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <b78771ca-2ca2-a369-b67f-dc479eb87d90@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YTXPR0101CA0022.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::35) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
Received: from [192.168.2.100] (142.127.191.123) by
 YTXPR0101CA0022.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.23 via Frontend Transport; Tue, 30 Nov 2021 17:35:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66f0b76f-c64a-436e-46f1-08d9b427bdb8
X-MS-TrafficTypeDiagnostic: BN9PR12MB5146:
X-Microsoft-Antispam-PRVS: <BN9PR12MB5146984D2973A999A1508B9492679@BN9PR12MB5146.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TTljsilqF90cvSQUhfS8HCktM+XzytWN8uNvMAi+UbTHIoj7BaM6dEPzaaC751f7ryYVKAk2CEKEJmNHOrDg4osR2qv4pM2fSiVDgaD53T6YRJnBOT4o/3dnVr3ktpI4Ni3QkcKRfo2DGmelgqAAFvbNDM5+A4RpDys13XREO0jTe903aOuuLdfhr78KVGo/t4nIjWdjvvHBCRFgVQRAj3dlQrzIj4tVa90Swp4Vdy2elYIHx3m1atSl8hB9dtaA12JHhhBy+SmfTxcV5+Yq5ZlpB+Fbh1aJnK2O2AhMOQaZX5Drco0fqNgvnGkWnHQh0VUmivEi9sssa3tmCDumh7ZfB8gTtwrBnLeYui2tLqQVnDWWsMUKn+G54BRUplqFqLf8yUVvSwSFro7sT8WYLiDDqOhfpZvmZr8m+5pR8A2lqFW6jIyc7WSOjkZPuXcxIBwD5lp407viOeiZX/NhgnMIyXGNkFz5zQQh9Uzy41FpzyRPlzeePYAWEoXrpBnqw0pIH3qB0j/B4BATd8o8QazzENG2z8UIzX8qfjxUJ0XYQnp+OlQYtsdWzyTBUMO9Ll7TXn1RcxQ3YyPWRLSpiBgLfjCI4uWYd3k3Yw+eJ4tMigaQZm1on97gqvfRAKQ5ZdgmLj2D05ODjMS4W3SAj3OHRNnL21UghFUaAnNFNDlWB50zYKOE8tunWsKiACDLAaLrwCnGXGPxjHKl7ApoL3S4ppcQWvs11l2pzHyadfZluZK1mJjTN4gC+TcB3QXJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(4326008)(38100700002)(83380400001)(5660300002)(53546011)(2616005)(4001150100001)(44832011)(36756003)(186003)(31696002)(16576012)(31686004)(316002)(54906003)(508600001)(956004)(110136005)(66946007)(66556008)(26005)(2906002)(8676002)(86362001)(66476007)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDNtN1RwOXo5MUxHRDVRZFRhRjM4d1BEMUxIajlpNWo3b05Hb2dnSXRwendO?=
 =?utf-8?B?TlFRUGphSEE1RnZ6WWlRc2V0K09uaDIrQ0VCRGptaHpFVGxQa3YwVFFiSkNJ?=
 =?utf-8?B?WkQvY2pOWUJMYVdoSk1kR3E5WExGL1ZJbEs4a09jcDc2dy9TNzcrSjVYcG9z?=
 =?utf-8?B?d1Iwd2xjeTBSQmtrVWNqRlN2QzhESkZZdjNPWGVtTmIrT25vblhMVTdMdXVa?=
 =?utf-8?B?bm8raXFLU01uQjZ4d3FER1pjdGFPTkxXRGRTMWpxVisxZTd0LzNETHR6UVZ4?=
 =?utf-8?B?WWR6WTdjRUlublRVTXlaME9qM2gwQmh1ZmRvMWUzOUt4dWl1YmpXWUhDT1ZJ?=
 =?utf-8?B?SGY4dmZQWFhwYzlkMWlSc2dEaUNDdmRneWcvMkhvcnNzak5Iazh0c3grbFZJ?=
 =?utf-8?B?TGZaUmg1dDNyVWYxTkNYMytGbzlGSXRSQStCdldleXpHN1NhK0FlcjVoaHV0?=
 =?utf-8?B?bjJRc25GQnRSNXAydmUrbHE3dTRhditKOGliT2JFMWRleFkzbHhWWFRXK3FZ?=
 =?utf-8?B?OEM3UUpmY1FONldnZ0FMOHcxeVNpbk9VOVRnN1NCclN1Z09oVnhQZzVRT05a?=
 =?utf-8?B?a2xjemk3OHBzWDU4c0ZCVklYOTZWcFgrRkFmNnVEM1NEdnRtNWthNVlxQW1j?=
 =?utf-8?B?N3dSSWNXMFlhQmxnOE44VEJ5SXN1dHc0WkI5RldIYjJuT0NYZll4RlR4Witt?=
 =?utf-8?B?MDE5bERUNGxucFUwUTQ1Wjl4WTA3MEpHUFVyL0RkQVJ1anYxdzZhL05CN3l1?=
 =?utf-8?B?cmpMK2I1S25wbGI5amhBZ0lrWVBPOWxoc3hOSEhtc2wzK0lvMG1RQm0zOHNp?=
 =?utf-8?B?SW5YZm0xM01NYTVSL3NpUVVuQjZzUUIvSzZ5M1ZpSnp6bXZTOFBla2ZPQVJD?=
 =?utf-8?B?SVVSWW1XYWhSWGFPaTh0MDJDK3ZIQkJLcUlIcXJIN3FSMEc5enZXYmU0YjNW?=
 =?utf-8?B?dHpwYnJCUTc3cUhDSFV3RHNyWUc2UU9tVjU4VTBuMTNXcGVOSW5vb2xCVWZO?=
 =?utf-8?B?SXFJZlVsTVJ5ZlRVaHZTQ2FxWE9SaFpNaWpiM1V4Mzg0VU5SRVV4OWRpN3dH?=
 =?utf-8?B?ek1vb2FPU200QjJXR1VqK1hZL1BJTE4rakFqRHZBSlBaaFgxNytDazhWK3Y4?=
 =?utf-8?B?MmFlTDNrZGZIT2lNdC9xaUt4WTZnQWVkaUtTQmVzM3ZWWmIxMHU1c1d0NUtm?=
 =?utf-8?B?VGZQYkt0ajVaODd4NWRCTHkrMjQ3Qm1XRXpFZHZkN1VCb0s0R2NRWnVIOTgw?=
 =?utf-8?B?Q090cmduMVBNU1YyazBwVVJGNXBWUFViYnI3TVRPekhoa2x2dzF2U3VCd0hV?=
 =?utf-8?B?ZWJpSlRXdjd5YVJDNVFJb0lHYTUyM3lnT3VUL1ZJVVc0ckZUTStYRzhvcUhO?=
 =?utf-8?B?c25zZ1Y4RUwweUJPajJZN1dUa250U3hxajhPZThQNUs5WVg1UFpVTjEvK2tJ?=
 =?utf-8?B?OFZ5WEx5VDFJaE80QWd3QXB4MlV1VHkwcGczdlhTNG9MdnFwUlhac1piMSt6?=
 =?utf-8?B?akFqbFpTWnhOaWNldlNuWndPU1R5R3lNR21Oc2tBZ1VURForaWJhMk9jZVVZ?=
 =?utf-8?B?b3dTTWlQQjkzWTEzR253WmwzSzBmOEI1Z1dpQ3M0SS9yNHhxTzIyRjUrWk00?=
 =?utf-8?B?SkRJM0FMcS9NZUNWR2ttY0hMN1EzVUtLYk13eWJQNnkrdVZYSU9UaEFiWVNm?=
 =?utf-8?B?ZmVENmxqOS81cnJhSUVtVm9adEZsVlZrMmE0eWZqZVhQRmgwWjRNOTI5YlBS?=
 =?utf-8?B?SjBNOEkwalpvSk5iTHRKL2VsZGVZRmdIY3V2aGVWZFRuQTVZZFYvb2dBb2JV?=
 =?utf-8?B?ZnBFb0gxeTFzRnEyMUdBc0RZay9GWmdWMXIzdTRob2V3ay9MeExLR0RLN0xB?=
 =?utf-8?B?UTZoSVVXbU9ncWJYSnVudGhYOFJqTG0rYVFnMHhLRFRWMlBTNllQNW5KZVNo?=
 =?utf-8?B?bXhDdlNlWUgrdzZTejhzZ0tKa3U2YjltMElRbVpEaW5HdVE5TmUwU3psN1lj?=
 =?utf-8?B?aXlZTG9BU2crMjI1UkE4Wk44RUdueXViS1A5V1U4NHJtY2NBQm9KT3RKVEhZ?=
 =?utf-8?B?Y3FhRWhyS3V3YkhKMXMyM0ovdy92dmhoWVFrVVBvZCsrK3dibkd3QUo4amt6?=
 =?utf-8?B?eFBrWS9rOW52TXJ5a000a0xRS3Fqd1NTamxHaloxVS9qb1oydm9XenVaN1Ri?=
 =?utf-8?Q?4wLmLsFoOZwisc/pcgZoF2c=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66f0b76f-c64a-436e-46f1-08d9b427bdb8
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 17:35:03.1063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bc3809WTF6UTl/2AXacbpDCSeQjcWcq7eAIodsPQ1JbNj4fmDsVNTEPwF7LxkTA33O4AQVMvrDqCO0DWTO3mpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5146
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
Cc: Alex Sierra <alex.sierra@amd.com>, Philip Yang <Philip.Yang@amd.com>,
 David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 kjlu@umn.edu, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2021-11-30 um 11:51 a.m. schrieb philip yang:
>
>
> On 2021-11-30 6:26 a.m., Zhou Qingyang wrote:
>> In svm_range_add(), the return value of svm_range_new() is assigned
>> to prange and &prange->insert_list is used in list_add(). There is a
>> a dereference of &prange->insert_list in list_add(), which could lead
>> to a wild pointer dereference on failure of vm_range_new() if
>> CONFIG_DEBUG_LIST is unset in .config file.
>>
>> Fix this bug by adding a check of prange.
>>
>> This bug was found by a static analyzer. The analysis employs
>> differential checking to identify inconsistent security operations
>> (e.g., checks or kfrees) between two code paths and confirms that the
>> inconsistent operations are not recovered in the current function or
>> the callers, so they constitute bugs.
>>
>> Note that, as a bug found by static analysis, it can be a false
>> positive or hard to trigger. Multiple researchers have cross-reviewed
>> the bug.
>>
>> Builds with CONFIG_DRM_AMDGPU=m, CONFIG_HSA_AMD=y, and
>> CONFIG_HSA_AMD_SVM=y show no new warnings, and our static analyzer no
>> longer warns about this code.
>>
>> Fixes: 42de677f7999 ("drm/amdkfd: register svm range")
>> Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
> Reviewed-by: Philip Yang <Philip.Yang@amd.com>

The patch looks good to me. It's an obvious bug and definitely not a
false positive. The patch description is a bit verbose. Is this
auto-generated output from the static checker? It could be replaced with
something more concise. Especially the comment about this possibly being
a false positive should not be in the final submission.

Regards,
  Felix


>> ---
>>  drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>> index 58b89b53ebe6..e40c2211901d 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>> @@ -2940,6 +2940,9 @@ svm_range_add(struct kfd_process *p, uint64_t start, uint64_t size,
>>  
>>  	if (left) {
>>  		prange = svm_range_new(svms, last - left + 1, last);
>> +		if (!prange)
>> +			return -ENOMEM;
>> +
>>  		list_add(&prange->insert_list, insert_list);
>>  		list_add(&prange->update_list, update_list);
>>  	}
