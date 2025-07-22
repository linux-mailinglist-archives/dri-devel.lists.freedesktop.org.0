Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D0DB0E23E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 18:57:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D5B210E315;
	Tue, 22 Jul 2025 16:57:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Frj7mroh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2040.outbound.protection.outlook.com [40.107.102.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB4E810E315
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 16:57:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EJZU2azgnIBSW7Aa+NdXcjEQEN0494RWmQ7A+QMUI1X43YkkxAVwtvyva89HsYjJtdGr8gxt5Km8E6zuapjRdmZFni7vKNVJVGZ7NqTp2FAtOev9MWIUtOGjPmO25eQa6iQpTiyhnFqJ6EeGYwoVib2T9DshyujEDLZlP96v23oSbJtujOkIgU1JU9iyxt/b5nsOv0kkecGwsMSZuBxRxt/yxE9u9tyyLRBDMAhT4WhGFcWxcLuTFV7JyOkUrwweEsEu7Vv1BUS0DqQDHJgBTcTVgm+/Wdq0L4FHwYZbSDsI3Xidqzt7lUC908ur5IByWlUaFac/NkgKFchsy/zY9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J0/TNEIpkWVwLVUQJzddTnQUnXOp1Mi0PmOnQicSBko=;
 b=tNse1FaGIoo5c4yKyBROKHdLUzfriWL2Q+JmeD0aohxx+0B3pHREwetCLNwVxDpQOHJObhjWkwckXFY47g0elVcXEVLQZwAr27hbeJycz0jlkIzjnavDNjTrzdsYzgzlauymSIrMq5xSan/E1YGR+L1h7uLGdKM3yxsRL1EjuOjYSV8AGsQDrS/W8seHIJyY//cpEMUccvjAPN/zXZnQs9X+7xRO383TGaSXJrA2SnIw1L5b7HiYBTHL7Y+zJVwHiKEpfP7ydZiJX118xmMCIeoaaF3ncEiw7mjpC1jFPoMhXUn/BdduNndnKiYBw3h2cpPhCIY9d0NfshwIv3q4aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0/TNEIpkWVwLVUQJzddTnQUnXOp1Mi0PmOnQicSBko=;
 b=Frj7mroh292p8tESrHWB7jOn06W+S++jC0iNmBf1C3m+L5HlC2njlkfFs/Db6DZvidzjLF/lMzbR6+fRBRwiDtFXzmJEBefikRsVRDvce+iJPJf8a75moDsgUMBumkfZhMLi5BmKZLAtPA9KrBDhQACtSqkzez0epyOnCaCJLh8=
Received: from BY3PR04CA0019.namprd04.prod.outlook.com (2603:10b6:a03:217::24)
 by PH7PR12MB9073.namprd12.prod.outlook.com (2603:10b6:510:2eb::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 16:57:11 +0000
Received: from MWH0EPF000A6730.namprd04.prod.outlook.com
 (2603:10b6:a03:217:cafe::a5) by BY3PR04CA0019.outlook.office365.com
 (2603:10b6:a03:217::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Tue,
 22 Jul 2025 16:57:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000A6730.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Tue, 22 Jul 2025 16:57:10 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Jul
 2025 11:57:09 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 22 Jul 2025 11:57:08 -0500
Message-ID: <04499dbd-1e91-1426-3739-72e220dd11e5@amd.com>
Date: Tue, 22 Jul 2025 09:57:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] accel/amdxdna: Delete pci_free_irq_vectors()
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, Salah Triki
 <salah.triki@gmail.com>, Min Ma <min.ma@amd.com>, Oded Gabbay
 <ogabbay@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <aHs8QAfUlFeNp7qL@pc>
 <fc12ee3d-1b76-43e1-98a6-b5b647fbb603@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <fc12ee3d-1b76-43e1-98a6-b5b647fbb603@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6730:EE_|PH7PR12MB9073:EE_
X-MS-Office365-Filtering-Correlation-Id: f1266b3d-c177-41b4-a784-08ddc940cc8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0hhZ3ZsRGQ3WGJjcThmNi9WZU01clhKTk14cFdpMDZXQ1ROYUJnRE5SUnpt?=
 =?utf-8?B?MHh4WlprYThpQmMwYXh1cXlpYlc1VWc2VXdqL2FuYnh0TVJ6QWp1WFN6dXRU?=
 =?utf-8?B?cjV6TU8xNFBuTHoreEtpcHdIOW4ycUZkbmJsdzdOSHh3S3hHUDc4VTFVTld5?=
 =?utf-8?B?MHRIbHVHUFFab3I5bytzdHo5WkZGaHMyYmlNZUwvWlUyUnFUQ1BCMVFPbG5H?=
 =?utf-8?B?RlV6NnlsbWRFRnJVWloyQTFyc29FbjF2VndRNHEyY2ZySFNWcmhxZnVUNFhx?=
 =?utf-8?B?SjNzVGZTdzJqSzRLRnBEK3NVUE5tTlV4NTlRZEZ4OURxK3c1YzAyM25kZXQw?=
 =?utf-8?B?MDR2eHZ2MGxUMnI1Tmk1bzgwckw3eEtWU3dYUFFUS3l1Vm11d3lDUTBGcXZX?=
 =?utf-8?B?RWFiMDZEZHYyZDV0NGZNbGU0TVphenZ1UEhTeHQ5MGs3ajNpNGl4cG9Zd3BB?=
 =?utf-8?B?dXJvL2k0Y0l1Z09zVm5UZXcrYWhsdEdNSUF2Y1loS2NXS21teW9FWEgxL21C?=
 =?utf-8?B?YVk1b1ptZ1JrMkwrTkZraE9PbnI0ejZsYStoRURDVDQxeHhyeXJvSTZhMUdV?=
 =?utf-8?B?RWJwRURpMHhXbVViWG9KbnVXOVhTdXNyUHBxOWhsc1hST3FSWjdkaWpwcHJw?=
 =?utf-8?B?VjVjNWx4QmhQRS9VdG01bVg0MEFXdU5VOEE1RjZDL0VsSlpZb1F3U3hXUXRE?=
 =?utf-8?B?OTR5R21IMUozUW1ndkhNRHI3aGpFeks0QjFuTW8ycFp6cXJFWjgybjkxeXdE?=
 =?utf-8?B?K0JiYWZXK0pkMWF5bGxJc1B5ZE9zb3Y5bUJYc2JYdnpWUGxIenpHTngxUjhE?=
 =?utf-8?B?WG00OHc0MUd0QmpDbk4wNUJ4TzJqdGozQU5Ob0xNTFJBSHNmeGR6OCtkRjhQ?=
 =?utf-8?B?MDFGVFFONm5lN1UyOWlqM2xhYm1qdDYvSkZ6U3dldDNqV3hqTzFUSDVuWnZ2?=
 =?utf-8?B?V0ZHWjNDYmg3cGxYQk5uMkFBd0NGaXJza0RTZjZhZ3RIeDAxeVFNMjV1TWEr?=
 =?utf-8?B?TkhtMVE4ZjRHeFZnYjZ3Wk5wdkh0SytnQng5YkVaNnI3SERkb2hYVDlaWlVI?=
 =?utf-8?B?YXdqaG5XcERrMVAxUjVXU1BwSlJ3Tk5ZdTFGOElYRm1WNUZTOEVKZmVFdkRo?=
 =?utf-8?B?T0x0amNxMGJOeVBxRE5pckFidU8vb3daeWZ2Nyt1UGNHVDRmWEg0QXIxajZz?=
 =?utf-8?B?T2IvVTFSMHJiN0RYbnlmNDJEYjZ4OFhoL1dvYnpQaUQvY1JxNG1nQ0JPT1NN?=
 =?utf-8?B?cGxtak95QmFwb2duclZJTG9KbW9MVk9tUHMzRUUzL3oxejl6UmRQQ0h4NExH?=
 =?utf-8?B?SnFzVjFxZmxEVVpKUXVrRnhzYjMyY2VBK1ZVTmxoR2pZcUdrQ1poaUhHMnM0?=
 =?utf-8?B?T2hBTjUrMHY4M2J1S29xQkRNOWRXVVk2YlQzZENMWXFPTGdJcmpUVlE1L0Ny?=
 =?utf-8?B?eHNVR2o2ck9mSktaZWh4Q3NZdFlIRkQ2a3I4NkdtSUkyVzlRUHZqTWh3Y1Vt?=
 =?utf-8?B?N092a0NaNk93MExTVDcyS3dIN0wxNGE5TVJ6U29oMUZzR3JnOHprTmRGSG1q?=
 =?utf-8?B?U0N0d0R0RnNSYmR1RWV3NHd3dHNNZjVnVmtwUWU1eXNWbm0zWERGZDRZUnM1?=
 =?utf-8?B?TTR0SEpKOGlZLzFwMTdwVjJjLzZNSnR0b0NOVUg0MjNkai9uL3JsbjhOTWxP?=
 =?utf-8?B?K05WWCtmSTJ4dDJrWXdLZEtFeHFDK2JFMmoxQ1FWNTFRMWhXcXhTK2JGd3dN?=
 =?utf-8?B?U1U2MHQyL0o3cXB5cDZQSnpNNFNZZmc1RzdtNFRndFo4aXZDOVR5WHplREdu?=
 =?utf-8?B?VXRQTVRSWHVTdUNiRk5Ec3RKMTh4VVlaazZsSHloeENuVDZhVFcwOGNuQW1P?=
 =?utf-8?B?TUx0UFdlU2pFMWVFK1Q1UVc2MjFOdm93MHVmKzhOc1FVREZaRGltckNHVDl4?=
 =?utf-8?B?SENpZk5DSW9FaGYrTzFMWTBCbHM0OTV1YTNrUFl2bGQ4cHRMeVNacVp0Vm50?=
 =?utf-8?B?Z3RlMmV1dlFWZmJWL0YzaWRiYmVHZWxUeHlVbjhRL0RGc1UxSVlLMEx1VUcy?=
 =?utf-8?Q?pjR40W?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 16:57:10.2101 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1266b3d-c177-41b4-a784-08ddc940cc8e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6730.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9073
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

Pushed to drm-misc-next. Thanks.


Lizhi

On 7/22/25 00:55, Jacek Lawrynowicz wrote:
> Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>
> On 7/19/2025 8:33 AM, Salah Triki wrote:
>> The device is managed so pci_free_irq_vectors() is called automatically
>> no need to do it manually.
>>
>> Signed-off-by: Salah Triki <salah.triki@gmail.com>
>> ---
>>   drivers/accel/amdxdna/aie2_pci.c | 8 ++------
>>   1 file changed, 2 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
>> index c6cf7068d23c..3474a8d4e560 100644
>> --- a/drivers/accel/amdxdna/aie2_pci.c
>> +++ b/drivers/accel/amdxdna/aie2_pci.c
>> @@ -520,14 +520,14 @@ static int aie2_init(struct amdxdna_dev *xdna)
>>   	if (!ndev->psp_hdl) {
>>   		XDNA_ERR(xdna, "failed to create psp");
>>   		ret = -ENOMEM;
>> -		goto free_irq;
>> +		goto release_fw;
>>   	}
>>   	xdna->dev_handle = ndev;
>>   
>>   	ret = aie2_hw_start(xdna);
>>   	if (ret) {
>>   		XDNA_ERR(xdna, "start npu failed, ret %d", ret);
>> -		goto free_irq;
>> +		goto release_fw;
>>   	}
>>   
>>   	ret = aie2_mgmt_fw_query(ndev);
>> @@ -578,8 +578,6 @@ static int aie2_init(struct amdxdna_dev *xdna)
>>   	aie2_error_async_events_free(ndev);
>>   stop_hw:
>>   	aie2_hw_stop(xdna);
>> -free_irq:
>> -	pci_free_irq_vectors(pdev);
>>   release_fw:
>>   	release_firmware(fw);
>>   
>> @@ -588,12 +586,10 @@ static int aie2_init(struct amdxdna_dev *xdna)
>>   
>>   static void aie2_fini(struct amdxdna_dev *xdna)
>>   {
>> -	struct pci_dev *pdev = to_pci_dev(xdna->ddev.dev);
>>   	struct amdxdna_dev_hdl *ndev = xdna->dev_handle;
>>   
>>   	aie2_hw_stop(xdna);
>>   	aie2_error_async_events_free(ndev);
>> -	pci_free_irq_vectors(pdev);
>>   }
>>   
>>   static int aie2_get_aie_status(struct amdxdna_client *client,
