Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFF694ADA0
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 18:08:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F9310E15F;
	Wed,  7 Aug 2024 16:08:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EaZPsiRF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2051.outbound.protection.outlook.com [40.107.236.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A14A10E15F
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2024 16:08:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CHEO7ydXHJIW3j8fwkyylBxnit6r72rYxV9mAh2TQ7Du8BkHYe2rjYfuiY2YfHg1yEFM9zfX5aO1HRwN/oQ+umv3hIb3quKDQkOR6Nrgjf21UJ1C54qKElJxVOCVVM4Ue3tO8RLgawo3NAMDS6Sxqn6kO8UbDflZivN/ymOz9HGjDlJO+69Muh+bDGctxxBfCq1qKMtEoMb5EeHSBj3uBUniOxItB6VcefQLEGapq1j5CX0jfjodmWwjossizIh1vNhQVM6VFZ0wvUMIywIapJDFYsC368q352r3YrrLQ09FTLGYtQ5zGpxQoUobe4CtFLt6x9Wu2KWgfVXVAF/5Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cPVvIaU6lqkOMFkIhQExTNmaOaL50UXPYSr/BeCga8E=;
 b=TAStNyp0cbpgkvJvkAAzBWk3hIpPSfCao63p+P0JC3WcMUmbsReaCjOa9YKT1NufTdJPsIS2qCqYiDDzk+8xa2q6UBS+WaxAt89PKIFyE/5FkBB4FK/OPGK/AtKyv3XHa42PJ8i0epWqsZW1dV/7StWnP5EbrqS5atPzO5eJyOx8QUjcp//RH6YamSR3Md//zZT1624EH23+SNYNhANNcYzXuGqJwqaoS5rrJAs4Jhd7QJbALerZJ7I5z/RDK4mRqmfDEcaTcyWn9P58TFlHE5UgAIpi/wR3nXVfiPWdZ2DLsrS4eRyuKQNUo0701lQjvOAPwknoBWPE3maUq6qYUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=web.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cPVvIaU6lqkOMFkIhQExTNmaOaL50UXPYSr/BeCga8E=;
 b=EaZPsiRFAcfBbfYhTIU8+8sbSpgm/NGtvoANBITGROpZvztb+MJZPeJvJlKwIdpvqH4j8wWMJP/V56GE+tWHfwbK6F4jHc1Rm6qLkp3hIvmEL8wpkeEwQuWWBC21xQj+njegncBGhYFNKz0jhOTpufle5IpUaTgvLwCNltgbyHs=
Received: from CH2PR05CA0047.namprd05.prod.outlook.com (2603:10b6:610:38::24)
 by BY5PR12MB4050.namprd12.prod.outlook.com (2603:10b6:a03:207::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.13; Wed, 7 Aug
 2024 16:07:59 +0000
Received: from DS3PEPF000099D8.namprd04.prod.outlook.com
 (2603:10b6:610:38:cafe::ef) by CH2PR05CA0047.outlook.office365.com
 (2603:10b6:610:38::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.11 via Frontend
 Transport; Wed, 7 Aug 2024 16:07:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D8.mail.protection.outlook.com (10.167.17.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Wed, 7 Aug 2024 16:07:58 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 7 Aug
 2024 11:07:52 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 7 Aug
 2024 11:07:52 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 7 Aug 2024 11:07:51 -0500
Message-ID: <fc3fcd69-8d6e-4758-4e0b-16a52b764680@amd.com>
Date: Wed, 7 Aug 2024 09:07:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V2 01/10] accel/amdxdna: Add a new driver for AMD AI Engine
Content-Language: en-US
To: Markus Elfring <Markus.Elfring@web.de>, <dri-devel@lists.freedesktop.org>, 
 Oded Gabbay <ogabbay@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, George Yang <George.Yang@amd.com>,
 <king.tam@amd.com>, Max Zhen <max.zhen@amd.com>, Min Ma <min.ma@amd.com>,
 Narendra Gutta <VenkataNarendraKumar.Gutta@amd.com>, Sonal Santan
 <sonal.santan@amd.com>
References: <20240805173959.3181199-2-lizhi.hou@amd.com>
 <d7b4ea8a-74c5-40db-bf11-f8345f570ef5@web.de>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <d7b4ea8a-74c5-40db-bf11-f8345f570ef5@web.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D8:EE_|BY5PR12MB4050:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a72ef82-6918-4b73-7256-08dcb6fb1b47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UVE5bnpLekllZjlTL1hzVnlZUVo3N1JxcE9mUVNCYVhVMHNRVnZBUHdHbFEr?=
 =?utf-8?B?L3AzdnB4NUZON3QrM3RhT3M4M3F6Z1U5VGh6NWtUN0NRRkIxYXV1b3lvNzVr?=
 =?utf-8?B?eWlWcWZ4T3hnVDVDQUF2U3pCTWtnc0lRQ2R2MDF1M2R5WGpvQ2NhaHVMMnVj?=
 =?utf-8?B?TnpORGlpblkwaVpDS1daMVZXQjlrQUJVcWJLWDE2MEtWeDM0MThxSmQ2SnRa?=
 =?utf-8?B?RlpnRjZXVkZoRTlhbGdmQmIvb2M3czE5WGk0d1hlOU1EekFTb3R4dEVhbDFh?=
 =?utf-8?B?RTdYcVdScmtTUEhkY250cVJwa2VmYVhxWEIyTGYxR21uOFZaVkVGTDRaR1dT?=
 =?utf-8?B?Z0p5T3NyM2dqYURlT0ZsMHl5d054L2ZKYjBBN1VIV3kvMkZ4NUd1RlNRdjVy?=
 =?utf-8?B?NW8vVXdQb3lDWGtsdXEvU3dUeVpyZmczWFJXeXJqcS8zcWdkd2lxS2oveG43?=
 =?utf-8?B?Vm1ZRHFxMlZyR200dk9FVEZ6TmtRZ0pJa1V2dkU2Z3ZBWjdDV3hqdmN1bVBL?=
 =?utf-8?B?amhKSHlZTTRZdDRaWFpmTFREd3hWaGdRajl6bzN1SStFRU5ENHRBNEIxclhq?=
 =?utf-8?B?VTVodFpGMWo3aVdHb2pOUnRscHdJZTdybE40V2xCVU1yMVBrMk9pWW4xYnIy?=
 =?utf-8?B?aU9VTUNOZXBEdjRCREdiTnVnSVJTWSs5QWxvVzc0QVpCdzBxQ0c3dEdEeWZC?=
 =?utf-8?B?a0dkUUlnSzRKUFYyMHRJWEwrR3BMUnFXbUpoZHArVWJJL2orSUlBS0ZETndZ?=
 =?utf-8?B?dzZ1UWlzNWtRNXVYVHRxQVczblJDRzlBTEpLdTEySFFHNWU4R2hVT1lNTkZ5?=
 =?utf-8?B?cVlMNXd4VVZ2YVRqMldEQlRlZHNlNnFBeXFPV3ZEdURmKzFud1FzM09LRU0w?=
 =?utf-8?B?UVpJZjlWM0k4b3ZPbFM4a0VXYkhMditHaTZ1dFp5Z0Z4Rk5TN0hHQ1lCUlQ3?=
 =?utf-8?B?SW1XZkdMK1RiWEhJbHlxK05JZ1RxbmhsbWFXZ1gyWHVEV2ZoOVg2UC8wR21m?=
 =?utf-8?B?a3UrMTdyWWZLYmdDcm1ubjZWR2ZsSkh2N3FnQmlzQWJDcWlncFgyODBnQ2VZ?=
 =?utf-8?B?QnlFVEQweDhSSitaQ0NqblZ1VTVSZCtUeHpVb3Q4Z1cyRzZvczI4UkZVM2dY?=
 =?utf-8?B?SytsdUZwN3lqaHB1czd2TThUd0RHbW9uZ2JvQ3k3TGhmMGFaOTZWRGYxcWg5?=
 =?utf-8?B?bC9FSjR1bXNrTy9mUHJDeVlZek9lVTJrR1cyRUw0WHc0a3Q5ajNZVG8vTDlm?=
 =?utf-8?B?TTk5V1ZsMENXa085b1Q4bks3aFBSQUFFeFA2ZythVUd4SUd1WU5VSG9vdGVS?=
 =?utf-8?B?cmp1UTJpL2NjK3IyTS94TFRSWE9aVXNWaFVPWk1UMHZTdHBjMnNjakZJY2dq?=
 =?utf-8?B?NWFvejYwMEhFdTdUdERCSVEwVGN4ZGNmWFNLVjI0NDNpaEl5cGVYU3JobE5E?=
 =?utf-8?B?TUVKQmMwdDlmLy9VbVV1NXRaWTB2MUpkZi9EN2JlQnNmUnFHSzB3bUxNSGJw?=
 =?utf-8?B?REJVUGsraitGeXhKRDdENktFODExYzladFdGTW1tSHJsWG03MGJDVUtXamZj?=
 =?utf-8?B?TFgwalFEMFRXVGQ2dnByYmxnNiswMWZIekJDT1d5OEJFekUzUGxwK2cvQVBP?=
 =?utf-8?B?Rk5nWWxBMWVpRHc4alU5SHJKNk1hMmFtTTlqVnp1YzhTVUxBeFQ5WkVXZGVD?=
 =?utf-8?B?MHh3MEptL1RITjRnNU5TSUJ4bHNqUXFwTXUvQjBSRzZ5RmYwRFlQVGVUSFBE?=
 =?utf-8?B?NEREYVAwTWtlOWNaQ3BWWHZZaXNQY25aS1NEdGE5ZXBIRy9BSUV5KzNGcWxs?=
 =?utf-8?B?dklXenZoTFk4Z1JBcFhvMVlwMm1UbVZrMWdNaGNZVHRBSzhUTUNobG1rWVBv?=
 =?utf-8?B?RXQrcithL21GWW1BbHNMcDVsQmdPQjRuVitGcXdCRGhHcVE9PQ==?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 16:07:58.9544 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a72ef82-6918-4b73-7256-08dcb6fb1b47
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4050
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


On 8/7/24 04:06, Markus Elfring wrote:
> If you temporarily find the circumstances too challenging for applications
> of scope-based resource management, I suggest to use the following statements instead
> (so that a bit of redundant code can be avoided).
>
>
>
> …
>> +++ b/drivers/accel/amdxdna/aie2_pci.c
>> @@ -0,0 +1,182 @@
> …
>> +static int aie2_init(struct amdxdna_dev *xdna)
>> +{
> …
>> +	release_firmware(fw);
>> +	return 0;
> 	ret = 0;
> 	goto release_fw;

I believe compiler will do the optimization. And I prefer current code 
which only error branch jumps to the corresponding cleanup.


Thanks,

Lizhi

>
> …
>> +release_fw:
>> +	release_firmware(fw);
>> +
>> +	return ret;
>> +}
> …
>
>
> Otherwise (in case further collateral evolution will become more desirable):
> …
>> +static int aie2_init(struct amdxdna_dev *xdna)
>> +{
> …
>> +	const struct firmware *fw;
> I propose to take another software design option better into account.
>
> * You may reduce the scope of such a local variable.
>
> * How do you think about to use the attribute “__free(firmware)”?
>    https://elixir.bootlin.com/linux/v6.11-rc2/source/include/linux/firmware.h#L214
>
> …
>> +	ret = request_firmware(&fw, ndev->priv->fw_path, &pdev->dev);
> …
>
>
> Regards,
> Markus
