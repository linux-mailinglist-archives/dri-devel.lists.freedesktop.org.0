Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 756ED9F141F
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 18:42:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EF0D10E11E;
	Fri, 13 Dec 2024 17:42:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GOPNwT8L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2054.outbound.protection.outlook.com [40.107.102.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6372C10E11E
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 17:42:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i3qwh7l0K1jED7mZhVg0jv6bYIU3HdfbGa8e2rhu5nVhYUuC5gDiG2WpjB6fHkyJCbZ+CXwVtpzfi+v1gVc51zqzfEtIhXmbrug+sPgHK0TKBYM90mQJawnsS/XR8LObR5reu3ykmoAy+Q1d6ARrxuvC8H2UXskkf7YTopWvWJ8/Pd5hmTH43fmbosqsE3m4ql1GcrM/gnnUmYIu+DX1DddvnLd8uKSyHqShG01c26/jv0fId8AMbYICbea0V1z507PwJiqx/69i5Ip1TAYXzBLwWV2RCF8LUuPO8EtPjkyyTaHhQowjCq4bxr2CyjYf6z6PXR9XFQTRD0HYhFAlog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5H564jTK8CRb/OkXpngLvuy/B9M+utpxK5sy3v78I0s=;
 b=fdHcXk81uQolFLv4HsrYyb/tp27mq/jIqxUneCcft9AbFdrC5JSLag+gGcKPJYzHjr2TR85NlN/+l87c9QkMkCz48Poy0l7WnMsSohQEsZ6QO1ggsH+qtKAN6NMhipQGyimkPkyyhpZAWOzrcISD+a05wsqeS0ddp4SNr1cmZjmhjCoa7JPu+prMWMQR/5hdUQ50QgIYjTWr0R01dyFPL7wiNyTmZ+49G+IKKvFad91AP+8CPQ48GYAhWQo4c/CrbLV8k5cCpt9mMmfdp4X51xFKN4+EI65jWpQcWOOH4kroyCECBEzt7+g4H5guwCC1MnmIVs4fLdxLVnjE5Ju2rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=quicinc.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5H564jTK8CRb/OkXpngLvuy/B9M+utpxK5sy3v78I0s=;
 b=GOPNwT8Lcm5++6eE5874oPLaD3amB5GTJbIU+LDkD60D1y667OdZNOe6T2E1nnP5MeNCUENkL3rRtu9WA9PR/o6igW5I/fT2YFtJMukEoDiFB4NUELiWyeuhaPBwRcGckauo2Hbi5TqsDioSTp9zDvVc2n0W8FSAW4K/C5HeV2s=
Received: from BN9PR03CA0322.namprd03.prod.outlook.com (2603:10b6:408:112::27)
 by SJ2PR12MB8739.namprd12.prod.outlook.com (2603:10b6:a03:549::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.19; Fri, 13 Dec
 2024 17:42:01 +0000
Received: from BN2PEPF000055E1.namprd21.prod.outlook.com
 (2603:10b6:408:112:cafe::ba) by BN9PR03CA0322.outlook.office365.com
 (2603:10b6:408:112::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.16 via Frontend Transport; Fri,
 13 Dec 2024 17:42:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF000055E1.mail.protection.outlook.com (10.167.245.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8272.0 via Frontend Transport; Fri, 13 Dec 2024 17:42:01 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Dec
 2024 11:42:00 -0600
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 13 Dec 2024 11:42:00 -0600
Message-ID: <e3d9dcd1-70bf-5656-e1a9-749c5a08a20b@amd.com>
Date: Fri, 13 Dec 2024 09:41:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] accel/amdxdna: use modern PM helpers
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, Arnd Bergmann <arnd@kernel.org>,
 Min Ma <min.ma@amd.com>, Oded Gabbay <ogabbay@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>, Narendra Gutta
 <VenkataNarendraKumar.Gutta@amd.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20241213090259.68492-1-arnd@kernel.org>
 <828570ae-1ff6-4bef-4bb8-51da9237e63e@quicinc.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <828570ae-1ff6-4bef-4bb8-51da9237e63e@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E1:EE_|SJ2PR12MB8739:EE_
X-MS-Office365-Filtering-Correlation-Id: 1583e06f-ca5d-4f0d-c998-08dd1b9d7332
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dVBkczVUUjlIM2JpRlE5YktDbWx2TGlQZjk1R3E5VW16Tk1Ea2VLZE8zTFl2?=
 =?utf-8?B?ckZDWXBBK09HNUl4NEhQY3hFeUQyVWdzcENCaDJJNUVuRitVREVaMFdjalFi?=
 =?utf-8?B?QXowTmdtTUpEV3doZWdDM3QxR0Q5YW5mVVg0bnZCWnZYVzhJQU1xODBQMENk?=
 =?utf-8?B?MWNMWVVwTS8vQlJ5cndqeGVNR1JsS0VsbnJmdTV5Y1U5Q1ljaUVHRXE2cWZq?=
 =?utf-8?B?TmNOWlFhT0NPcWpoOG5yOXBGakl3alhNSkZoY0o1Yjl6N2RMOHVoL0cxSXV0?=
 =?utf-8?B?cGVMMDlmZHdSZU5tT0hxUXRWV2orTlg4bDhZSUYvaFpseWtaL2VidXlLWmF0?=
 =?utf-8?B?VnlrY0tpdUY1SlB0TlpNcXUxS09xSVh6NlZxRm1mRnhobEIrOSt5M05VREQ1?=
 =?utf-8?B?YVFNMUhVUXhnUXVkelpLNW5uUTBVb05ZenlLZTJzT1FXWUxzTVZFaDFaUUx2?=
 =?utf-8?B?dElYdGVjeG4rWktwcHBreHNQaGQyd1dJak9aNVRZNmlVVnVqV3FsQzBxN2Ri?=
 =?utf-8?B?SnpYTmxyc1FTdkxvTGVndjJORTdkZlMxYVZENjlBbnpnb0d3bzF2Vkh0TU9H?=
 =?utf-8?B?YXNCWlVzTzN4ckl0TkJSdGdRUHJhbEZ5N2RaUVNXbmZFT2ErczhMYlkvTWE3?=
 =?utf-8?B?SVhGQU9XSzlodUVLbEpqaUpQcTJHdnQwbjM0S2xnb0lzRE9OYkFhR0Mzb3Vw?=
 =?utf-8?B?Z1hRcDhvMkNhb3pBdlYzQjdXb2k5V3hxWVdVT200NTAvcWtHWU90YXlPYlhz?=
 =?utf-8?B?UDJIZWdDaDBNZWZmYXBBbmt5RnE5ZkpySmpFK1VLS2N6b0lVUE92TWxId1Vu?=
 =?utf-8?B?NXlpQUVXcm9xcWlGN3FWQUs2R3BCMTJ4cDEvc2ZPSlRTTEZLdmRUT3ZlRmdX?=
 =?utf-8?B?TGVTaTNYblFYNHZOcEtOcHJGUmg5Mkd2OTc1anNBK2kreDA5UHNqS1l4eTZJ?=
 =?utf-8?B?WjFVcmF2cjIxbVVNZms0Y0NUL1N2S1RCSCtVS0wveURmRitDZHhDb0xBOEx0?=
 =?utf-8?B?cVNTSXQrUGpZU3Rwckh1YnltcjRzREJ5LzBYNGdWSml4R2x5WnZZU0xHS0Nn?=
 =?utf-8?B?VjIwYXVNMDEwRytXWVpCbTVZU3lSdVJtTTFiellMRGMwWjI3WWFHWDYwM2Jz?=
 =?utf-8?B?K0tCSmNTaEFUdnlUdGJhN0VkMU5tZUxoKzg1T1RiZXJvMmY5dUtmZUlIYVM2?=
 =?utf-8?B?U0p3Y29pTjIwKzk1SGdRaStVZXpuc2p1aVl4Sm9FcUU1Um5DTHJEVmlTZDlz?=
 =?utf-8?B?b2hjSnpFakxnbTAvcnNWVHpBamJWcVFxYitRbHdiOTQ4b0JRQlhlZzB4RTll?=
 =?utf-8?B?QmRSSXFkUXZLQTA4U2JITC9XV0crNnNHdmJQYm9OVU02bk9sWGphWEliSmdl?=
 =?utf-8?B?azA0eTlEUUdPSnlrOWdQaExpR0h4dzh6Y0JJcngydzdUT29WWXlIUjFvbVBw?=
 =?utf-8?B?T25PbjdoWVR5MG9VVi96UzNxbEUrSWJwN1IxN0Q3TDQxMFgrdGc2V3BWZC9H?=
 =?utf-8?B?K3VWK1VLZGs2V3NWbVoyUmI1SktIVWZMSWhqaXRla2Vlblg3WlY2aFNleE5u?=
 =?utf-8?B?ZzhBMFVTNXQyR3ZLYjl3SWNScUFFWXBZaWFyZ1V3QkJjZUFBTmFpYUQwRlEz?=
 =?utf-8?B?UWdjNjRrT1B1R0Z4cEVhOUw2S3ludzUxdVFMdVpzMnlZbDEya2FLM01NbFZG?=
 =?utf-8?B?RGdrdkhEaHBXaGJzeDZBeW5aUUorck50S2l1YjRCS1lLOHJnRTg0a2Q1cG5M?=
 =?utf-8?B?Nkp0ckxUTTNSSXJGNTh6UGRaVzZiL01MbzlaQzhpU1htVmNNVFZwUGJwQ1Ax?=
 =?utf-8?B?MzRNd1NsK0g5a3FyK05laGxqQmpnNi96bmNYcmlZMEhqSlV1ZDJ5N1pPVy9r?=
 =?utf-8?B?YjRsK3RSa3FlWFhHaDk5cWswU3U3Yk1RK0o1T3pUN1BteDRHK0picW9nK2Ry?=
 =?utf-8?Q?Slf3veB56HEOhEM1K0x+p32QT5oHRwQG?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 17:42:01.2377 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1583e06f-ca5d-4f0d-c998-08dd1b9d7332
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055E1.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8739
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


On 12/13/24 09:07, Jeffrey Hugo wrote:
> On 12/13/2024 2:02 AM, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> The old SET_SYSTEM_SLEEP_PM_OPS and SET_RUNTIME_PM_OPS macros cause a 
>> build
>> warning when CONFIG_PM is disabled:
>>
>> drivers/accel/amdxdna/amdxdna_pci_drv.c:343:12: error: 
>> 'amdxdna_pmops_resume' defined but not used [-Werror=unused-function]
>>    343 | static int amdxdna_pmops_resume(struct device *dev)
>>        |            ^~~~~~~~~~~~~~~~~~~~
>> drivers/accel/amdxdna/amdxdna_pci_drv.c:328:12: error: 
>> 'amdxdna_pmops_suspend' defined but not used [-Werror=unused-function]
>>    328 | static int amdxdna_pmops_suspend(struct device *dev)
>>        |            ^~~~~~~~~~~~~~~~~~~~~
>>
>> Change these to the modern replacements.
>>
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Looks sane to me.
>
> Lizhi, can you verify that this works as expected for you?  I'd hate 
> to accidentally break something.

Verified suspend/resume. It works fine.


Lizhi

>
> -Jeff
>
