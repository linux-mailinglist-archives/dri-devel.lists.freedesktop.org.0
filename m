Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2F0AAE7DA
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 19:31:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ECED10E869;
	Wed,  7 May 2025 17:31:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SIRMPJvo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2087.outbound.protection.outlook.com [40.107.243.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E0410E869
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 17:31:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f9c2fr8R6ujd1UFkSv5pcHsYkJHZE3gCeNufJHyn9ggpYWWEfIUgeXuDKnJ57WC3GcQXUAjNumqBnxWXt5STA5qF/FjnD558iQ+yIZazCrBwdYrgMyvD+mVC3mkS7fuHGxC1aQy00FSFXG9i+lVUo+Fy5LVD75yGRGbmIAiKMWLkxJuW97l6sAl2WLOy6u5G+Esfo4cp8K3ByaqV7dcBXYgQKvs3eza6Hg7mYc30+tU4zPK0KlLOed20qqjoPoaXU8xJI6FFI8I53YyS+R6HMm8yR/udnGwe4oLzcSDrg5zL2+Na4FVgJ7oanAlfUe7nJATa+V3rFauGqQVQGO2tHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pRs26b5E6Cprvwfo9X6jOpSqOY2M1mtpYVVuwZBCGyc=;
 b=pC4O1uCSsH6PJHqirl5bqjSOGxabCYGiJrXgoeFuNMr3QiIWElYmxw+y+VeW1nm8Fzo4s2GeHH13MtQoV1Ql+SsBtfANRVuIQ7KZPpf0wdhnktZWM0SG5jZPly6fbusP76c55u33SN0pvQsPMn3HHBSP5I+/d+K4NBMohy13JjJMI9/FWSJdky182bs3CIq9ZTaB8bCx83/HtlBMWtHJ0s3UWokhos8UW9VFZvJe5M9YaCZWaQ/0xPvtAzb9XFo8fA+5OSK+hmLBdMl7SL4BDX1TjGyjx1X/PLqlOg/fBVSMf8kkUiox9nOgjOoir93J1dP87pxzlRSVD1pf0Xufgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pRs26b5E6Cprvwfo9X6jOpSqOY2M1mtpYVVuwZBCGyc=;
 b=SIRMPJvoH3N6cdeeuhgNwUOYzFHfRlkowPEMiLu7XKOpGD2jwlEsBtEO9qVQyPztY2nUTDB+gqj61+f0scR+pwYhtETjgFIdidKX5+d5E0fgWqpr69j6S1ASN7vlXpa0i3ZGXFiMMyQMWcVTeJOk7862ojuVx97N5dtXi80Tcm8=
Received: from CY5PR14CA0021.namprd14.prod.outlook.com (2603:10b6:930:2::28)
 by DM6PR12MB4385.namprd12.prod.outlook.com (2603:10b6:5:2a6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 17:31:28 +0000
Received: from CY4PEPF0000FCC2.namprd03.prod.outlook.com
 (2603:10b6:930:2:cafe::5f) by CY5PR14CA0021.outlook.office365.com
 (2603:10b6:930:2::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.30 via Frontend Transport; Wed,
 7 May 2025 17:31:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC2.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Wed, 7 May 2025 17:31:27 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 7 May
 2025 12:31:26 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 7 May 2025 12:31:25 -0500
Message-ID: <670ccea1-5315-bbe5-995f-10aefabf9c28@amd.com>
Date: Wed, 7 May 2025 10:31:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1] accel/amdxdna: Support submit commands without
 arguments
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>
References: <20250507161500.2339701-1-lizhi.hou@amd.com>
 <4534597b-70a0-4c6b-9ff5-950e69ca7b37@amd.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <4534597b-70a0-4c6b-9ff5-950e69ca7b37@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC2:EE_|DM6PR12MB4385:EE_
X-MS-Office365-Filtering-Correlation-Id: 12255bc0-3927-4aed-5311-08dd8d8cff78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dGs0cmtOMVJ6QzRDSE9Ib2hwci9aK2tySzl5OURmMDV0VGYvSFpZRXZ5WVhT?=
 =?utf-8?B?Zm5uM1ljR1grVlMxb2FDQ2VpeFdUQU5hY1lWSCszSk5yZkx1eExLTzBrTUwr?=
 =?utf-8?B?RFlWQnZYSXNRaGhkM0k5QTkxQXMvOUI0U25yY3JTNm53dGRiMHhXSStrYVcr?=
 =?utf-8?B?YVhhaTA4QlBWVGp2a0s5TFprMXdya3Q2QUZPQ08yVlJ2V3dYWHk5bExmdUVM?=
 =?utf-8?B?U1BVbHVqTkk4YVhhYlZEeGxqdTJPREJpK2FyTVdHdjREM1ZBMGNJZEZSam9T?=
 =?utf-8?B?VUo5UllRbUtiY2haUDlPaDB2WnRHRWU0NS9qTE1NTHpuL2dIakRIUGp0VHlh?=
 =?utf-8?B?azJ4SlZXd01obEtZMkF1eVE4SkxPWS9OV2NZN2RhSmoxM0FmdTVPNElESFVS?=
 =?utf-8?B?Sk1IeHgzQ0tJNlNkSzEwSEV3Z3JEWVhLd2JHTUU4MEVpaTQ0eXh1QVBqbHJD?=
 =?utf-8?B?blVKOFBhcFpwZ2RURWV6RXpQODl1YURDdXJSOUtHSzRTcW1vcWt5NEhYK0RM?=
 =?utf-8?B?dzhrek1JRklaY1ZvcHZwOGl5Y2dmdXFiUHY3OWZOV054NGU4Rnd6V245ZzVn?=
 =?utf-8?B?VlJVR2FHeXlybnFucG01eWd5UHRHcDUvTUEvNDNtTUROMmc4U2VEWjViMVFo?=
 =?utf-8?B?eGRXeXoweUVXQXpwekdNME9OMUJjQ2Z5L2hITFJkbDcrTW9DeVdaUUFvTU5E?=
 =?utf-8?B?OVR1TjdlWmJIbWplbTFLdkRCQlQxS3FvTlZ3eFR5NFdjMjNGRmUrS2M1a3RZ?=
 =?utf-8?B?eEJGZXFXY1p1NW9JWjA0dUdvMU1CRFdWeTVlL3NPQ1hReVJhNU9TQlhkV1I0?=
 =?utf-8?B?Q1RQWUtHS1Bqd08xSmpmdFVmZWhWdFpmU3NQYWZaTm54RWtsY1g1L0swVHNQ?=
 =?utf-8?B?RjlibTV0bFRaZXdRSlNCbW5vTVBqWVpoUkRvazBFKzduTlFLK012OGZSTkJs?=
 =?utf-8?B?ZUpXU1pxODVxY2VDZXo1SnRZSVRnY0c3dU5lUUFlS2ZvVlRUQ2RtNXpXTUJm?=
 =?utf-8?B?YjZWclUreGtEMmNYZllQMG85YTZLMUdsbm92RTlDa0hTK1JIM3ptc0ZlTHhN?=
 =?utf-8?B?RGZjK1UwNEZ0aDk4aWY5emh4S3duYXpVc3V5N2cxT1dxNWY1M09XYk1BWlZi?=
 =?utf-8?B?QkRsaVlrZ1VLaVBXTUZVdklQVU9tcE9WR2xCRDRTNGFlRDZyUXBBV1hLWlcr?=
 =?utf-8?B?Yi9xeFFRNzZsV0tWZHBxS3BQMlJGazJOK0FJQXlNdUQ0QmVSN2VaYWZvb3pI?=
 =?utf-8?B?VFpKMEo3RUhhcCtQcDlhUzh6dGh0b2pkcUExWGxkeE9rK3d6ci9SMlZkY29I?=
 =?utf-8?B?RHkxdERWK0FGY1NYbmxCTXRmZVlCK3NPanpGRFJiTmtEOWdobzFGN29OaUxS?=
 =?utf-8?B?cWhvaEFKd2RwTi9oZFA5Zy9EUWRTZzlzd0NrVFdITDVPSG9wUGptakdidTRR?=
 =?utf-8?B?bkFUMkd1blhlVlI3Tkd2dWljU2l3bVZEb0x0bGcwaUVvQXYyYkZlcGhZMGYw?=
 =?utf-8?B?K1FOay9ITi9SM3Foc1VMRGJNc3Z0QTdrbXhwNkh3TlpDQXFXc2pkMFlNWk1B?=
 =?utf-8?B?Wk1BTHA0OWNsdUZsNHR5NHkraHlmV3BIclpIdGR3MlZUdDhjeDVIWEZYT29E?=
 =?utf-8?B?VkRLd2FJMFMwSEN6SjdTK3l3VkZQbHA5eUh4N0FOUFZvYjNJcUMxYk53aUpO?=
 =?utf-8?B?NGkwVGRRMjVhTElPeDRkT1R0RWdRalhna1BjQ0Q5NHNoanl4dFNXTnNIaEYv?=
 =?utf-8?B?Tjg3djg4a1BVYWZ2QmNSdWdwSXRzWkZGSFZzbk81RlJ6NFhsSFA1Wis1M1RB?=
 =?utf-8?B?dTZzVkdRTkZNTUpkYU9PTHU1TzRQVTB3eGsvKzNFSElDdi9lNTlxRlRBOWZE?=
 =?utf-8?B?azl1K2plamhGNnVZc0xSaWx2aFVuQmZoOHhnakVYN2s0UkxwVCtla3BXRXpQ?=
 =?utf-8?B?dGdwQ0FKRlVkZFozSWNaZy95bFA2Q1BMdm9GTWpSV2xwYlVZd256d3Q3cTJR?=
 =?utf-8?B?WDF1Q29ZZ3RVR29VUlJibitSM1pQOURDMnZVSXplczdQU2pLR2FGZktzcHVL?=
 =?utf-8?Q?nZnNEY?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 17:31:27.6047 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12255bc0-3927-4aed-5311-08dd8d8cff78
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4385
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


On 5/7/25 09:29, Mario Limonciello wrote:
> On 5/7/2025 11:15 AM, Lizhi Hou wrote:
>> The latest userspace runtime allows generating commands which do not
>> have any argument. Remove the corresponding check in driver IOCTL to
>> enable this use case.
>>
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>
> Can the userspace handle discovery of the difference?  Or does this 
> need any sort of ABI discovery command introduced too?
>
> The code change itself below looks good to me though.

Runtime will capture and handle the error with current driver.

Even if runtime have a way to explicitly discovery the different, it 
will just report an error and fail the case.


Thanks,

Lizhi

>
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>
>> ---
>>   drivers/accel/amdxdna/amdxdna_ctx.c | 22 ++++++++++++----------
>>   1 file changed, 12 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c 
>> b/drivers/accel/amdxdna/amdxdna_ctx.c
>> index 43442b9e273b..be073224bd69 100644
>> --- a/drivers/accel/amdxdna/amdxdna_ctx.c
>> +++ b/drivers/accel/amdxdna/amdxdna_ctx.c
>> @@ -496,11 +496,11 @@ static int amdxdna_drm_submit_execbuf(struct 
>> amdxdna_client *client,
>>                         struct amdxdna_drm_exec_cmd *args)
>>   {
>>       struct amdxdna_dev *xdna = client->xdna;
>> -    u32 *arg_bo_hdls;
>> +    u32 *arg_bo_hdls = NULL;
>>       u32 cmd_bo_hdl;
>>       int ret;
>>   -    if (!args->arg_count || args->arg_count > MAX_ARG_COUNT) {
>> +    if (args->arg_count > MAX_ARG_COUNT) {
>>           XDNA_ERR(xdna, "Invalid arg bo count %d", args->arg_count);
>>           return -EINVAL;
>>       }
>> @@ -512,14 +512,16 @@ static int amdxdna_drm_submit_execbuf(struct 
>> amdxdna_client *client,
>>       }
>>         cmd_bo_hdl = (u32)args->cmd_handles;
>> -    arg_bo_hdls = kcalloc(args->arg_count, sizeof(u32), GFP_KERNEL);
>> -    if (!arg_bo_hdls)
>> -        return -ENOMEM;
>> -    ret = copy_from_user(arg_bo_hdls, u64_to_user_ptr(args->args),
>> -                 args->arg_count * sizeof(u32));
>> -    if (ret) {
>> -        ret = -EFAULT;
>> -        goto free_cmd_bo_hdls;
>> +    if (args->arg_count) {
>> +        arg_bo_hdls = kcalloc(args->arg_count, sizeof(u32), 
>> GFP_KERNEL);
>> +        if (!arg_bo_hdls)
>> +            return -ENOMEM;
>> +        ret = copy_from_user(arg_bo_hdls, u64_to_user_ptr(args->args),
>> +                     args->arg_count * sizeof(u32));
>> +        if (ret) {
>> +            ret = -EFAULT;
>> +            goto free_cmd_bo_hdls;
>> +        }
>>       }
>>         ret = amdxdna_cmd_submit(client, cmd_bo_hdl, arg_bo_hdls,
>
