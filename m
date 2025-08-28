Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 711BAB3ACE7
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 23:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB98410E07B;
	Thu, 28 Aug 2025 21:45:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FouTY2hx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2062.outbound.protection.outlook.com [40.107.95.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F6BE10E07B;
 Thu, 28 Aug 2025 21:45:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A40uo6ZuHPlsLmpiClTZRHkM5AOrbft9GnABio5i+ZEJg14jacUjyJBJTNt3nx2ACv5+RdCS8I1+M6wZTb4R1mCK6nH6uFBn+fXhAvZDDm9DB2nXOZr6PqGpGIHvtvXUshtvwpfB1al5kejSwI1dDk0F8sQXh0tbhUyXIg0dRYkD8CNFxiz+vmdjCBwbQbQbHNdS5UNpxd+qX7opBIpSxXqx2iCHBYxZksJoJEqChgzhBTCPL+A+/6kxO5HcN+COoPhSDzKkgetG4BXT42miVnaxZXWBEGGcR78wwD/zxC7teevt8TQEC/EeRHVcfqY1onNPeY6r1Ld1pchhaW+o7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lns+Gi/gfyoZAst94ErPu8odJ9XCzMQWW9ICwkAqKfo=;
 b=OLTGFAwarwQdF4yc4TwBgo7OOZcIfGWJvuFSVeAtFi9IiQKdd6L/MJza3OQjkQyAjtmACZ+kCIY7JmBKiug0inTn8Rgh2nP1zjwuUn8KJs2FcJ0Sdx9kumC0gualFwsysjwiQIyFAqsek/SX1vXuhn3F+/x3vWavtyxk8MW20B3mWuiXNPTY+kDl8D7/JzuaJlFZhePvHgmsa5iFq4I0IrEqH7VDrS9Cag/oMqKJac8MrgoBnsvp7KF7zMnZRaFsjDmnRzGlFRkpMBwlkxVANQBENvmwYqCW5yRLdhoiDGowwirP6MVS7mT7aQDWG/1AzDfjfnXM7ziiCw5eoJPaPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lns+Gi/gfyoZAst94ErPu8odJ9XCzMQWW9ICwkAqKfo=;
 b=FouTY2hxqKBZzWvrfe4E+DpkwUAfmjTdqnBpF11Rtg8h3lwW91n+TFqjMI2H7I8A7J2b+xp9U1qdLdtvI7ZUjAVsyQMAz4yuXLvznSFhyzDMzAFKOwc5EPKOEXsX5Fc9sZLABmhGgutEQAlovG6/hz0Cp6mN3VxIDMY6rLCN6Wfj6J8tXU+p9jZ0UGQ36y2h2DCOpKLGRC6lHxGzOmqGAj3sPlJIWmpIH6AE/qntruuZGyDFMlpRNCKlw0wyqfzGlCMb3bqpnJzo7hXiGk/Svt8e3CmHlh783fWBa/s+yImOm9tachxegYSBXB2LCJc08ZnVqIegPCigz7n7eOQhmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by IA0PR12MB7506.namprd12.prod.outlook.com (2603:10b6:208:442::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Thu, 28 Aug
 2025 21:45:45 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%6]) with mapi id 15.20.9073.010; Thu, 28 Aug 2025
 21:45:45 +0000
Message-ID: <bc2b45b0-eb0f-4519-a398-2f0707d45d80@nvidia.com>
Date: Thu, 28 Aug 2025 14:45:43 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: gpu: nova-core: arm32 build errors
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250828160247.37492-1-ojeda@kernel.org>
 <b680c343-ba97-4eb4-b426-56e318dce492@kernel.org>
 <DCEB1J2P3MZS.3IGXEYP0MAC5H@kernel.org>
 <CANiq72mkPqFnb4ztiCokE6+ntVSmgOTgERshg-4SMmLboFOqNg@mail.gmail.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <CANiq72mkPqFnb4ztiCokE6+ntVSmgOTgERshg-4SMmLboFOqNg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR17CA0056.namprd17.prod.outlook.com
 (2603:10b6:a03:167::33) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|IA0PR12MB7506:EE_
X-MS-Office365-Filtering-Correlation-Id: 82bdf7aa-209e-4ba7-04e1-08dde67c3e35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VFBUY1BLQ0JVK2ZGcmU0aUd1TXZ1STlpeHhNTVJIdG5sVVZFRzFZcUNmb0tw?=
 =?utf-8?B?a0E5T1pQaVA3bW1jajY3NDI2T0lra0dyQk8wRlBZbURZOE9jblNzQmV0alRz?=
 =?utf-8?B?bnJOUUZNSDZmRU9sd0x6MDhmQ0dUbWtZY2FiN0pUWElGc0d0ajh3N2JOTUlq?=
 =?utf-8?B?R2hYMk9UM0c2cGpHMVNaWnJQTWVVY29XMzF3S3NYVEs3WHRVb1EyY2FXcWFj?=
 =?utf-8?B?eGpmc2JUWGtDVzZMaEF4aHM2aE1qL3I2aEJMUktIU1l5YkpPbCtZRHIzbUl1?=
 =?utf-8?B?QTQrOTB5eWZpK1lvUFpmMHJ0aWV0RzVUNS8rWWt3ZEd1NVJKaklPYVJzSEU2?=
 =?utf-8?B?YlRmT3RwcGk2aDNub2daVmtLditzWFQwRklQNjBkV1J3S3kvd0o2WGMvbmMz?=
 =?utf-8?B?Q2FTZ3dDZitNMmNrWm9BSjJuVUFzTjRuc1RsSmErZ0hSSENwZHEvUmNHQ0RO?=
 =?utf-8?B?NzJzYW5SeEVZUytZNXhoaGQyK09reStLNUNRVU5aRGJVQjZrTzdLT0dPOWpp?=
 =?utf-8?B?YmJKWWdnQUZ0OWZvcDV6NzRKMHJpUFM0b09GSk13ZTNvMWR3UmRBKzU0RCtE?=
 =?utf-8?B?U1BEazFnY09ERlhXUWVzTm11cWFYd2phbGZWeUxFeFM2NTlrcUNiekxnc3Y3?=
 =?utf-8?B?aEkwOC9KSmsxL3g1Q3R5SktpeGpnVU1xNjgvZGRVeEJBTHUxU3FiY2FmdkJH?=
 =?utf-8?B?QkNyZzVZNDZsZDd5WVl2Mlg5c2xyWVFrY1k1TldVUml2Z1VDSmVReWx4MGlJ?=
 =?utf-8?B?RGhhVGRQUHBZVmN4OFkrQkpqNkFEUnN2T0lUYlVDSWhlbU4zTDlhcklBMm1i?=
 =?utf-8?B?SS9xZXFiOWIydVdEcUNpVkNOcjBnQVlObVROdEd4Tzc5dUNsUWpuS1NialVo?=
 =?utf-8?B?RUx3ZEtCUmZHb0lTM3hMYlFGZ3B4V09MUnJ5bFA1elByWjJBR1B2T0dQRGFR?=
 =?utf-8?B?c2VsRFFSOTJ3d1JsSnBVMGZReHZtWUVueWVVc1Jra3dzVHR2VU1WaWVRNjkv?=
 =?utf-8?B?aXFKdm03VDAza3lDM0VRTndWZnBFcm1kbkdYbWs1VjVKcFllRk1yNkdzdWRo?=
 =?utf-8?B?bVdMaFVzdWt4bmpLa2FvQ1hDazJ5b1ZkU2M3NEdZT3hCVWMvMi9kdjZZK3Zw?=
 =?utf-8?B?MXBlWnV3eVo2RXJvelcxN0ROakZ4SEc1cGkvanFMRTN3T0cwQlNIRnI4Snl1?=
 =?utf-8?B?R0NGSlEyWlBhTEU3TXVNVXEzR2VKcmZRUjRPek5GMlQ2cWVMczFTOC9XQ1py?=
 =?utf-8?B?SVJiVjIzZCtpUnJSenlWYzU4aEduWFU4T212ajFwaDJSdDFGcjY3ZWNtOVFR?=
 =?utf-8?B?RDVZekVaQnBJL2NCZTBMbGRkU3lNV3E4VFhMcTJ5VEgxUnRDV25uNForRmh2?=
 =?utf-8?B?M1JnRktWeHRjbjFodUNXSnljU0lWMlhTdlcxaUNOSzN0UitFUW10WEJrd3dK?=
 =?utf-8?B?blFiRkIrVFE4cUZ0QUFkU0VmTW5NTy9qTTFxREJOMlNpTnozNkozUXdUZnU2?=
 =?utf-8?B?aExudmdIOTJpZE1FN24yb1BwQ0lZYXBmRzZxWFdkQzhJTW5TTFhqcFdiM2pJ?=
 =?utf-8?B?blNpZGxJQWNzclowbGJUSGliRmZSZnp4dXRyQllFeUdCaWk2Z3FGVUVFQVZG?=
 =?utf-8?B?cVpzZEdPcWhKT3B2TE9HNldxSkZhSWV0ZnoxMlNoV1F1TjFGc00wZzVISFRQ?=
 =?utf-8?B?bnBLZWVqQm4vUjZNbjlVUEVNUU1xSUI3ckpyamFDUUhsTVcyQm11b1RCWVVG?=
 =?utf-8?B?RnhXU1lFa3c2L1Z6THFDOGVDY1djYU9RSEhPaHZVSWhCU0lTMzVPK0pWUlVV?=
 =?utf-8?B?S3ErZHFITklYbDY3MlI1bVgrczdpdFgwZHRVOWIrb1RQLzNNeC9PWWJoaTBC?=
 =?utf-8?B?UWlMa0FoYitIZkhQT1ZmRkIzQk54QUFtN015NEdYa1RjVEE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5968.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGJkMUxwU1ZlaUFQcEY1c1JpRW9zZWlhUUNQRlRkbHNyMUxmU2UvQjNwRk81?=
 =?utf-8?B?QkVBU0NRU2JLTVNxa0tXM0hlY2EvemtVUHBsMEtVRE9vcEltaFRlY3B5RVZZ?=
 =?utf-8?B?R0dZQzRpTm9vWkJ4cDRyemFmS3VlV0V5MXBBSHVXMWhZSnU0OHBHZmp0clc0?=
 =?utf-8?B?d0tnYi8yUnVvVU1aUVZ5Z2Z4QjRmcitQSS9ZdHdNaGllZmtjeUFJTkJUVW44?=
 =?utf-8?B?S08zRVBkZzB4S1doUzNqeUNCeVpoUWtJL2VHZTRwOGh2QzZtNnZLLzRCU1l1?=
 =?utf-8?B?Szd0a2NSNDAxQmxmcEVneXhLaUVvZFVEN3pmZ3NScmN6U3NjVW1VWG1CK3N1?=
 =?utf-8?B?L1FPb0QvakcyR3FTUGo3Q2I5TDBpNFlRZVVnUlMrK05nd0s0Q0pDWjBqSDRZ?=
 =?utf-8?B?aWprUjRkMU1jUW9MTTkveHZ4VXRHandsWWgwRW9iOWVmR1BHQllOYSsxdXVD?=
 =?utf-8?B?Y1dOczNBMFVqQVZkZXFsUDg5V1dhNjRIbTFEeWRvWTlWdURsK1pRdjBWcXZG?=
 =?utf-8?B?cElsUERZSCtrSFQ2Zzl6bU9TN0NIbk5iMHV5YTBNNVZWU2ZGSnFuQzFoZ3Z5?=
 =?utf-8?B?TStaUitFd1BpSVZMbmt2Yys3QVE1czBrRWNoNllCUHc2cFNCMERpNjJ5amMw?=
 =?utf-8?B?QkNrbVJ2L3VtamllUm9rZ0hLd0hxLzJtQk9CNVl1bGFmZE5hTWxJcHRiaXVC?=
 =?utf-8?B?S2RxUFRNUTJtcU84Z3U4TnFMNloxRjZBdGdaRkdnK1lqV2Y4aEV0K3l6bGhU?=
 =?utf-8?B?OW0ycEo1Vm5ic2RQSzBUTTVQK0wzN2I4V2R6eFlzaU82aGpPZVovQlpScEpO?=
 =?utf-8?B?MW9pQXpJYjR5MlRpd29FNzQ1T1NoYjV5ekRweDI5YWFWYTBWNWFsbUdKR0tK?=
 =?utf-8?B?MmNjNEJVNTJaVC9adm0xN3Mwa2ZJWFdwc3RoRFVsczh3d3VWYWNWbTBRNnR2?=
 =?utf-8?B?QnJYSUFiWWV5M09CMDA5WElMUjZrYjZLdFpwWXlkTENmWkNhSWsweHVBL3p0?=
 =?utf-8?B?YXdjMDNsOG9xTlZWaVFiTGhhVWhOSGNqa0VXdUtTaXdZNmtLZ0JTOUJxbzRv?=
 =?utf-8?B?S3I2UGtlWmNMcU1HcU4wZGNMSzBuRTN3U0x2cU02dTNIU1VyeTBOWjNyQ2U4?=
 =?utf-8?B?M2ozeTUzcTNrQmJxRFBxR1dHVGkzeVNLWnpUOHB5QkNlTnhCa04rUUs4Tmxv?=
 =?utf-8?B?d2JlbE1uY3gxS295T2hCa3FpRkRJZzBmWEZ2T2hhSnhYNG42bGExMEMxTU1N?=
 =?utf-8?B?Ymc0L1l0ZGxna3YwM2hhM2VvUzhFeis4aWZpUjFpU00rNDl6TFdnc05ydzFM?=
 =?utf-8?B?TUY2Z1VJRzhYWExkbk5hRFpzT0JNQ05kTTFuVU5EU1JJNE4wOHk5dUovV3o5?=
 =?utf-8?B?Y3ZDcEhhM0ZadjZlbmNDNlBoYU1UemVGbllxZ0h5YWV3d0tyazg2NC8wSDhV?=
 =?utf-8?B?TFNlZEp1MDk3L0hCYjNhRkJtR1ZiNlVYUjdoQmpRSVBRUFd3VUNqcjBDOVVB?=
 =?utf-8?B?ZnRZcjNXK1RTbGlRMExMWFF3Mk5Ma1ZobmRxZS9rVDR6U3Q3OHUrY1NDS0ZQ?=
 =?utf-8?B?MXA2U1g3bU1SaXVRU3BmNWpsZWxXNTdTVDZSdXJkWnozSFA3MjFJRWJGYlpW?=
 =?utf-8?B?elJoR0g1RTQzVkxMeDFhNnFYUTRCaS92OHZyT1VuTGpMTGF1SVdQWnE5bytG?=
 =?utf-8?B?SmhCYUJPenVVcG5IYzVQRW91a0JPNlczMS9DZkpPS01HZWJodG1PMHFwT2l6?=
 =?utf-8?B?Sk5zZjJkNGk1WFh2VFlod1R5cmw4Ykw4anVLazdrQ3dENFN3T1NaSlI3ZWt1?=
 =?utf-8?B?Vm95MkhXb3FmVC9QQVhhMm55UFFjeG8zMEdZZTV3M2Z3L2FOdUErcTFSb1h6?=
 =?utf-8?B?UlNBN21jZWo4dk4xOVpNWTQ0QXBvbVM5WWhVeGJBSG1xU0tSRjJ1OTlzNDBM?=
 =?utf-8?B?L0RIbVFXYTVSR2FKMk1xV2pkemVqaGtIdTJyWGxPVHBUdGdabE0yUVdCaWYz?=
 =?utf-8?B?Zk9ZSitPNXdjZWhHSTJKalBoY0lWSFMxc3l4NkFmeUJybG43aUppV043L3pw?=
 =?utf-8?B?Q1o1dE11dEpBZGRiRmR2ZVg4RVd5Q0FCcVpGV3VOZVhRQXhWTTNxL0xLM2My?=
 =?utf-8?Q?vhXpgPl57/jfEjYi8gMjsvLIW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82bdf7aa-209e-4ba7-04e1-08dde67c3e35
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 21:45:45.1977 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h7l0fgn7eKN9LTkm371bPimXicTavScPzlPiPmH9Ts0hB410yXIez+rY+To3ZPuQy3veXuGVCJ5c6OT5TUbX/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7506
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

On 8/28/25 12:31 PM, Miguel Ojeda wrote:
> On Thu, Aug 28, 2025 at 9:24 PM Danilo Krummrich <dakr@kernel.org> wrote:
>>
>> Maybe I spoke too soon, it's actually pretty painful to keep 32-bit
>> compatibility, even though it would be nice for testing purposes.
>>
>> I'll paste the diff to fix it below, I think that makes it obvious why I say
>> that.
>>
>> Instead, we should really just depend on CONFIG_64BIT (which implies
>> ARCH_DMA_ADDR_T_64BIT).

Yes yes yes. :)

> 
> Yeah, it isn't great.
> 
> If it were just that, maybe it it is worth it (and a `DmaAddress`
> newtype, not just a typedef, could perhaps be nice anyway?), but if
> you think it will become increasingly painful later, then it may be

Oh yes, this is just the tip of the iceberg.

> best to focus on what matters.
> 
> It is unlikely there is going to be actual users on a 32-bit platform, right?

Completely not going to happen, actually. The Open RM driver dropped
support for 32-bit platforms in *2018*, and Nova and Open RM have...a
relationship. For example, they use the same identical firmware (GSP etc).
And so it is inconceivable that we would attempt 32-bit support in
Nova.

So Nova should definitely depend upon 64-bit configs.


thanks,
-- 
John Hubbard

