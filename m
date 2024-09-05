Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD32796D12D
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 10:02:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4729710E756;
	Thu,  5 Sep 2024 08:02:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="k5yTlluH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2053.outbound.protection.outlook.com [40.107.101.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3787110E0C8
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 08:02:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K+3aY0kDRJ8EL+y2OjpjSxniUT1NjFrnPwJAILpCN0cbXSCcOsgdgLyG58+X/aBp9AwTr2IBaKKlJnUMLPEyc+PYSu/5CVk2a4cwXmPM1L9s+xzIEVUFJ5s1e83NzlkDQv72KvRf8D6fAw0x5egfvk/7L37vfgZXfy4j0AtTlQFuoqsaOpsjXtd+7oFBY1jWm33hbtVKZYoOB10LECJ07fmHQH9sFYWD9kZm7eOZ/amGp3RBiZDP5pjyN4+yBf/rsu2bE3I40++pthvfzLEQyGdyWZE3h7asP5XugAB7wCGHe6nZs6qeV0SUQ3SfZJQ/Iqx/7kOgTikwqObJBlRyVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nmVgUUC8bvTAABlhnT+6PBVSYHvqWkU945pV7Pd2RnI=;
 b=L54/sv/PGg1peoqgLLIQtGLwtTomw4+HacZTXX6PARRNXpUEYnQXY4ti5LuHVQS2/087nqC1Gc48IZnT3pwRxzjfZsFM8CHmtqR+Cl9cW3DvvbDSNJ4gjJC4Fw/feHMuQ9qVoJ0781AUkaHnJlnncTuAdZolVo2HZoI1QBA7w/JOqmmpe6g7hIzOGzb0mgscNoEbyewo7sR1d+xYdsAZFpI/7Fjplm5JWK63UzdTpyTmn7iUjTcXzfXIknl0ChO2nSoDnH7i+baQJnRk3imCTNfStBXpE1Q1hgXU1q7sd3gwiyerS7r5Q/73etNFtLH5Zbdiv1e9l5VVrrZVweBamg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nmVgUUC8bvTAABlhnT+6PBVSYHvqWkU945pV7Pd2RnI=;
 b=k5yTlluHRYwArtIxdV3CHsF+TB3Tkghd3mwUkBoAXLj4JE78wzhJ+Er/kUL/vmT8ZxyCfK3OaKGtypQXpTW/vP1sUxGtBKv/eDPb0aBerYCQx08tlLXsjWw8lMJi9aN3KpCNEGNCtZTFj4wZrtNTKGBSsYGVITwKU5AZ9HIC3q4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CYXPR12MB9339.namprd12.prod.outlook.com (2603:10b6:930:d5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Thu, 5 Sep
 2024 08:02:07 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 08:02:07 +0000
Message-ID: <30aa1b85-5c38-4e96-9217-7e0208fd0f6b@amd.com>
Date: Thu, 5 Sep 2024 10:01:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/4] dma-buf: heaps: restricted_heap: add no_map
 attribute
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>, Sumit Garg
 <sumit.garg@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
 <20240830070351.2855919-2-jens.wiklander@linaro.org>
 <4a498990-2d9e-4555-85f3-d1d22e26b9dd@amd.com>
 <CAHUa44G9yF2GoQD8XrE=agkGCditH1v+NYm16WpdORX4aRixYg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAHUa44G9yF2GoQD8XrE=agkGCditH1v+NYm16WpdORX4aRixYg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CYXPR12MB9339:EE_
X-MS-Office365-Filtering-Correlation-Id: b5714079-a33e-48de-2436-08dccd810946
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SXV0Z1VwU3J6enlsY3c3WFF5V0dFOVc0aVNNbDViZ0RRUUhoVklCOUdmL1dV?=
 =?utf-8?B?ck5haWI1Njk0a3FXc2puSGIxczc5cS8weG84aXRFV1k1T250OUhIQ2dHd016?=
 =?utf-8?B?M0gwQnJMcFo5NHVMd1ZKM1l5R1BLN0xiZUJVV2lXWE1hWnVlTUpyOEU2M3Z5?=
 =?utf-8?B?cUllc2s0bDBFdnVyNFh4c2FaNzlvSlF4bUluMnFmcjViQVF6Z1VlVDhZNzBI?=
 =?utf-8?B?YW8xa095YXFaQW52dk5hd2QwcFdEdDFYWEcrV3JZVmczODNydGp4cWlTUENQ?=
 =?utf-8?B?WnMyVlczaEk3ZEdVeHdTRXR1djVyNlNITnJqbnFKVFp4YVVSdWtldDZxQnN6?=
 =?utf-8?B?dkxydXdEc1Mvb2w5V2FtbWozLzhlZlVheEdjMzRXZkhsRERDZGxxSjJudi9j?=
 =?utf-8?B?RElJcFhUbmhCZXBaYzFFTm96UGdNOG1wbVNTaEdxWXROam1qSmt0dk1TK1Vs?=
 =?utf-8?B?b1NYRHNLbXlhcldyN2ErdklHaVZKc0pzaSttQllQV3EzbmZONEJRazRoZE91?=
 =?utf-8?B?ZjA0dE1nOWlTeEQ3czNsS09PUWJtVWdCNjI5UlRjbGNnWUtXajZ0MTQzOGtt?=
 =?utf-8?B?bUJia3ZaWWhRMFpwbWNBZktTQmRNdWlxZUlWTmZZSmo0QmhuSGxQaVpFVzJt?=
 =?utf-8?B?SXVjcmpycDBzOE5URm9vby9hc0VZR0diVXF3c2p1NE83TUdQR1dlL2tFeEgx?=
 =?utf-8?B?QTZxZzV2RS9QZnRycm9hdjQyeGU4U0JMVmNGVUNmZlE3Wml6R0E1U1l4S1NQ?=
 =?utf-8?B?Y2RpUnR1U0RjZ0wvOGd1d0dxak11WUFhSnlYblE0TThEYm8rTytZRUpQa1Ro?=
 =?utf-8?B?bnBLWnBPNGNhT3B2REFhQ1VzaFRsdFBKZVA1ZmlYN2pNZTg3VjBRaDRDVzZZ?=
 =?utf-8?B?RHMrUElvV2I0NlI3RGkydkJBenhucjFwMEdtSnZJTU1JVkpmV1liQnRNT1Ur?=
 =?utf-8?B?UXJZWEY1b3ptQmN1TjN3cHcyalpvQUhtdUVWN3ZOL2Fzc2YvS1lOaGx5aEoz?=
 =?utf-8?B?NUFMWkZLK0NCR2xuQVpmVmdwZzUrTEc4YTFoUDBxaU9DOTVlWUM4bXdiNEt0?=
 =?utf-8?B?MFNPdnp5WWNLa1N3bmxLbDNndEgvdDRGOUc3d042L09qQnJIZXU0ZE93NVVL?=
 =?utf-8?B?bk5uaUlkTmFqRmFvd2FxZndjWjRNblBZVkJSVW9JVnFBUWpYSFhtdWRIQWZE?=
 =?utf-8?B?amxSREsreTJIK2xpcjhaZ0RuN0pFd3o4dFZXdFJhaVhmc0t5VTlWV0trTFM2?=
 =?utf-8?B?UyttYUp4WWduR2g3dENxNTZjUnE1M0dHS1NSOU1uUldMVHZqTkZxdUJCMVVL?=
 =?utf-8?B?Y09MTzlhdG83VnlXYkNkY3Z5WmQ5NHEyU3hWL2kyMXZ6ZFYzaTM4WGVPSDRW?=
 =?utf-8?B?MDlmU05sMnBrWU9PTUNTWU8yc1dMNE42Vk15V0FXeDJkcitjbEthZzJYQmp3?=
 =?utf-8?B?eklXVVF4Z2NHdGhvLzlIak1vVFErdlBxY1Y0V2kyWmxiR1ViTDhLU1lSOFZN?=
 =?utf-8?B?NlhFeFFsT2gxSmVIKzRmc3pmOXVCTzR0ZHQwZHA5YVNGWWJoVy9UQ3Z4OXJx?=
 =?utf-8?B?ZzNNWk1KbmUwbE44SGdsVG9OK3dpN0xsdWFtNGYrSUZMcnR1UzB1WnBQQUhO?=
 =?utf-8?B?bGZ0cUZ0L3dWTURYS0hhOG1LQ0ZKbDJFSWdnMmN3NXdPTERJeWY3bVFGOTFr?=
 =?utf-8?B?d1I5L2t5V0d2YTRBVVF5MGFxekxRa1JpR2Q0azhtU0NXMC9SS1h5VEdVN2xX?=
 =?utf-8?B?UnArNHo3Wk02a3RGM2JzSks1MXg2VGFNaGpSM1RadU9lTmxqNHdRVnJvNjJu?=
 =?utf-8?B?MnJ3cWEvTVZQdUZSUWxUZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmdCcGJSdE9hUjJzcnREbmh6TmZ2aHJ5MURYTmFGSXJWZERoL0FOWDlmRHJO?=
 =?utf-8?B?ajB1WFlIL002Ulk2OXZQVFIxZkREeFBRcEhoTmN5OEhCQjJFYVFJOS9WUGdW?=
 =?utf-8?B?c1Zud0JPb2IzU3ZJeGJrZHVTRHU4OFZSOTIvY2xxVkhaYzJJT3Y5N0dlT2Vn?=
 =?utf-8?B?OG1zckplYnV0VGxuS2pQMXBqSXcwYUhRVmxuaWxDOFpvT0s2WCtLNkJXWTJM?=
 =?utf-8?B?T29GNUZBZVBXU1F0dFpRVFZOb21CcGIrTnpZcHVLYW1Nd0syQ2h2VXdROFY5?=
 =?utf-8?B?cXQ3bVkrYzZzc09WTlFQVk1EMFZnalQwTCtheWJ4c0c5T2Y3Szc3eFpvbG1N?=
 =?utf-8?B?TGRpV0lLNHgzQUtEQnM1d0dzTTNqKzVmbDBWOGNEWTFrWkszV1BoMkVXOCt3?=
 =?utf-8?B?TllJSklGeFlHOFdmdlBQMU5nYTlpSTdxZmJSSC9mMTVIOHFCNGZ5UXRNbzFZ?=
 =?utf-8?B?U2lxQkpuL2RybElIcmU0R3B6Zk9WNzBiVXVJQTluRnlSQ2ZyQXhRZTE2ZlNj?=
 =?utf-8?B?aWt4NnlnSy82ZjBWdCtONnJPOUduR01USXlROUhmQUNKelRUWXMxWlpPeExG?=
 =?utf-8?B?Zk1HK0hQN0wxRzdMZzhUdHNIcmJsUmdNMXV2Z092blNXSnpWQWdzTHdvMUgr?=
 =?utf-8?B?UkJjaTBsNGxmODZPNzB2QWJPamsxeUUzcHdMTnIvWENzYlZGeTFvVHpyK2Qr?=
 =?utf-8?B?V2xjUmV1Wm14S1lVYU1WNStXcTVXTjVIZytQUGlKcXFNNzkvR1hESDQvanRp?=
 =?utf-8?B?byt2dWhnNldQMXdtb09GR1ljNGhKMUc1R3pqZjRrRVBhRG4rd0FaTjNRcWFJ?=
 =?utf-8?B?Ukw3ZUh4RnhVYWE2bDh4bWNhekJBYmcrQUZFMHhHZUIwWUhYeVhFM083enhx?=
 =?utf-8?B?eGdCdlVuMTlFd3JIWEcveE9nUzVjemJHckdpblhXOWE3aXB6VTBkV056R0V2?=
 =?utf-8?B?MkVUcTFyNDVjSjhOZWRGV0lxZFlzeTFUWkdZeTZFUGNTMkY2b2N3ajcrV1FU?=
 =?utf-8?B?SkFJdnh0Q3RwaStkZzYyNkxMUXdCYU5sSk5xMGxIYWdoWko4bjJWa1hnVnJH?=
 =?utf-8?B?UzFRTTAxVWhQN3d2WGdzaDZvYnBpRURSd1EvN25HTVFoOXdJOXJCV1JlT3dG?=
 =?utf-8?B?cnRSNFl6YVQ1L0pWT3g1clNWUXdoSUZ4OFlock1USkhmOGRXdkFUZS9seUQx?=
 =?utf-8?B?dWhRTGlvekttTGtwVitzUGttY0hOeFhjeWhURTZCc0x6ckdjdm5KMjI2UlVT?=
 =?utf-8?B?eXplYW5uRUNGMVgwemhLckxqSmVhaU5tZElhNHBXZEF2YkkxZkZEc1IxYXE4?=
 =?utf-8?B?c2ljd2ZCZTArejZScU56TWptRHp1K1pYaHY1V2wyWEY1RUNOWGdhMEJCcTVv?=
 =?utf-8?B?RVpaS0ZFZmROQTlDc3dHbFRXcXc0T3RhdFB6TzFGL1BiUWtVNG80Wkt0cDdD?=
 =?utf-8?B?VTFIZWIydFpzYzcxdU1DWDhTQVowOHo5NGVxdWZXL3dRQkMrZFYzN2U3djJZ?=
 =?utf-8?B?SGpUNWpLYjZjVENpK3VpS0M0eE8zVVJZOFk0T0lCVE9sUnZLUjN2VXRqUStr?=
 =?utf-8?B?bVFhWFZHWVFXYytuWlpxSVFmNHY3eVFxYmkzYVFITDhVa3ZIRlVCSys2VmZF?=
 =?utf-8?B?TmxnekdtcW0wMDY3ZlVJUFpUU01yRnQra09JSTFLTm5tVFIrVmZOY1NZbHJ3?=
 =?utf-8?B?QS8rOVBWZVVlL1g2LzAwRWpUbXZlR0ZMTTBuYy9OZUF3TVZjZ3dkT3RXN3Yw?=
 =?utf-8?B?VGwyaFZWOGZxNW41VTcrL1VWYk1tOHNGOXdCVWhNZFdsRWFESHRaYmxUMDFV?=
 =?utf-8?B?TXRPLzRBRmx0MnM5dzVzamI5MHJKbHZMVzlkVDFiQVMrQXg1NUZGK3FKTkdO?=
 =?utf-8?B?c2t5L1R4QWgzMFZjVmJ1NkN0ZFp0OXRYK082VGJZRXNBRkVwNUVCMnhiNEJx?=
 =?utf-8?B?dkV1anpIZEpIUytiYzJRV0w1eU1tcGpEWSs3RWUwRGpuelZGTEJocXc1T2ll?=
 =?utf-8?B?TlNCaURwdFYrOHppa1QyeFowckxRZlA2TW5KVW1SeXJ1eDRrYldVQWkxYkJa?=
 =?utf-8?B?akVLdkVTaSt4dWlWcm5temNqQXE5eWtiWFZBN1RmUEtpcVU3ZCtUTnBBY3V2?=
 =?utf-8?Q?BiR95xVrknPWE4YwHx3T97kid?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5714079-a33e-48de-2436-08dccd810946
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 08:02:07.0913 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D+t4H0XkRrzEgtGB56MVBcSORS52nxzPnrqsEoHwICCXrNbD5OS2ioKg4n0Py5rz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9339
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

Am 05.09.24 um 08:56 schrieb Jens Wiklander:
> On Fri, Aug 30, 2024 at 10:47 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 30.08.24 um 09:03 schrieb Jens Wiklander:
>>> Add a no_map attribute to struct restricted_heap_attachment and struct
>>> restricted_heap to skip the call to dma_map_sgtable() if set. This
>>> avoids trying to map a dma-buf that doens't refer to memory accessible
>>> by the kernel.
>> You seem to have a misunderstanding here dma_map_sgtable() is called to
>> map a table into IOMMU and not any kernel address space.
>>
>> So please explain why you need that?
> You're right, I had misunderstood dma_map_sgtable(). There's no need
> for the no_map attribute, so I'll remove it.
>
> Perhaps you have a suggestion on how to fix a problem when using
> dma_map_sgtable()?
>
> Without it, I'll have to assign a pointer to teedev->dev.dma_mask when
> using the restricted heap with the OP-TEE driver or there will be a
> warning in __dma_map_sg_attrs() ending with a failure when trying to
> register the dma-buf fd. OP-TEE is probed with a platform device, and
> taking the dma_mask pointer from that device works. Is that a good
> approach or is there a better way of assigning dma_mask?

Mhm, I don't know the full picture so I have to make some assumptions.

The teedev is just a virtual device which represents the restricted 
memory access paths of a real device?

If that is true then taking the dma-mask from the real device is most 
likely the right thing to do.

Regards,
Christian.

>
> Thanks,
> Jens
>
>> Regards,
>> Christian.
>>
>>> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
>>> ---
>>>    drivers/dma-buf/heaps/restricted_heap.c | 17 +++++++++++++----
>>>    drivers/dma-buf/heaps/restricted_heap.h |  2 ++
>>>    2 files changed, 15 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/dma-buf/heaps/restricted_heap.c b/drivers/dma-buf/heaps/restricted_heap.c
>>> index 8bc8a5e3f969..4bf28e3727ca 100644
>>> --- a/drivers/dma-buf/heaps/restricted_heap.c
>>> +++ b/drivers/dma-buf/heaps/restricted_heap.c
>>> @@ -16,6 +16,7 @@
>>>    struct restricted_heap_attachment {
>>>        struct sg_table                 *table;
>>>        struct device                   *dev;
>>> +     bool no_map;
>>>    };
>>>
>>>    static int
>>> @@ -54,6 +55,8 @@ restricted_heap_memory_free(struct restricted_heap *rheap, struct restricted_buf
>>>    static int restricted_heap_attach(struct dma_buf *dmabuf, struct dma_buf_attachment *attachment)
>>>    {
>>>        struct restricted_buffer *restricted_buf = dmabuf->priv;
>>> +     struct dma_heap *heap = restricted_buf->heap;
>>> +     struct restricted_heap *rheap = dma_heap_get_drvdata(heap);
>>>        struct restricted_heap_attachment *a;
>>>        struct sg_table *table;
>>>
>>> @@ -70,6 +73,7 @@ static int restricted_heap_attach(struct dma_buf *dmabuf, struct dma_buf_attachm
>>>        sg_dma_mark_restricted(table->sgl);
>>>        a->table = table;
>>>        a->dev = attachment->dev;
>>> +     a->no_map = rheap->no_map;
>>>        attachment->priv = a;
>>>
>>>        return 0;
>>> @@ -92,9 +96,12 @@ restricted_heap_map_dma_buf(struct dma_buf_attachment *attachment,
>>>        struct sg_table *table = a->table;
>>>        int ret;
>>>
>>> -     ret = dma_map_sgtable(attachment->dev, table, direction, DMA_ATTR_SKIP_CPU_SYNC);
>>> -     if (ret)
>>> -             return ERR_PTR(ret);
>>> +     if (!a->no_map) {
>>> +             ret = dma_map_sgtable(attachment->dev, table, direction,
>>> +                                   DMA_ATTR_SKIP_CPU_SYNC);
>>> +             if (ret)
>>> +                     return ERR_PTR(ret);
>>> +     }
>>>        return table;
>>>    }
>>>
>>> @@ -106,7 +113,9 @@ restricted_heap_unmap_dma_buf(struct dma_buf_attachment *attachment, struct sg_t
>>>
>>>        WARN_ON(a->table != table);
>>>
>>> -     dma_unmap_sgtable(attachment->dev, table, direction, DMA_ATTR_SKIP_CPU_SYNC);
>>> +     if (!a->no_map)
>>> +             dma_unmap_sgtable(attachment->dev, table, direction,
>>> +                               DMA_ATTR_SKIP_CPU_SYNC);
>>>    }
>>>
>>>    static int
>>> diff --git a/drivers/dma-buf/heaps/restricted_heap.h b/drivers/dma-buf/heaps/restricted_heap.h
>>> index 7dec4b8a471b..94cc0842f70d 100644
>>> --- a/drivers/dma-buf/heaps/restricted_heap.h
>>> +++ b/drivers/dma-buf/heaps/restricted_heap.h
>>> @@ -27,6 +27,8 @@ struct restricted_heap {
>>>        unsigned long           cma_paddr;
>>>        unsigned long           cma_size;
>>>
>>> +     bool                    no_map;
>>> +
>>>        void                    *priv_data;
>>>    };
>>>

