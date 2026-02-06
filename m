Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHqfLD4AhmlhJAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 15:52:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C782FFF433
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 15:52:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E274610E008;
	Fri,  6 Feb 2026 14:52:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="n5j8adMM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012010.outbound.protection.outlook.com [52.101.48.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0921110E008
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 14:52:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c5EXVZKhL8hVE1/XY8KFzz/GSYIpc3dOufnf+EntQXJxbPzdJ5LpXC5oYZ2H4wwWI51rmBlqNcZi3sqTT6OKvgTfNfKDB0mN/ul4tc0CPVmgqAwH27w7aq1GV4Hua8DuuHHQzzBISOzsytABFRJZtfT1hC8fldJWWk6uzyEtJQDzPJo6PQeb4h2qjhEe+Sa/Jt2ZswmuYF2gbKTLqkCTFIRjWDJMPHaDCRv8qn6T4gM5/xVkCEAS0elcSUfbH71HwMnQcDrOjaF+UMFXWf6TBmqthMyJmoOJMAf4kq2Tr2O00RCLucSleD7M2h3fyyt0TUz2xFCdt/He4Yl4j0eZNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gey1ZS4C4elioQOjVUVpKBXM+fXijALQPq50gtXCT50=;
 b=VmNb8t1lMjTDGZ/aSOAQE/rGxjMvEYfcLuEKOWs9XTPK2Nn24zqITVtssolndaxSJC9pS6qBkvZB8h+5Nh5gMKOEFZFy9mqqlj1khvBokZB2MTh+iJnf0j2Y7E7t58fNCdjIl/kdUZYAcjg9qU16tKuK8ZPtif3ErP4phIEugpQJSt6QNnZFIl4+1emyq2fUT8ho+IP9nDXdCTGxAU3wKLGBdFw92P550bLtIrM0zxsWAf7txjIcj3b5MVk/QAWvbf71CjU+lgu3gJldQZDdA2X5Ojb5zu8RNgd/omOpsSNRzK2rOVHFAe4YE1wPcfv3t/xF78R4Pzf+qGTCQmJlww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gey1ZS4C4elioQOjVUVpKBXM+fXijALQPq50gtXCT50=;
 b=n5j8adMMOP4u/MXBlKKDOEpXy0YuXzjllJqvDUSH7td3yhOd/z457cDjliZXSvbZCVZKU0mrXDFYBbMw+YE/WmLVuIJl8WKuHwuNAJ5r7cRupDMbfkDBXGw787ISADjH0gvM/HpOBCNnI5wo1/E4dmCo9jFXvLBps7ZXg+qvXU4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by BL1PR12MB5708.namprd12.prod.outlook.com (2603:10b6:208:387::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 14:52:37 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce%4]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 14:52:37 +0000
Message-ID: <68d89362-7592-4465-adaf-8be1268131ba@amd.com>
Date: Fri, 6 Feb 2026 08:52:35 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Switch to always use chained command
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 maciej.falkowski@linux.intel.com
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20260206060251.4050512-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260206060251.4050512-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH5P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:610:1ef::21) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|BL1PR12MB5708:EE_
X-MS-Office365-Filtering-Correlation-Id: b8515cae-639e-4d7f-71e4-08de658f5e8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z0tDUEM0TWNVZnJRcVBFU2Vma21iUGpKMWF1YnJFUTg1ZDVGTHVYWllxL2Vo?=
 =?utf-8?B?VEMvTitmM0xUVTFVa1JORVZoc2tVbVFuakxwYmVFZWcyTE5uNGEvbW81QkQy?=
 =?utf-8?B?b3A5a1lTRTdFbEF3WVBLMWhhdHRoc0QvZXZuL2tUc0JmQWFKYmtuTlBpRFBo?=
 =?utf-8?B?NFljaXpBS1RQMVNSbHlWbjJsdTFMYkdBV2dwVzNzUm9jb1hVYW5yTnowUVFK?=
 =?utf-8?B?aFhHQmVBZktTU2lrcHRXQjQwYnR2Y250MXA0RTRHMnpjVThMUktoS3hjVENR?=
 =?utf-8?B?NUkzVXZPNDU3MVpSRnAwWTAzdnlCUGl0Y1hCN3VmaTArbHFudnNwcExqMTRI?=
 =?utf-8?B?WlFBSDMydENKeEtZUHVTWm9oZ3plZUwzUVVuUXJieExwaVVDRkE4ZElTTDQv?=
 =?utf-8?B?N3g1MWlWektISzZLTzFyMWRYWG9aREtLa0M3V1AzZU5BclJ5VGJ0NVVXOU8w?=
 =?utf-8?B?Q2NTVjVtMnExZWtmdVBlUnZURzNtQU5qNTlvNFBZb2c0UllYdU9vQmZJTm12?=
 =?utf-8?B?M21mbE8vN285TjNvM3R3YlJscW1xUzdSbEYwakhobUF2U1ovaTBDOU5hM2Ey?=
 =?utf-8?B?ZHV6a2VnTHI1Sms3U0U2Q0hIWVpHR0tTNU92VTBFV3hwUE50ZzJIMkNrYXg4?=
 =?utf-8?B?T0FUejF2K1lUc1JCN040Nm8wOCtCL3I4ckxma01kaG9WOFVLQWU1RU9XaDlR?=
 =?utf-8?B?L3BiemZQRXhXMHZtOGZWbVNXWGNDZ3hhNnBRU09UeHN0TXlwR2NURkZDemtu?=
 =?utf-8?B?YTlkcVRTR1BjZWxxbnB6VUlsYjRTZ2YvVmlucVN5SWEvV25ROWZ2QWkzRHdt?=
 =?utf-8?B?KzdtZUE0VWFjdGkvMEZyMmFWWGpFSlZTNC9YcGFDdDFNR3pQdU1KbHNCVHhr?=
 =?utf-8?B?QmZMUG40N0dVZ0NWVEVHZHlrMm0yQSt3emRNTmU4WXJXRE96anQrY2VPWDNy?=
 =?utf-8?B?SmxxRmtDYmkvZW1QSWlKVjBIY2NCdVVxd0ViZUxPczkxM3VIWXJteHpRZ1Zs?=
 =?utf-8?B?Ykk2eEUzTm5YaHRyU1RvSm1kSHJ1dGJmaStCVjhUZGlDdUxReitJT1hGU3dq?=
 =?utf-8?B?QWV6bWhTd0VVMjViREUxREF1S2dUVnQ0YXZzeHY0WnEyNU13b1hxZXY0Y0xJ?=
 =?utf-8?B?OTFqQkF5M2tmM1VDRFJkVkh0Q0Q2RHNtRWlLbWxXSWxPUFh2eExGM3EvMFVE?=
 =?utf-8?B?QlRKR3kyVFVlY08ycnNWMkNUWklIQ3QzbDMzNE1XNlBoL2tOMW9adXBvSDEw?=
 =?utf-8?B?ZlpJOVJJQWU4OStHcHAwSTdXcE5uUlFPV0FhNEFBU3ZQSm84ejFtVFVhVFlp?=
 =?utf-8?B?cHRXTzhnamYwOE5rRHBoenJybmxDMUhmcDJhT3hZTFM2MWF0OUxRd3l0aHRR?=
 =?utf-8?B?aUhUakV2SWphTjRBQk05VDJqZ0YxN2U0N095VHY3MEJwUUo0RUQvUFBoc0dI?=
 =?utf-8?B?VjBqZGhnb2pVaWhPSFpIVk1MOXdQbkI1alZ0Lzh3OS9ENEpqQS9BU2gxdWF4?=
 =?utf-8?B?cXlDVVh0NUlZMXVnUkhPNnNNWmZOQklINzRnMlhzWWozUlJDcXp0MjV3V2Zp?=
 =?utf-8?B?a0trTVN0SEJoUGlYYXZva3NRd3NaeGJid0N6S2FyODlRUTI5d1hhcFk5Wmtz?=
 =?utf-8?B?QmFNc1l6WG5MdURFR3B1ZE53eW5RWU9rQ3RFZ0lJbE5BenFJWDFSZk5naGRv?=
 =?utf-8?B?QW1oZ3FRSHZ6VjZXczJVSklwNTd0UG5tcmNQeEN6QnVKTXJjTW45NS8vRmZn?=
 =?utf-8?B?anJ6b1EvK1VCZmlUN0I0N0wvUXUwVkhzUitnc2JuSStIOVo0cDBCTEluajU2?=
 =?utf-8?B?VkZWcDdpZXVuMzI4eUlrSElYUjNGVDJYTDJ5L3Uxc3hYdnRGSDFHMVNLTGRp?=
 =?utf-8?B?M2lJU3h3R25wUkJ2WEtoSWxaUFpNYlBxSUlTak5wQTJKbE5sWWJtajdacXFH?=
 =?utf-8?B?bFhlanIxcU1xd1hIUzZobUpDeWpXZ1l0RHNvdks0andJamhXVGMrSU1ZYkhs?=
 =?utf-8?B?MDQwMzlnOEZ3RmhDbUNiNGExc1AvRE9Xa2FuKzVhb3czUGFCUVdsQ0dYTnJj?=
 =?utf-8?B?aGg2UlVtQUJ0a3pIOXBEamVnQnpvY09kME4zZzQyUFMxNjQveUlDVGlaaURR?=
 =?utf-8?Q?NA9k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vkp3QUlXWWdXMVZHeittK25icXYyRUVVa2l0Sm1BYTNlaUF4VWdMOFZRcCtN?=
 =?utf-8?B?ZjE0TEZTb0hvaU9sRXFSakptSEw2eDNHcUFrQjdvMS9Eb2l6Z3E1QitTWk9p?=
 =?utf-8?B?Nk80eUI0NTVLOUM5bGc0cVo1MHRmRVBtNzFsYVNYaGIxTllZMGJaVUxUR2Fo?=
 =?utf-8?B?UTB2UDFVK0RMZjRiR0JKWVF3SExJcTErT3cyMnRJZ0JtSjQrMWduc3JmUCtk?=
 =?utf-8?B?bEtPWTY2Nkp5WXZwMFpKeEFtUFZHVTdJcDRTbVNwcG9veUd0dFVjK1h2MEp0?=
 =?utf-8?B?WXN0SnRFWnk0eHduWFNXdDA3QmVCdzJkYUVSOXhndkZPN2djcGROUSs1WXls?=
 =?utf-8?B?c0ptbXZONjJaaVRCRVJsK0NvUmhFVTdma1c0NDVwNzVaYVhoQVhIWDlaRnpF?=
 =?utf-8?B?eTF2ZFFrVDBIUFd2TWxhNks4MGM1akZ3anlCbHNLL29xVG9VZUROWXh4cDF3?=
 =?utf-8?B?YjFFMDA0SXNMSUczMElPNWczOGIwcXBqWlU0My94L2pNZmJsN0tiVG0zbWZE?=
 =?utf-8?B?WnNuaFppVkhhZzdFd29BQ05zbWdrbnMyKzBuTXcvT1ptNDNpTmJpVENidnNx?=
 =?utf-8?B?bEg1SUxScFZWWGhzNlZZTTEzbDF0YmdyRzBLWUFiK2tyNC91MUlOREltMDJo?=
 =?utf-8?B?YVp2cjBKN0FNNndNR0NSTFBTMW1JcVUrSHN4SWJTT2djblArQTk3bExYRldn?=
 =?utf-8?B?c3FuNFRVYitZY2lYampMVG1ldHlOTTVMdUtUZ0k3NDcyMUkyZW1HajVIZWRO?=
 =?utf-8?B?SmxlODMxNnkxTytqb2xSdm51QmxSNThzY3Bvb3duUzBDenlRdnI5ZnRrdE82?=
 =?utf-8?B?S25xTkF2Uys2dzc4cU1ZNXlGTU1YajlNdUJTZXlCb3JRcm5oRS81aDFYMk1C?=
 =?utf-8?B?KzNkQWpLRGZhMHRtblY3TzJtT21jcnhha3AzdXl5SDR3dXpBclM2MTVNVDY5?=
 =?utf-8?B?UDZ4SFpkS2JtVGhXR000MG1ZVXRZMnNGWDRKTmhGVEd3YXRjdkZ5dTFucEdm?=
 =?utf-8?B?NitPVjJ3Nk5lQXFReTQycEU3Tlh0Q0k2NXBWd1RWL1BuZUJFeWlPYXdDQzRj?=
 =?utf-8?B?UkZMcVdLeUJtRWFXa1RUMHFINHNSUEc5WTROR0lLblJ1RGt5dnZhMklFMitk?=
 =?utf-8?B?MFhxQTlrY0hiSVM2ZERFYUNSYmlRMHNjUGJFUjExV1A0TVMwcTVrVmZLVWcx?=
 =?utf-8?B?Z25xMnc4SEVEMnQzQW94c0VjelJXOXRpMzV1cDRnN1VxdXNQbWJnNTlhWkZP?=
 =?utf-8?B?VDZFQnJ5TzNMUTRORkRqYnVzMUI4ZUtpbDlkMC9PbjBvVi9uNUZNNm9sYlhT?=
 =?utf-8?B?c1pzTytwVkQwbWZyUExBT0U4NUpEdjRXZ0ZpVnVwZWd2OU9vM3pmR3dZQ1Nq?=
 =?utf-8?B?Zk1KNmlrN3p1N3Bvc2xlVDhQSkVCdnlpRXRscDBnRXRkVzJDcjdzUDZkM0ZE?=
 =?utf-8?B?TGdBQ20yazkrdWhveVV1SXpDSFlRNEl0c0RpVURVSHJiWUVYVEs1WmVJSzNv?=
 =?utf-8?B?ZFlZYTJ5ay9NNzF2cG5tRmRadE9pT1doWVVtcjBIaXlzR21lK3ZuVXdGNlFB?=
 =?utf-8?B?YjhHRktBU0dCN2dFYzArV085ZzlhMWlObUVPZ3YyaUg1ck5vWFFPbVhseFlG?=
 =?utf-8?B?ZTI0SUFodEVhK0tsUXRPcy9RN1IrUDlvRzdlZHZmZHNvUysxYWVHOHp5Q0lh?=
 =?utf-8?B?UTFxOXlEL1pQSFNiUVVjbkhVaWh2NXE3SU1SdmNkZGFKUTVvQ2s1WGNvY3FZ?=
 =?utf-8?B?RzE1TWNwcmtHd0FWVEtCQWFUdTRnZWVYcUlVRDNCUWRJMGdPekpOeXI4N2g5?=
 =?utf-8?B?NTZSTDM5M1h5T3p2MGVBMHBoQlVESXpKbUp3S2phWUtTYjM0OEZ3YTNPMjMy?=
 =?utf-8?B?Zkc1bW1ObEFkK2toNGRIYjhlV3V6enZYaHNQcnZZWEdiaEcwYUpFMEZvU1JS?=
 =?utf-8?B?cWQrQ1lrcHh6Y2VQOGNjS3EwM0kvM0kyOGlWbGZOc0k1NkFPby9wNEY4MzdV?=
 =?utf-8?B?RGRFWmtMUytVSlhvV3FjQzRzbnJ4Q0cxeTB5N2FWYnNyenlaTEhVeVE1WnBo?=
 =?utf-8?B?L0FJNmZQZENCV0tQREl3emJDRFN2ajU4ayt2bSt4WHpab3VMd2IwcnlRcWUv?=
 =?utf-8?B?WkxTZUpWdnNhKzhLV1psTEttckFtQXdVaEZuOXZNZzBob1hNNy8rTkNMOXpp?=
 =?utf-8?B?dG1CUGRJTVpDMnpKcS9jWW10RmNTekpKWFlQYkhhcjNlRjV6RWFva0Rlb2RB?=
 =?utf-8?B?dW5OTFJvMlVQNy9Vd05HbWdJTGsrdzVGWmwyenpJb1FzbEwrWVpxS0JlTS9Q?=
 =?utf-8?B?V0F3Z3VhajhGdktPdUg3UkxpZ2ovb3lwQ0lyR1cyK3hpdmcvanBndz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8515cae-639e-4d7f-71e4-08de658f5e8f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 14:52:37.5926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UX4iOYZyS8/RuFzZS0//OtPEZfIwdwH4BgdwtC6te7nBTHOLTqvRKbZmi5uOsa/2TlTgWdyoTgnNARgz+fWr9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5708
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lizhi.hou@amd.com,m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C782FFF433
X-Rspamd-Action: no action



On 2/6/2026 12:02 AM, Lizhi Hou wrote:
> Preempt commands are only supported when submitted as chained commands.
> To ensure preempt support works consistently, always submit commands in
> chained command format.
> 
> Set force_cmdlist to true so that single commands are filled using the
> chained command layout, enabling correct handling of preempt commands.
> 
> Fixes: 3a0ff7b98af4 ("accel/amdxdna: Support preemption requests")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>   drivers/accel/amdxdna/aie2_ctx.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
> index 37d05f2e986f..6378a0bc7b6e 100644
> --- a/drivers/accel/amdxdna/aie2_ctx.c
> +++ b/drivers/accel/amdxdna/aie2_ctx.c
> @@ -23,9 +23,9 @@
>   #include "amdxdna_pci_drv.h"
>   #include "amdxdna_pm.h"
>   
> -static bool force_cmdlist;
> +static bool force_cmdlist = true;
>   module_param(force_cmdlist, bool, 0600);
> -MODULE_PARM_DESC(force_cmdlist, "Force use command list (Default false)");
> +MODULE_PARM_DESC(force_cmdlist, "Force use command list (Default true)");
>   
>   #define HWCTX_MAX_TIMEOUT	60000 /* milliseconds */
>   

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
