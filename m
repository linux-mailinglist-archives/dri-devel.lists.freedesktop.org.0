Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 450063BC470
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 02:52:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D32E3898B7;
	Tue,  6 Jul 2021 00:52:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2043.outbound.protection.outlook.com [40.107.220.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BCDC898AF;
 Tue,  6 Jul 2021 00:52:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mT3MzTbZN/7eqs4kfuKDidR5JOEw2kPvd1HD8GW5ZkLwOS7PrtHfnBuPUeBghjCuIcTCFBnyFkwQI33hCxYSr1773ZtotKbLbGH54ic6rq5nDYLMDjziVqj97EdmbnSVyZKJLPphpw2lY1YMEiJJcBwvfyvP6JjhP9hbxiEyWiofYZiGMWcmoIbCz6nIhIi4RrTMt6S4+dJ/i8aJMcXGnDt2dxUra0BaJ9PUPXdXN9IcEZJOBk8wD9fcFd9Iv5s+ZYZ+aStaSMLtbNQuW3XgCbkW57caq+IUVVi+Ykvrh4Ydzbag3JgNkn6S3ES7A7kftK3gJX9Fhur2GlVsQE09/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=41bfLhI6d3IfIzfJ3JRC2Lhkk3UOuqbn68hp3GBdZro=;
 b=k2mYnpLmGntQJ7AF8+Dri8KITp0OF+Rh+Fun0S6HkraDWy7OQoJai9VwkClcuZsqM/s0XVhjUC1FWAr6dEo7b7jw0+VCCh7CA4MCX+6jQM/QdMjwLEELUcGrR/42Hg+xuMK1mDNQwxLZW446RKzKsC4HSTrlWs7M/1J6+be6VLqIxTQXVeOQheVEobaEu9PKTZUDJm/ino/jx9ilEmbPDsfGthJ5rbiuytPtJrHUvH39QFW/GGDxO9seJpszCpPg1rM66Z2w6n/+7/zBD7V1S2+gDEMPXQg2/hIZr/iohyvCOQTD6HrJYUz0oBsuJHJp8Tx9mXzLUtIyHD9w3exKpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=41bfLhI6d3IfIzfJ3JRC2Lhkk3UOuqbn68hp3GBdZro=;
 b=V1Jkwsi78UAa/QIaWyGIzcGXmzBz0ObPyBtARrUx3wPbcUKiJ8OaQDMhgh15MzPjyiPs06p/BWw12+aNwzmq8XWGdeyfpQY2xN2ktwkrhpO5XSgy4/uXVbpCyIKPTEx3zEHtQ5uv3r2i95Job3R4gJKw2dIxwEHCHKmB2ZdbfpY=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM6PR12MB4699.namprd12.prod.outlook.com (2603:10b6:5:36::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Tue, 6 Jul
 2021 00:52:14 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::50f2:699c:121d:f257]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::50f2:699c:121d:f257%4]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 00:52:13 +0000
Subject: Re: [PATCH 1/4] drm/amdgpu: fix a signedness bug in
 __verify_ras_table_checksum()
From: Luben Tuikov <luben.tuikov@amd.com>
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: <YOAsdyWeZAHF0oll@mwanda>
 <bb78075f-2249-8311-2f75-c0dfaa333ec4@amd.com>
Message-ID: <c60af259-f8ab-f495-ebc3-6b58af91c708@amd.com>
Date: Mon, 5 Jul 2021 20:52:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <bb78075f-2249-8311-2f75-c0dfaa333ec4@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-CA
X-Originating-IP: [108.162.138.69]
X-ClientProxiedBy: YT1PR01CA0027.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::40)
 To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (108.162.138.69) by
 YT1PR01CA0027.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.23 via Frontend Transport; Tue, 6 Jul 2021 00:52:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8fe59f2-9fd1-4012-fa3a-08d940184b20
X-MS-TrafficTypeDiagnostic: DM6PR12MB4699:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB4699D2927817306705FEF86A991B9@DM6PR12MB4699.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EmhZFtC/qI8d0UG8NslOOrgJCMhg06qa4zGvMVMRk+vgkEZ97EYE/QEFr+e+kU8btTwH43Qhs9X6Lmo3QfA3MQ5q5/BWButV+43KkGqscsFldukZOqxNgmz8iNwyv32GonnU95Ou/xsdmkqrmEKSIRSHkaBcrej9z/7euOhvjNxsjnxRzv2zDcoBiR2j/+gN5Bu3Sql+rTEvir8S9hYaNTQ7stnICZhT8YlIZDx+5L4+gkVLiHsJzWLCbkaQGpHQYDeQQhC/DXq5JmwcNp5dEkrLMjEJEMuiPL8wCN9fwqFZv3hZmGQGAIDn2+sEiTwl5VWF/fZ+FaVQ53FQRj3nhrrUaL9wR5pCZ+fzGBd0LTGe6JyDvJSKLEaqqGtjydg03j5v4QBFpwDzKCG3PPSdUSM0EqINCCCgco8aH+HAhxn0aebAMEIckNWXF/LCdI9UNNWAaQMF36qnGZmLr2GOctTx933FFr/Mh9H8EXWZSIysxTYmqzPvCEP9Enbvtdog9fTcTwdwmjzWU1vnfBIqMtEwZKX8PGNIccG4K2ImkZ6DEVm8hhEbBzVhU7OvN7a9K/Vn8pc/Nx0TqfJivt78OxKZ359ZHH4qyT3nrByn8LBBbK7ZvbeqDivUQYDOGCD6AQeg5yn4XZpJ/jG4x7+5FhH3R5vDLlc2WqWH1h4MYT+wmDgr7IMQg5Gv02LkKUAo1yPMAOnvcYUBlR/OjnK5n25O9U1/o/iCti4OTzSaN8w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(39860400002)(396003)(136003)(376002)(55236004)(186003)(2616005)(16526019)(36756003)(66946007)(6512007)(66556008)(5660300002)(26005)(31686004)(83380400001)(6636002)(110136005)(66476007)(31696002)(44832011)(2906002)(53546011)(4326008)(6506007)(316002)(956004)(86362001)(8676002)(38100700002)(54906003)(478600001)(8936002)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N09FdDRnY1A5V2JMK0RnTWpmSklKMzIwTjBRQnVEZUpndWh2ODdzUXRDcC92?=
 =?utf-8?B?VWQ2OFVNcWM3QmVmaGpUTjU3YW53V2JDaXc1c2lhaytTaFFVU2dFdzZaV3VQ?=
 =?utf-8?B?aFdXNE80cURRV1RnaG9jUTBZeEZHcVR5SVpYaEFrSzJTN3dZTlEvczRQM2Vi?=
 =?utf-8?B?cUF6cWwweERnL1pjY0hYUU0yQ2NBSnEwYjlKZlVFMkx6c2orRm40QmNiR2F4?=
 =?utf-8?B?TE56cEltSDBRenN5TmRjMkswRjF2aUxCZ3kvalZLcFA1bGFvdTNvMDlOK1Z4?=
 =?utf-8?B?VmxZbFdmSFQvVHRrTUNrbjVkNnFCaCtsUHdXdDdCRmRVcHpoWWpkYWVNZzJq?=
 =?utf-8?B?VjJ3Z29iblpoNjhGVEhXeDl6L2ZsYTB2emRKdnc5eTRTNDhCVkR2Qmpja28z?=
 =?utf-8?B?d1dXWGhPd2wrYzIyaXBFZ3k4alV1T2hobGk5UWg5TWZSZHgvTXVnbksrK3FL?=
 =?utf-8?B?Q0dJVldldk91QStpUzNrQS84ZXRRemVjM3NQTm9TZXVTSVJERXVMQ3BaOTkx?=
 =?utf-8?B?NXpHM3NaN1M3RHJwdXpmSDRyVTNYODVsQmdrLzNQTWNlQldWR01JTFcrTlU2?=
 =?utf-8?B?bHZnWXhmQ1J4eFI1MWpHekVVZGpFRHhJVVR3QnFrd1BrM2dPdi9sT0hNWDRG?=
 =?utf-8?B?OTJFWE4xOHI2eWh2ZjFXRjdEQ1FIeVBETzRQSCsrU1JGYVFZbDIyTWNDVDVl?=
 =?utf-8?B?aE1ReXdZSGI3SGlMSEx6MmdhcHNaUXl4WGltckVsL3FGV2paVkthOFlkdTlw?=
 =?utf-8?B?Z0xwT21Qd080ajFwd2V2NzBlb2VPUWNBZysrMHlBbGpua21zVlRLMWVvdS9O?=
 =?utf-8?B?WjdjejdPclhESFNFeTJOTWUzb3NOaGsyL2lOMXAyM1pXU1dFQ3U1c3VKd1Rx?=
 =?utf-8?B?Tzd6SEFnQURMREFhTnVGRkZpZ21IaHVTT1BEbGJIUUJjckJ4VDNSKytxT1pk?=
 =?utf-8?B?b202TnJuck9Pblh4Q1RBOVFDc1l4TnQ2Z0VQUDQ2aVNoOHdBdHVDTzV6ZGx3?=
 =?utf-8?B?TUh2NnIxR24rbGw5N2xkOWZYMFJjQ2c1Y1IzNWZVZHRCc0h3QmVHb2Mza2FO?=
 =?utf-8?B?bEVuMDU5ZDdxVnRUTkNUVmFwaStFT0hPQjlqSkluZlJjSUFCTjVuSnJ0a0dJ?=
 =?utf-8?B?QnFnNUZUTGJ4S3IyT0tGSXJyU0R3RjZBTUVhUVMrZ0N1Sm03YWs5aEhleGMz?=
 =?utf-8?B?aDJDQWxoZUNXb1BVbDZOTER2Vm1TSVpyM1VPVkRnR2xNNmkvSFVzMEwyUmZH?=
 =?utf-8?B?Mno1RHRsRDV6ejZ0ZUIxQXhEMmZOeUF0UXh6Y1pJNWpPbmZQdDJ5UVlmRFFM?=
 =?utf-8?B?dEJaYTQwYVFEVXNXUCtjL0ZaRUFhZ0QxMHl5WW9HS1JQV09XMEpxVWsrNW9a?=
 =?utf-8?B?SktDbzZyL2NZcTdDVlMwcVB6MzcvVkFlSXFoaVh0Z0lIREFYOExRbDVEaEJh?=
 =?utf-8?B?d3k4SnRDRjFQK01QRVJENCt2VTFvcmtHL3Y0dWNBOUVhNDhtdS8ybXk0QU00?=
 =?utf-8?B?cEVaYlUrMTg2ekkzV0dwaVFMcmJIcU9aTUNDTEo1TEpndE0vQ1hidkFKL2hB?=
 =?utf-8?B?SG8yQmQrNnh2R1Zjd0xVUllFRTBUL21YbWpMRytLQnRDRkUyZXp6a1lTamh0?=
 =?utf-8?B?SmdyRlJvVU9xdURRN2Jpd3dRUmxpdVI4TE0yTTJBQkFKeUpoWUh0VFBvOTdG?=
 =?utf-8?B?cnlsdXBhcnpuZTRGbUxBTzN1anRqL0pYTVVuMytESEVVQ3NHcjdESVE5WWg5?=
 =?utf-8?Q?5jv8Hb67bJa/9w9R5KrXz5S62HT/Z3ViQuKdtu2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8fe59f2-9fd1-4012-fa3a-08d940184b20
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 00:52:13.5989 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6p9Au5sZ05UhF4JPbQzmgXp5P8iipkcwCboa2aB5EbnMQo9iw/3hTM5J680lNwoY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4699
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
Cc: Guchun Chen <guchun.chen@amd.com>, David Airlie <airlied@linux.ie>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, kernel-janitors@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 John Clements <john.clements@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Dennis Li <Dennis.Li@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Alex,

I think we should pull these through amd-staging-drm-next.

Regards,
Luben

On 2021-07-04 11:18 a.m., Luben Tuikov wrote:
> Series is,
> Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
>
> Regards,
> Luben
>
> On 2021-07-03 5:44 a.m., Dan Carpenter wrote:
>> If amdgpu_eeprom_read() returns a negative error code then the error
>> handling checks:
>>
>> 	if (res < buf_size) {
>>
>> The problem is that "buf_size" is a u32 so negative values are type
>> promoted to a high positive values and the condition is false.  Fix
>> this by changing the type of "buf_size" to int.
>>
>> Fixes: 79beb6114014 ("drm/amdgpu: Optimize EEPROM RAS table I/O")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> ---
>> It's hard for me to tell the exact upper bound that "buf_size" can be,
>> but if it's over USHRT_MAX then we are well toasted.
>>
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
>> index fc70620369e4..f07a456506ef 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
>> @@ -978,9 +978,8 @@ const struct file_operations amdgpu_ras_debugfs_eeprom_table_ops = {
>>  static int __verify_ras_table_checksum(struct amdgpu_ras_eeprom_control *control)
>>  {
>>  	struct amdgpu_device *adev = to_amdgpu_device(control);
>> -	int res;
>> +	int buf_size, res;
>>  	u8  csum, *buf, *pp;
>> -	u32 buf_size;
>>  
>>  	buf_size = RAS_TABLE_HEADER_SIZE +
>>  		control->ras_num_recs * RAS_TABLE_RECORD_SIZE;

