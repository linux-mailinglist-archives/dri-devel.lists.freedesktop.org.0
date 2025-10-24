Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D51BC071FE
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 18:03:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35EC910EABE;
	Fri, 24 Oct 2025 16:03:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FJesr1i4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013020.outbound.protection.outlook.com
 [40.93.196.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB9CA10EABE
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 16:03:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PGRSeZAzuzivF4ZoMRMY/Eg+xsU8h+fjgI14qsrTAR5mzX0fQX9rXXbCjeqQqMZNjPBo3yYOHi4P0eSzRrf/ynJZjIFfiqbXcvYZON/ErVmmm/NRUPg20fzLstnGh60ic6AQpuzy03foP3FF3xHo8mtX7Xw86UBQrjJGem8MUh0GdqcNWfuALATwYH3Z4iuvCDLN4w48qFY+mxVG42GItBSc68r219SV710uqlDWkZnFU6bmUwPbaa7A5RPcEgZoXnt7BgsSc2YDesWU4TSmVsRzpYQBc6hYRcFjTMqiNn88l/few4A9Ev0rInjp3Sr5wCa6Ag0miCDqQEgzmJP90A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D2f2ho1hyPrxAhiMlJ/yvGMNKgHUVvNC0J9JQa1A034=;
 b=TGqrHix0Vhg+uuJgIs/fitYfrpgIR18p6vf3xU2J7vUjOUhiFrEJoCD1G3DBqjAXKYccH8rTy9MtDGJP5nWWUbcTeVdUCd94M2V2UMwvTqgRwPxrOvYAgQgSUylTGx6kCTAjZ0JFsBbTioRruq/OoS1o28JZ5FfLVDirtF63Bvs+s5O0dtlBhSQkgfM5AZEUG1Qk5peCEBevTjQW51PcAKNYQkhm7eA7JHmVhJEE8sujOzYImwZdSUng06kk3V4taDIY0Z+kkqX5fqXsLVj1VAuGvKzNFuAyjJSLfV9/+CqtRxP/UNQSV01CsdG5Oxq2qjHD2vr/IU8B1RY4jRygkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2f2ho1hyPrxAhiMlJ/yvGMNKgHUVvNC0J9JQa1A034=;
 b=FJesr1i4poLBExU3RmR+41ug6Chg1EC4FV1gQ3DT3ec8DNwhtSpMtPc2geyaaj6PNww8OJCZ9kXhLmDoqXuBOMZpRfMlg8duPOnNAcM9xHZEKnFU4VlwkTj7LkbWMC0U6QqIL42G5xsccj5Dg/tdFdsBQIA21sOaGtfwKwLpAEg=
Received: from BY1P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::10)
 by CH8PR12MB9840.namprd12.prod.outlook.com (2603:10b6:610:271::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 16:03:20 +0000
Received: from SJ1PEPF00001CEA.namprd03.prod.outlook.com
 (2603:10b6:a03:59d:cafe::e3) by BY1P220CA0003.outlook.office365.com
 (2603:10b6:a03:59d::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Fri,
 24 Oct 2025 16:03:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CEA.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Fri, 24 Oct 2025 16:03:19 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Fri, 24 Oct
 2025 09:03:19 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 24 Oct
 2025 11:03:19 -0500
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 24 Oct 2025 09:03:19 -0700
Message-ID: <cf7aa396-a435-07ff-6b82-b2baf9affe0d@amd.com>
Date: Fri, 24 Oct 2025 09:03:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [bug report] accel/amdxdna: Support firmware debug buffer
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: <dri-devel@lists.freedesktop.org>
References: <aPsadTBXunUSBByV@stanley.mountain>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <aPsadTBXunUSBByV@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEA:EE_|CH8PR12MB9840:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ac0459d-234b-4407-fea7-08de1316d9f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U1VmNWpjZ1F5K0RwTVdLN1UrY0plZHBBNG9sZUtPaVU4Wk9XOU1lR0ZpVkI0?=
 =?utf-8?B?RnRvQUZwVU1JbFRQalpBVmdQdDFZRmhXYnQ0ZG1UWHE2OU4rZkI2WGhRNGlp?=
 =?utf-8?B?T3lOZFZZcmdjMWwvbUkxSWdTVFIweloxSXBSOVo0YWNsY01UbUN4VGhmM2or?=
 =?utf-8?B?c1pqZU1HeTdKTGY2TjhBay9QSnVwTmtiekgxNkxZSk1qLzBIdzJQeENYbEFI?=
 =?utf-8?B?M0hyNlRZaTdMM1ljVXNSS1E3N1J2VFBmL1N1eVY0Nm5MMk1WM3V4VFJQR3Nz?=
 =?utf-8?B?RW8vdzZVRmlsVlVwazRhVllNbnRkbWRlUUozR3BtYzdyck50SzM0Wk8ydUpN?=
 =?utf-8?B?TDZvLzEvN1h3Uyt6T3g1cjdsdGlrcTBQRFRUc2hxSGNHU3pvZ3U3bWpxOXZG?=
 =?utf-8?B?cFBsSHlXaWhjUmorckM0R1d5OGdPbDlIYlYzUnlvNGZxL3FNTVFwTklXTHVh?=
 =?utf-8?B?eXN4MnpscVhNbndUY0c4Y2VzQVBEWEVhd1hhbGw0WEI1ZWpmMnpFZ2gwVlBD?=
 =?utf-8?B?OUE4VWRHUXY0cksvM1dYeEk0aXZWR2tuTkFqM2hIOUJZU2RhenRYMURqbk1Y?=
 =?utf-8?B?Q0puaSs2cU1vaitaZ3ppdXB4WWR1YnRsNVRtbDZrNlpKcUIrMVZuNEp3UEt6?=
 =?utf-8?B?R3BqTWwzM2FpZFhvWmxPUkExRmNsZ3VabnlXa21uUzhPRzM0YXhYeW90OWhs?=
 =?utf-8?B?L0Y1eDJFTkZmNEx3RGVpb2ZZZEJ1aUsxdGh5STNzVjhhSi9ZMzFyd1dYU0pM?=
 =?utf-8?B?NUoyZi9Lc2ZmeW5hdXlSWERUQjBmaklCclhZZENXdjJnSkdLcW15VjBYMzli?=
 =?utf-8?B?L0wyRVFHOFhVeUhIQmhMR0NQOFBjeW4vQThvL3hOQWw1MXhROXlySkxwOWJX?=
 =?utf-8?B?elE1OWdrbzRCeUU4MExNV2xUNVlkclcveTd0MEJUNEtKaHYvQTRsbnNFRXlk?=
 =?utf-8?B?UU9kWFUwVmtaRmNQZ0Y4MGNUS3NlNDEySVVjTnc4MTVOZVJEcVYrblU2aHlh?=
 =?utf-8?B?ZEl5ejFna2tVTWJvU1lRd2M2UWRZU0RLQlF6dUhNMXFmamFhR093Snk4QTdW?=
 =?utf-8?B?WDJjcGZ3M2ZxVzFQNS9CMWJ2c3NpZEx0Snk2RzNUU0NEeVNPd2Q3anN1Y21P?=
 =?utf-8?B?ZEh4cWJ4WkVmMldIWm5GQWw4dnFYSmY4YlpHa0xlVGlCTUdwQVpia2twWHZi?=
 =?utf-8?B?NWpRQk8xZkFVWk9tdXY1SFNZQnRhaEs3Z21vTTJRWVRPVE9qRFdWaWhJRDQ3?=
 =?utf-8?B?clZ4dGYxODFnNjNMRzIrN21jK2dMNGhSVHBaYXc5L1NXUXYwRzJUdHdOdE9j?=
 =?utf-8?B?NmVwa0FSamQ0L3d3T2FYeVlFMCtpeERIeDZwZWl0dXZqMTVaam94QmVzMURw?=
 =?utf-8?B?UW5JMmpNRmhtOUVISkVta3dtbkVXS29aUmMvNllOSGJpdFhrbFRMQkUrTXF6?=
 =?utf-8?B?QU9TVHk4SWd1VTVZTVBVYXR6dTBQWHdTK0VSUW50YXB6ck5HVFVlcm1DZFlL?=
 =?utf-8?B?dVhocy94aVM2OEQ3NHJqSTR2eVJTRnp0QStXV1htK0NZV3V5eXpmZWkwNlFU?=
 =?utf-8?B?eEdBK2E2Uk1LVm5VNkx1dndMTVBjOEd1R0FpOS9KLytyU2NIcWlxTVBJTFc1?=
 =?utf-8?B?K1BSZlpmMVlDUjcyeGpNbFNJcGJlRXdNYXZmMno0ZlJ4VGtTa0ljckM0bmJ1?=
 =?utf-8?B?NjJWckVYNGtZMWc5R0RHcHk2Z01pdm9FQm95OHRKeCtEdndUQXZwYWJMN0tT?=
 =?utf-8?B?ajM1ZklkVE9taDZNanExMnpMajVXZys1UHB0NDdLcUpsRmk1NFN5VFc1VXhT?=
 =?utf-8?B?cmY1c0Y2YzM2d1NJaUN6ZWJXTmpqRXpGeHlyUDJ5MlVRSDM4cVgyNUM5U0Jj?=
 =?utf-8?B?NWlGV21aUDN1ZXdVSVhna0pCSVZreFVTSnRrVzNXTm43dkwxM0pmaGJxRm5F?=
 =?utf-8?B?N0Y2UWlZdHl4d0ZpbytmRlJTWmdGZDVCMDNCNTB3YkkyTkpNZTE1VGVIc3FQ?=
 =?utf-8?B?d3JmOTNtOVVxcnBzam56em9FM1dFTVVNdUFPSVg1blBqWW1rcnFjT1RLR0ll?=
 =?utf-8?B?VGFUZjYzU0NkV0dxSm1JTWV6TjhOakVydFNvcGdvN2JTT01jckwvUm5oVUpZ?=
 =?utf-8?Q?LCis=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 16:03:19.8814 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ac0459d-234b-4407-fea7-08de1316d9f5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CEA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9840
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


On 10/23/25 23:19, Dan Carpenter wrote:
> Hello Lizhi Hou,
>
> Commit 7ea046838021 ("accel/amdxdna: Support firmware debug buffer")
> from Oct 16, 2025 (linux-next), leads to the following Smatch static
> checker warning:
>
> 	drivers/accel/amdxdna/aie2_ctx.c:882 aie2_hwctx_sync_debug_bo()
> 	warn: missing error code? 'ret'
>
> drivers/accel/amdxdna/aie2_ctx.c

That is true. I will fix it. Thanks.

Lizhi

>      863 int aie2_hwctx_sync_debug_bo(struct amdxdna_hwctx *hwctx, u32 debug_bo_hdl)
>      864 {
>      865         struct amdxdna_client *client = hwctx->client;
>      866         struct amdxdna_dev *xdna = client->xdna;
>      867         struct amdxdna_drv_cmd cmd = { 0 };
>      868         u64 seq;
>      869         int ret;
>      870
>      871         cmd.opcode = SYNC_DEBUG_BO;
>      872         ret = amdxdna_cmd_submit(client, &cmd, AMDXDNA_INVALID_BO_HANDLE,
>      873                                  &debug_bo_hdl, 1, hwctx->id, &seq);
>      874         if (ret) {
>      875                 XDNA_ERR(xdna, "Submit command failed");
>      876                 return ret;
>      877         }
>      878
>      879         aie2_cmd_wait(hwctx, seq);
>      880         if (cmd.result) {
>      881                 XDNA_ERR(xdna, "Response failure 0x%x", cmd.result);
> --> 882                 return ret;
>
> ret is zero.  return -EINVAL or something?
>
>      883         }
>      884
>      885         return 0;
>      886 }
>
> regards,
> dan carpenter
