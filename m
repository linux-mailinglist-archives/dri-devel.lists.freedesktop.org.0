Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86346B49B46
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 22:56:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED63510E179;
	Mon,  8 Sep 2025 20:56:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rW1t4T7I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2051.outbound.protection.outlook.com [40.107.237.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A45410E179
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 20:56:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xhIID6B7hQzYa6fr8QLtXhqUQQjj0ZS6Gs0fjibXw0ixdE/un/pmg/sfyBeiTymshU2huGDkNEfO1jxdo/ncCr6ETa9H9BKMQF8kNPKPjttlm5lFaoC3S5nvIbPBlWbusFcSNmJxNA6rI5Sk7uCsRZoRlt+VJGH0F9U2CMovr1cQsPVLpIwFmNbfdz63Mdytcbdm7vxIAeX2Q7ETLykOw451ZnlsB/t76u5USTBqwXZ1qx5XHM1ZDpogjsf2K8Sa/ikRLVaHt+pql9d4z7KCvSfBao7o3D0Uyz6OM6RWuEaM2x0beWINm3D5QZh56zlvuBpr+BTd8Fv1yuQKWP7Q1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xbTu+oQ6ZIvksXI4m8nQTW7j+Hg28IlVr/G6wp6hp+8=;
 b=yZW+ZqtVTW+nD2H19yuYm7Mc2sMHCaOTeVABpmFIM/yq7DDUwsX7Cd+R8XdOrYZ6qvzX2Clb1VYUgs3FGk20BFyAbMUTOeBo5S6vCosfoTU94r/pmd3aWzPq3qomTgZCki1jiK2jwe5xwO8q4TOSPFlOGA5aTmr0LBAA5T2VzrN8B/RrcAlsXJN6R3iOMB3Bd7npqxtv5tHuvHPriQZSN3tXP5IC1wu5XF83tctEHlcEKIvuK13UpAm9fO0QNx1GhE5GT7Oz+zC62X+3P6OdOGHYI6QVZYPoRBoMNQvlclnfITJko9T55PBYJIK3o1iqkuYRMEeGQ81gsUvmgZ/Ipw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xbTu+oQ6ZIvksXI4m8nQTW7j+Hg28IlVr/G6wp6hp+8=;
 b=rW1t4T7IWo84XU+eVNFGbgCO9flyK1Oe8YaGLtGhCN+S7nOOCHHWYEgyVY2aXOsP6klItPBXKhQ4RyAP7Ep/flL55yxYxPslEmhHKfOyZ7zVriVvdXcfUr3XoMWVjd0d2pt+Y6prVCMxh+cpZgCI4S/+CAvA/hw3pEsIsftwOAU=
Received: from BL1PR13CA0158.namprd13.prod.outlook.com (2603:10b6:208:2bd::13)
 by IA0PR12MB7749.namprd12.prod.outlook.com (2603:10b6:208:432::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 8 Sep
 2025 20:56:21 +0000
Received: from BN1PEPF00004683.namprd03.prod.outlook.com
 (2603:10b6:208:2bd:cafe::8e) by BL1PR13CA0158.outlook.office365.com
 (2603:10b6:208:2bd::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.15 via Frontend Transport; Mon,
 8 Sep 2025 20:56:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00004683.mail.protection.outlook.com (10.167.243.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Mon, 8 Sep 2025 20:56:19 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 8 Sep
 2025 13:56:19 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 8 Sep
 2025 13:56:18 -0700
Received: from [172.19.71.207] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 8 Sep 2025 13:56:18 -0700
Message-ID: <3f88c63c-f810-e2fa-2517-66fe358a3411@amd.com>
Date: Mon, 8 Sep 2025 13:56:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [bug report] accel/amdxdna: Add ioctl DRM_IOCTL_AMDXDNA_GET_ARRAY
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: <dri-devel@lists.freedesktop.org>
References: <aL56ZCLyl3tLQM1e@stanley.mountain>
 <3a4cf9a7-d2ec-2c4d-fb9b-5beac251e86f@amd.com>
 <aL845xEFWNzq4_2A@stanley.mountain>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <aL845xEFWNzq4_2A@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004683:EE_|IA0PR12MB7749:EE_
X-MS-Office365-Filtering-Correlation-Id: 29b8776c-1cd7-4170-bc5b-08ddef1a2914
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q3NPdjh4Z3k1NFhEckRIUTlSb0NjSlprKzM0VHpUMW9qM3NQdk9adllrMXpD?=
 =?utf-8?B?Rjc0akg4dFkrWVJkQmxqODhVSGVkVjFHTDI4VkllS2Q1d1VIM05mYkcwUnJZ?=
 =?utf-8?B?b0c3eXZCRFI4TkFYQjA1THJ3MmQrRVI5N1FKSGMyVDFQKzN3eklpRU1hb1hO?=
 =?utf-8?B?N1NzR3R5eU94RmlsTnFKKytZTzBOWFNQQ1l0RzRUS0dGTmhKY21sTEczZXp3?=
 =?utf-8?B?eDhFZlJTZm9GTjY0ZHMrdnVuaXZSV0x3WWx5M0xvUmg5Yy9BSFltMlowRGFW?=
 =?utf-8?B?THVxUlIrV1NYMUtOKytzYnppSkRVZWtlVXdnN25YVzhTc2VzRXhUdEtQbVht?=
 =?utf-8?B?bzU4YlZLMkFNbTJ3dWZlL09ET1ljQTM3aU14T1BnVzlSSnk4d2h2RGVxRlBR?=
 =?utf-8?B?QzdJSXFxM3JlOVRKT3ZyRnUzSSsyeVdNM2U4aWx2d0YraGZpM09FZUpCYXZl?=
 =?utf-8?B?cmc0OHlWMkxjTHltVk11T0pIeGU3QjV5cmZPODBJM203dXhPWm5UZ2NnakE2?=
 =?utf-8?B?Y0ZJL25xeFJQR0RLbUQzKzRYOXJ4NFBXcXBkQ0lteFdSYVdHYnVuRWczTlRm?=
 =?utf-8?B?R0NOQjY4UmFRcWk3cE1jN3hKbU9vWG5GRkw3V2dVYk52Yng3V2hSTTgzQ2Rl?=
 =?utf-8?B?aFdFZU9MbHFKWWdMN2VzbW15ajM5U1NzUFNxQTVNV3lKNFA3SUpEeVE4MjN5?=
 =?utf-8?B?VEh2V29WeDlNbDJnNGRtb3BKMWNLdVVMNVBKWXdsZG9NdjNqN29wUG5PSWhm?=
 =?utf-8?B?SGlmMEM5VnMyeVVZWFhRSXMzRmZLWGREcHloTEFsK1F5cTZzOVBCdkpZN0xn?=
 =?utf-8?B?Mjc1YkUrdXNydG9kMlpUM1ZqVkNwT3FMcDdPMGoza3NDUlhJU1MyQWVGZ0xk?=
 =?utf-8?B?NkRGWlM0S0dhampqeGRSTTZBYVF5THp5VXM1Si8rTmdMQlRNOXJEK0xsWHFL?=
 =?utf-8?B?SXRaaVJMWUI4d1hrUU83OE9Kc0o4cmpSZURmcnhlTHlJZXE2VlFaaVBTcUVw?=
 =?utf-8?B?K1AxVy9JMjQzdFhmemJidGx5WGZiU2Mxb2tPaUxwdHlFVEs4WEc1VjFVU25i?=
 =?utf-8?B?c0tYWitpNGgyL29SdHRsK3VCbDVYVFM1RGNRM21Vc0RzZUJBU3Z3K2U1dVlO?=
 =?utf-8?B?QmlDUXBXLzRkMllWKzhDYWpJV2tmTVpHM0ltMFdPUVhpOGRKWitORDU2L1ZL?=
 =?utf-8?B?ZHpVL3B2R1AwbWxRdi9vRFJqMEl3QTZGdEw0MlVheDJjbGQ1OGJjSXN6VnBD?=
 =?utf-8?B?eWMrUUowaWZETEZSc1lFN2o1THJkc2ZseWJoYzVYR2RBNEVtZktsUzQ1MGRD?=
 =?utf-8?B?YnNBVWJIYkxpVG9abTk2bEhWNVh1ME5JRXZrSlFpUkZlNnlUNm1TeTF1THhN?=
 =?utf-8?B?Q2ZCL2dNZDY0NDZjTWFBMFhyMHg1OWIxcE1DWEVseGFnTWxaMVFTZUdyS0U4?=
 =?utf-8?B?NURaMVowMGMyOG9mTVE5elpIMEl2a2RMY1FTVlBFd0t6T2xxQ2F6U1lQWTRh?=
 =?utf-8?B?WGREaXFMT2FXYkNRQ2phVmVxblMxRnFFVmI4amRQdzA4YzcrVWhJZ0ZCRVhS?=
 =?utf-8?B?c2k3UHlqNGtScit3bUpwMGtXRzZ1ZHdsWTlnQnJoV1VWN2p0SndVMjAzb3Zp?=
 =?utf-8?B?L01PSFpxTThjcnloS1VsTW5WYnExKzdybXdGcDdFOXN1N1cxckN2dldWSjVY?=
 =?utf-8?B?b1ExVXJKTTVLZzBsc3QxR0lJcWV2ZjJXUnA2N255Z0syVTJxN09QRlFWZGVt?=
 =?utf-8?B?NDcyalppMDVDeWZkYkZFY0Ria1NVQ0VsUzh5TC9xQUhoSWFXNnB0cDZsVDFu?=
 =?utf-8?B?YStKeURFQk03eXczUG1EcHBTMVA3R2JoRXpDNjhuK2dpK2xvQnU1VHJQTWx1?=
 =?utf-8?B?aUxET1V2Q1hWakIrU2dqcFh2ZHZOdURyN1dkekZ4c3RVeDl6TmQvK05YbHo0?=
 =?utf-8?B?VitORnlZVVJkWUhreWsvSk93Mi92QTZhSTZoOUdFNlVGd1lXcU05VGtNWnR5?=
 =?utf-8?B?OTUrcVRxRzRnZXRQRnB5VWlCczJoUE9CVkF2U1M3b0xYQ2ExQTVwSmIzK05z?=
 =?utf-8?Q?f3a5yK?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 20:56:19.3465 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29b8776c-1cd7-4170-bc5b-08ddef1a2914
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004683.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7749
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


On 9/8/25 13:13, Dan Carpenter wrote:
> On Mon, Sep 08, 2025 at 11:19:33AM -0700, Lizhi Hou wrote:
>> On 9/7/25 23:40, Dan Carpenter wrote:
>>> Hello Lizhi Hou,
>>>
>>> Commit 2f509fe6a42c ("accel/amdxdna: Add ioctl
>>> DRM_IOCTL_AMDXDNA_GET_ARRAY") from Sep 2, 2025 (linux-next), leads to
>>> the following (UNPUBLISHED) Smatch static checker warning:
>>>
>>> 	drivers/accel/amdxdna/aie2_pci.c:904 aie2_query_ctx_status_array()
>>> 	warn: potential user controlled sizeof overflow
>>> 	'args->num_element * args->element_size' '1-u32max(user) * 1-u32max(user)'
>>>
>>> drivers/accel/amdxdna/aie2_pci.c
>>>       891 static int aie2_query_ctx_status_array(struct amdxdna_client *client,
>>>       892                                        struct amdxdna_drm_get_array *args)
>>>       893 {
>>>       894         struct amdxdna_drm_get_array array_args;
>>>       895         struct amdxdna_dev *xdna = client->xdna;
>>>       896         struct amdxdna_client *tmp_client;
>>>       897         int ret;
>>>       898
>>>       899         drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
>>>       900
>>>       901         array_args.element_size = min(args->element_size,
>>>       902                                       sizeof(struct amdxdna_drm_hwctx_entry));
>>>
>>> Instead of min() here we should just return -EINVAL if they are !=.
>> The request element_size from runtime tools can be smaller or bigger than
>> sizeof(struct amdxdna_drm_hwctx_entry).
>>
>> If element_size is smaller, element_size bytes will be copied to user space.
>>
>> If it is bigger, sizeof(struct amdxdna_drm_hwctx_entry) bytes will be
>> copied.
>>
>> And the actual element size and number of element will be returned to
>> userspace.
>>
> This is a new API.  We should be strict about what kind of inputs we
> allow so that if we want to in the future we can change it without
> breaking things.
>
> Supplying a larger value is not useful at all.  We should return -EINVAL
> for that.
>
> I'm guessing userspace already takes advantage of passing a smaller
> value but it's not documented why this is required.  My guess is that
> maybe at times at times we just want the ->context_id or something?
> Maybe the first three members of the struct?

This ioctl is to show hwctx information by user space tools. It happens 
multiple times that more information needs to be shown by adding new 
field to the end of this structure. So the protocol is as below.

     Assumptions:

          sizeof structure v1 < sizeof structure v2

          Tool v1 and driver v1 are compiled with structure v1

          Tool v2 and driver v2 are compiled with structure v2

     1) Tool v2 can run with driver v1 (request element_size > structure 
size), the new added data field in structure v2 will not be shown in 
this case. The tool v2 would not force user to upgrade driver  in this case.

     2) Tool v1 can run with driver v2 (request element_size < structure 
size).


Thanks,

Lizhi

>
>>>
>>>       903         array_args.buffer = args->buffer;
>>> --> 904         array_args.num_element = args->num_element * args->element_size /
>>>                                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>> These are both u32 values controlled by the user so this is an integer
>>> overflow bug.  Security bug.
>> This will not cause an issue. array_args.num_element is considered as user
>> control as well.
> That's true.
>
>> If it is too big, the actual number of active hwctx will be returned.
>>
>> It is better to put a reasonable limitation. I would add a check
>> (args->num_element < 1K && args->element_size < 4K). Will this fix the
>> smatch warning?
>>
> Yes.  Anything which prevents an integer oveflow is sufficient.  Thanks!
>
> regards,
> dan carpenter
>
