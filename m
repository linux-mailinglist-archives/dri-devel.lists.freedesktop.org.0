Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D80D997126
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 18:22:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC47810E785;
	Wed,  9 Oct 2024 16:22:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2ydzcEvl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2049.outbound.protection.outlook.com [40.107.94.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 501CF10E785
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 16:22:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DHmkjekh31A8aWhWzKG/z692+ruAkmHss02x6FEPd7eRm5D8MvSHc4aUU5WlaL4rKwxLSJ3NbR1I6R4ljEFlaoPmtqUl02gY2o06FK97Z99upsf6VTHYgjwFXPnDW40ENiNxK1/vnTD5dvAccJkl62bTS49q4JCm0R2YDzQsb3mOBHyjTOqujJ3fq45W7rnfhHbJ114ZN3YNmQB5Vv9urV3JREwmvT33FccVx0qlFJ6Cbsv0fDbH4FjDGC6TLgaZE+pcF4P/jwhAQpe8iLifIcQCyuf+p9PNoCDrwXMbRgWSQk73fVuiP4FCVDfQ32SrTBrH0x9eX+83zvTJLTML5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OTAf1tVzYg8W5+95LW/cO3Bja1AVIl84tc3L8vYgx/8=;
 b=Ep1fmCdVFyIm8HBXU8cFDrJmLKfsAf9MhppyHc+4AZ2eCRe11UNknAKy0NXBM7FULvA3seqotn4zXS9se5Kc0ve6MynDAJW+ivkG8qYY0u/2KVK0WadlSnJtIurknK0tHXfzIlpILD4YYIHSS3d1TUDy/hE81gnbj7aD0kMSsj/Nx2xgxTJ+T/pYerCI8QiLagLnVU7aY8/S/gcBHCphCCjvyrpqVTXvPEmhmAeG7Lo7g0hhMMRbEJ8Bp8IMlIRDW8tXNWmEkPPymyD3VmxyRdVjctPnESGJo0X030M4uONOASgyo3FIZdsWAbsE3JkxDMa4hj4RzM9RhPdoBZZt9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=quicinc.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OTAf1tVzYg8W5+95LW/cO3Bja1AVIl84tc3L8vYgx/8=;
 b=2ydzcEvlHbbHwQu7sEndHky9opxntD83iKCGBKICvMwX17Ck2F/FKP1QOKXI1Lnf77/p6DbBlQY7aFSGv0mMcpv16PXvpOlyauheMWv4CoJ1J05xJ4GzIRijapnV6+qX/EnggbKdjT7jyjlfuZMPO9pGbLQrhgfE15uKWI3ShgU=
Received: from BLAP220CA0020.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::25)
 by CY8PR12MB7146.namprd12.prod.outlook.com (2603:10b6:930:5e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Wed, 9 Oct
 2024 16:22:40 +0000
Received: from BL6PEPF0002256F.namprd02.prod.outlook.com
 (2603:10b6:208:32c:cafe::1d) by BLAP220CA0020.outlook.office365.com
 (2603:10b6:208:32c::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.17 via Frontend
 Transport; Wed, 9 Oct 2024 16:22:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0002256F.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Wed, 9 Oct 2024 16:22:40 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Oct
 2024 11:22:39 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 9 Oct 2024 11:22:39 -0500
Message-ID: <08835e82-f9e4-52e5-5d03-fa31ecf63314@amd.com>
Date: Wed, 9 Oct 2024 09:22:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V3 11/11] accel/amdxdna: Add firmware debug buffer support
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, <ogabbay@kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>
References: <20240911180604.1834434-1-lizhi.hou@amd.com>
 <20240911180604.1834434-12-lizhi.hou@amd.com>
 <1a2bb8fc-0242-d86b-1de0-cc9eec1c61c0@quicinc.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <1a2bb8fc-0242-d86b-1de0-cc9eec1c61c0@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256F:EE_|CY8PR12MB7146:EE_
X-MS-Office365-Filtering-Correlation-Id: 862ef9c7-70af-43d9-45ce-08dce87e988a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZHllNlVDbWtOZWtvZTkyRW9EOGtLY1F1L0F2UnVRUHkwQVZxL25zcXFjTTQz?=
 =?utf-8?B?K3dlZUEvVnl0Unp0Yy9TS21mZkVsa1BWcUF3N3d5OXR4WjNMeTlwN1RkTlVR?=
 =?utf-8?B?TGs3TC9FMStPQ3BDNmJ1U09xcUZPZWtOc0RDbE5BVXZDWmwveTFPRWVYaTlm?=
 =?utf-8?B?RUpHZ1JNbElxWkg2RFBNS3JWeTNCNzFCUTJKalRENXpyd2hFSUtyUGpCS2p5?=
 =?utf-8?B?MEpLTkdzTjBvekJuZ2hRSGNXRHNibWtOM1NWMDM0NUpVSDQ4SFNmUmF5MG8y?=
 =?utf-8?B?WVNFckNPanpIQ3RaaEptV0NldmZ0Rm4vRDVmbThoazdmQ3ByR1Y0dXpOZEgv?=
 =?utf-8?B?RFNkbWRUV3U0ckh4MEIwKzJRUHE3anRTRU9wUTgvUXdBU2JFN244NnZxT0Ez?=
 =?utf-8?B?YWVtRGY1NURHbTYzYjAzR2JoUitEais1RnlJdHJOMEdDbk5ScGM2b2xpZC9Z?=
 =?utf-8?B?ZzV4K1kxSGhqVDVZTVkxZUhIa0cwWGVQTU9tbWxRQksrdTdhRjA5cmhSZ3JF?=
 =?utf-8?B?dFZXMlJBNCt0dzBwTzZ1bkRnWExha1pxVlM3MlVtK3Q4YWtFVDg4dTVxU0pp?=
 =?utf-8?B?aGFLUG1WZndxb2ZvQXRFNjdSTHN6NVpveDNodDAxczRZNE1GbUE5SDJEWVJj?=
 =?utf-8?B?bjZTZU1NWDdmRkFtNmdNY0FTNmg3b3BDWllzS2lRU0xnM1BGSjRSTTBIbWQx?=
 =?utf-8?B?UEMyKzA1WVFiQ1hOQmRITHF5ZFN6K1hKUkEwb3JCeDloOGdoemdXRjJDNzAw?=
 =?utf-8?B?Z012KzZGMlVDMHpOVEZ2MWVJUk9wdnh2bEpsTkFyVGVnRENJb0lRdEVkRWhJ?=
 =?utf-8?B?MkFZOFZrRmNaeUdqbXRoZWowcjBrQ0FWbEJXeVBXaUd6R2QxR3RRblh5QzV6?=
 =?utf-8?B?bk9iUEFJdnlVSlhGaXBnTXVJS1V4cGkvS3B1TXpLeHp2SnloQ3ZWL0xLRGhr?=
 =?utf-8?B?azY0UnR1WURGUlpwVnIxRkQvV2NvZGNyaXVUSU83RzVlTFg3ck82MkxrdnRp?=
 =?utf-8?B?cmJlZGJTR1BLWDFWZ3JPcERIeGRtWW1tVVlmVjdCcTVjUkpLZ05JL1U1WUZn?=
 =?utf-8?B?RE1TeE1XSE13Ync5RmpMSU9kaTlQSFBiK0JQcld1MHpDQXJaM1BLRkxONlha?=
 =?utf-8?B?ZWhyaUNOeVFKTkh2cEthbmhZWTAvb05FOExkUjIzM1RZc3Z0VWlRSW5kY0Ri?=
 =?utf-8?B?V3EveXY2czViZVVIbFh1cVFtZXBFQ2RmVmYxditqRXByd0w4K1RIT1lHR2Q1?=
 =?utf-8?B?VmxkSmM4UUNET2FvaEoyL1F2TWEwTE50QlMwdHo1WnR2QkVVTEhRa2FUSFJz?=
 =?utf-8?B?aHdGbTdwT3RiQ3VUS1p1cldGWjF1TFFnZ2dDSDUySHZ0dHhHV08yTWxtVjhi?=
 =?utf-8?B?T3hDRlg3V2IvKzBUMmlHbjlTL1NOWU5WdnByNWJBM3V1OUgvNlI3RnpjOVJC?=
 =?utf-8?B?VzZoMU9iQmVFZmxGMDdWc3F2TzFhNFRIZC81enJaakw1dWRWaU5nTjBlUjNB?=
 =?utf-8?B?eHJPVjdFaXRnaUxpcUU0Z3g0amJENXZyWjRZU0VnVTBzcUMzMEM3THVKU1l2?=
 =?utf-8?B?K1FLQ2FwemE3K2V6c0NMakd4dU1zUHdGM0lidzhYYU9lSEJlZEVLUjZhTmpj?=
 =?utf-8?B?NEM5V2lNVmJIT1ZsNkVHRGUwaUtjd1NXNWxVaVdxZko0cnViRTBRc041MzdY?=
 =?utf-8?B?aFdDYU1zS3hnQjZrNTRGdFhnVUlzT2JiTjd0enZuOU0xOWt4L1AvYWhOdVYw?=
 =?utf-8?B?UmlWL29vOCtnUk1Fb2RrNThneHJwazJEVUJxVVc4eUplT0wwMjVIODQ4QTZv?=
 =?utf-8?B?ZjlkM012QnNZa200VHg5emJKdUp5b2tvVzV3b2hQZUxQenNzeXp2QVg5cXlV?=
 =?utf-8?Q?/seqDvZDKoR+0?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 16:22:40.1708 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 862ef9c7-70af-43d9-45ce-08dce87e988a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0002256F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7146
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


On 10/4/24 11:33, Jeffrey Hugo wrote:
> On 9/11/2024 12:06 PM, Lizhi Hou wrote:
>> User application may allocate a debug buffer and attach it to an NPU
>> context through the driver. Then the NPU firmware prints its debug
>> information to this buffer for debugging.
>
> I feel like I must be missing something. It looks like this patch 
> accepts a buffer from the user, and stores it. However I don't see how 
> the NPU firmware ever learns that this special buffer exists to then 
> use it.

The debug function is incomplete while I was creating the patch. Thus, I 
put a line in TODO "Improve debug bo support".

We made progress on this feature. Should I add the code to V4 patch? Or 
I can add it within future patches.


Thanks,

Lizhi

