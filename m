Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F514C47C77
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 17:08:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D71C10E06F;
	Mon, 10 Nov 2025 16:08:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yPSS3aRN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010066.outbound.protection.outlook.com
 [40.93.198.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 529B810E06F
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 16:08:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MJUpJISgsFNKqE2K+YcTpJltjseqffrabs8+LsOYXeBMhmsrwnjC5Kv3ZHKTCCy91T7BuMnwlte1r+UbLA/PpW+jc0ieoQ06j06zzLDlJh0Iu4DmDkQpd5EMitqregZlzoNyBwX1oYucSxLJUVIxbT4pmtmUamf7AjFokzNEyj5ktfLUNl54394Gmlxq2rp8w8aO1gYz0PrZDQ8Jjw8xSuZUhVqMlINX8jjX2XGXX8axn2wrgbd97Xm3e9rQRUBvZYsilFZUbmTTiQB/lwWfhZ6ABszJ7qss8KNh6litKaZLj4nO0pG6AAfoActXzJk9MKU0+dlbm93GvB6+tCSWtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p1LqqCDaUtiA/v+wmW7NacoD9/18UOWOZEvmpahLmRo=;
 b=PpcXMAUhXXzWPeZ0QzImD25nQ0aAgENHUeZQz3jrDQqxG8SxLVu+3wiOibIHclB+PXVacU/ukpgdZGjCqjgLd/OG/gKrM+GGLa42GTr2TFv4+5fqLE3Y1c/ZxLzPsTOkXg/gEk+PONOBGukt0C8pf0ZsHQ2eJ1A2KeIx9qdriOBgps5VvAg2Us/25tmXtJIn9O6F7ZNqXDSTrbpzK/Enk9jcRjrAT30SLHkogd0yPGWQ7pqQ/PO1olOexoxOFoJF3mgx+HZWAEFC/Z5Q2L/RUwpwhfMaEAS/T0bEbqOTj2pZQBCROxHfS+0i7SW49qB4TPz0+1lk6V5VSXsB5rJ9Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p1LqqCDaUtiA/v+wmW7NacoD9/18UOWOZEvmpahLmRo=;
 b=yPSS3aRNfh0JVlU8f2Tr3fXPFZAwsL7d56o6Ry/MeYJhI60ZIiSsOPCT8Rekcqrq0eYafMWNz4RSoi44tS+SB8rZrHkbR+U/MC7/m0Pgc29TBmMi8EEHiDg1sluVDfF9ofTPI4ZWo7kltnfhqJH7MNfV2vs1S8rNw9dgGhHz23k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ1PR12MB6049.namprd12.prod.outlook.com (2603:10b6:a03:48c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 16:08:17 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 16:08:17 +0000
Message-ID: <a3eefc87-2678-4a4d-82c8-f6aedf74be75@amd.com>
Date: Mon, 10 Nov 2025 17:08:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Fix UB in spsc_queue
To: phasta@kernel.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>, dakr@kernel.org,
 Matthew Brost <matthew.brost@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20251110081903.11539-2-phasta@kernel.org>
 <ee63ca7d-77d2-44d8-973b-7276f8c4d4a5@amd.com>
 <ee9fe54f3764bc0ee4ebafe5c10ad4afe748ef19.camel@mailbox.org>
 <2c72eb6e-7792-4212-b06f-5300bc9a42f9@amd.com>
 <987527ead1fe93877139a9ee8b6d2ee55eefa1ee.camel@mailbox.org>
 <05603d39-0aeb-493e-a1ed-8051a99dfc41@amd.com>
 <589a1be140f3c8623a2647b107a1130289eb00ba.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <589a1be140f3c8623a2647b107a1130289eb00ba.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ1PR12MB6049:EE_
X-MS-Office365-Filtering-Correlation-Id: 614abe3f-66ca-4da9-3f2e-08de20735c11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZmhjZDRBbno2RlFFOGo3aVllNW95MFZRSlpiV1grRU5hVU1nS2taYUEyNFRq?=
 =?utf-8?B?ZVpXeHRaVGNlOVM3SVQ1d200NEdKVkkxcWUxd2RaS3FxZW5yY0taZDZEMVRm?=
 =?utf-8?B?M0RBeTlSbzM3N2IrN1NuMGRvZkxhbGlMRUpmTmxYRW1FVWRmVUYvY3ZMM21Q?=
 =?utf-8?B?bUFmK0hIc1QyVlJHSWEvZmJkcUdTZGQ2MlBkSGorQ21GNk9zaWtBbnJGWXBv?=
 =?utf-8?B?eno4azllL0oxekVDdlFTYzFrRHpwNXdQNVFrMloxS1FuOGsvcG5XQTNRSEhW?=
 =?utf-8?B?VFJCUVQ2dU05a2FweTJDUHoyNDQ1SkpVRURYOTY2MEFwTnpJc05KcDFPVGdm?=
 =?utf-8?B?eXZ2a2s2USs2eUFOOUJHRVpnVURVckY4Qmk1MXVQeWszUldaWVBNVEtMaWNl?=
 =?utf-8?B?UlJqM3B2NmNGaU1sS29HTFZVMmxrZW5nS0ZRb3hYc1BMOFh0d21haE5tS3Vm?=
 =?utf-8?B?QzFZVE1DSUdYTDZjN0lmMW9kVHRkMGhURXUzeFJFTkhuNEZSc0Y5LzM0WkpO?=
 =?utf-8?B?TE9HdG5saEJRYVRpZ2VRbFVSMVlQaXNFUjV6RWtLdFJNR0xYNGR1eU4wUnNk?=
 =?utf-8?B?N1VVT0tsM3B1VmRwRWthREVSYXlGaUdid0h0MWxJNUNLMVE2K2NrbFhwVEc1?=
 =?utf-8?B?Si9QeW5pOTM5YlhXdldMZkUya0RRMjRpRlFvWDRST0wzazRZc05KMGhVZzdu?=
 =?utf-8?B?Y3ZLalpla1RpbjdoWUM0SU9obDhpQ3dNaVh0Q1d3d0pPd2VMTE9oMnpvK01Q?=
 =?utf-8?B?Tm9ubEsxRkZHUFlpcEZPNDFCajdHZ2MzbGhlRVZLdHRKTzBVa0NNRkZHaEYv?=
 =?utf-8?B?VHhtMCtaekhPUFZhRmNlRXRCcUJjSlkvcWpNTE5iK05oMUNaVWpCTU0zUS83?=
 =?utf-8?B?a0pOcUhDYW82WDVMTGJVNTZ0NVBpN2xFYUFQRzJJZ2E1V0g3a1pySTZpK0Ns?=
 =?utf-8?B?MTdsSE5ha1FGS3MwN21FNndRenI2WmRDejlJUHJKN1duTnplempmekZKNXlE?=
 =?utf-8?B?SzFDVHNNNW1qdFFseEI0VVZpdWQrTjMyVE02YnlpbkdnZWpQYlNjZjdnN0ZI?=
 =?utf-8?B?T3g2WkR0aGlUWm1ocWRIeERZYVpFemZwa1BwWHFOSlFmRnhuQlFaYWlDS0FV?=
 =?utf-8?B?MVVrRUtVWFRTNEFTblV1bnMrbEp4M1UyZGx6bU9BZ2hrVXp0QVM1Z2xsOVc3?=
 =?utf-8?B?bWVheEpvNHFleFlwcjJBem0rV1NockVMaGtVYlBpZDJzS3Y3dWhSbVc3VVd2?=
 =?utf-8?B?d1FyUmdCMEZVbythMzRDUnJ0VGM1SUVkdk91SUYzWlhJaXNlMHk0Q040V3oy?=
 =?utf-8?B?VEx2a1ZmQnJkZzRuN1dZa1NmWWRMVmZCTWY2UGtqMFEyM3kvTmhqeVRxbGw1?=
 =?utf-8?B?SzI0bCtvd0F5SndzMVZZN05PaStqdy9uV2EyMjEwV1ZjV3EzUFpkdHo1NkdY?=
 =?utf-8?B?Y1EyZW1yS29uMUg5VnFBTkU2ZEsrQlVTL3lCMlNFdmVQZzlPOVVyZVlNV21F?=
 =?utf-8?B?eVNuQWhweW1zZjRqZDNqdFNmUk1mQ0dRTU13N2ludjBxK1lsOXhhZ3grdjVJ?=
 =?utf-8?B?QnVOSnNvV21Yd3U4ZmN4MGp4VGtVQ2tiMjk4Wng3c2RrVlBOS3d0RkpsVUhJ?=
 =?utf-8?B?R3BzbzQ3ME54WjBvcVJCUGNVYWIrcUY3S05DK0xNLzA0aERiYTQrWC9IWU9h?=
 =?utf-8?B?NUxPTHM5Ym1UTUhlY3gyaUE5RXduSGZnWXlqNUJkaWlrb3MxUk1XbGo5NEhn?=
 =?utf-8?B?am1IcWR2VnFRNEhRYXRnbmoyV1E0aW44MTE1Y0p1T3lTQ0VwdTlGV3ZpbXdB?=
 =?utf-8?B?bTZVYTVUelhiYVNNa043M2pWNzFSdTZuY1B3UkRGckNQNXhHN2J2dkQrazUv?=
 =?utf-8?B?STMxcDQzbDNFRXF5Q1JMbmxyZ3B0SHdHMktSUmZ6WFdGQ1l6Y0hSZnJYVnZM?=
 =?utf-8?Q?h0zO+3E/uh1rUBIZvg9hB0dN6VJI3VSl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q090U1lnZlhKSmhwNk1LOEkwT3RYbFlxenlDaVFhRW54U3VPLzVWYWNBVWd6?=
 =?utf-8?B?cGE0NWpGcHVoV1dpSSt6MW1sRjlwTUFidm9tNXFkdXJXUXZYR0l1WXlsYlJQ?=
 =?utf-8?B?aUFSdDJzbml4OHNGcFo3SUVlYVk5eDltZzBPNVdxekszVXJyNzNTVG5nUlBB?=
 =?utf-8?B?bGNqUG5vYm8rZmh5eE9QdkJHRktiblAzYTBRZVIyRzNValNZSDl4NytxRjZL?=
 =?utf-8?B?WnZ1OHV0L0d6UW1ja0duV1JsUjA5SWFEQWFkTHMvYTZMWnBtb2JjYytReGwy?=
 =?utf-8?B?dnRUeURQYnZCbU5UVHRYeWFEeDZ6OW8zNTV4VGJSTmtkNlVFOG4xSG10L3cz?=
 =?utf-8?B?aElQZU1vZnNOQ2xiUW9sRXMvckloTW9kOXN1WnQyTkdoNW12ZG1nVEtyZ3BD?=
 =?utf-8?B?bGgwQVQvQk1SWWVBQTM0UmVRVjY1ckJHUjErL0xkNitONHI1ZVB0UTVmM29R?=
 =?utf-8?B?R0NoYUdQRys0TFZMVUJzL1d5OGNWV1JkeDM0Tjk3QVFFcjhXUlUvNG5SVUts?=
 =?utf-8?B?dFQ5U0ZmMHhIT2VFc3NZQTlRQjgvUTBabUpBK0tJUllJN0RlOXh1bkpqSmFt?=
 =?utf-8?B?T2dIb2srcm1qbGdtVWk0UnF0Y1Fjd1ZxVndDci80ZlNCZXA5ZW9nREVWNloy?=
 =?utf-8?B?UmRFOXY4ekQ1TndjN3NsMHMxSmdvRVV5YnlUbWdEQ1VMM2V6Z0Y2ckdQRTQr?=
 =?utf-8?B?Y2NMVjJOY1ZrOHUwdTNxTGJLWTJPZHREbUtjVGxEVm1TZ3hlWC9XdFJjRzZ4?=
 =?utf-8?B?K1E0OVFOVWdGTzVZTkMvK1NqY2ZhazdQdTRvUnJ3azZ1aFE2OUFBYUc3Mm42?=
 =?utf-8?B?bEk2NCtCU3FJamh4eWhMMzJrNXE3dFdYNy9lRnBhOS9PN3hiN3FrZVhrMEY2?=
 =?utf-8?B?OCtFUkJabzAydlZidlhSV1JGRExLV2VpZnU4eXk5QVFDUkZFZGhxUzNveDQ1?=
 =?utf-8?B?a0Q3cDBubVY4MnpPOVorRDB4TFJiOXNwd3p0cjhyWllqQWZQTHVCblo2YXIx?=
 =?utf-8?B?S2EvSnU4NkVIT09vM3c2NThjdG9HYnFTaGMzb1JJaWp1MHhuVWxhUXRYbW1C?=
 =?utf-8?B?V2tOTFhtUWo4OWJWenlrTWtUMzdSdkJiRVRveUxpaCs4dFlYSXllYU1BY25J?=
 =?utf-8?B?MzFVOVNJVnRKZjZsbGFiRE1NdzBMWm1GbXdaeUNsU2lQRzJlS2wwS1FDWmNk?=
 =?utf-8?B?aXVyRzlzMVNsRDBmanNnajdCc1RWbUNvNGxPQVR0L2tyMmJuQ2hDUTZzKzZ0?=
 =?utf-8?B?ZG1LZmR0U0pnVDJiTUZmUkJ3Tk1rbGt2THA2eU8zWC9DZ3h1eWVzRS9WSEpV?=
 =?utf-8?B?SlVlVllISWVpRjVxMFJJVGtpRVlpamxhODlMSktROXZYL3EwVC96Ny9wb1FQ?=
 =?utf-8?B?aWhWM21TVUJSU2FMWWFXOU1NenFBenlISm1pbzh6aUU2MGQwWHJIU1JtZFVR?=
 =?utf-8?B?ODdRckNwNjlBWFZ5b243N1dENkdyU0lGeHZOcmJISUh2NU9BajhjdVk1WDlQ?=
 =?utf-8?B?NnBWRnQ4NUVacndDcTUrUjM2azlQNmZNOVVCMS9XbVp3MFBHbmt5YXBhblRO?=
 =?utf-8?B?Nm5NUWQrVnc2L3RPdWwxYUhZMHhTSEZyakJwbzRKRzdhRkRmNEhPRnNkQVE2?=
 =?utf-8?B?WFA5QVFPTkFOOEE5WlRxTCtjTGRKb0ZEM3RQa3VXQ3dOZ3QwaFpHRzZmOGNB?=
 =?utf-8?B?UWpuYi9HRzJDVEM3ckp0aXZ4VHpvNXhYLzJSTXQ1d3N3eHMyODJ0YkZqc3BR?=
 =?utf-8?B?aVhkVnMzYk5mMEZoMXlOWHY2bUozaDFyOGRoZGJpVzJGdXlyTWZvYWw2VVBo?=
 =?utf-8?B?bXRRMlJDZG0rZldJNk9LZ1BOamptRk82Rm9GZER3QVViMTRubkxDb04xZ3o4?=
 =?utf-8?B?My9pVUlETkxrWUtZWDVodkZnSmxNcWtWeVp0QXZmUFpZcXByV1IyQ3hsLzE0?=
 =?utf-8?B?eFFmUThsM3hBZE1oYlRjZkxVMEdTRy9tUEFTakxuY1BOTUF2SFRuaGtHbHRq?=
 =?utf-8?B?MWt3QjNlVFVoUTdQR0dZUEx4YURWU09DQ3l2RG5RN25sMGVvVGc4cFAwM2M3?=
 =?utf-8?B?MGJpSzluYWN4SVB5cVpPeGhGWXFLc1Btd3RKajlFZitRVVN5MG50VHpYaGw5?=
 =?utf-8?Q?wzfjHJhmhcTMx1gqatO7XwC3C?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 614abe3f-66ca-4da9-3f2e-08de20735c11
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 16:08:17.3599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ivnPC9R0Hvt6IrucKDcJWF6oWtqwKAWcWwGSaX6n9epeKqYW9OBwmLWxdatGhqNs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6049
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

On 11/10/25 16:55, Philipp Stanner wrote:
> On Mon, 2025-11-10 at 16:14 +0100, Christian König wrote:
>> On 11/10/25 15:20, Philipp Stanner wrote:
>>> On Mon, 2025-11-10 at 15:07 +0100, Christian König wrote:
>>>> On 11/10/25 13:27, Philipp Stanner wrote:
>>>> The problem isn't the burned CPU cycles, but rather the cache lines moved between CPUs.
>>>
>>> Which cache lines? The spinlock's?
>>>
>>> The queue data needs to move from one CPU to the other in either case.
>>> It's the same data that is being moved with spinlock protection.
>>>
>>> A spinlock doesn't lead to more cache line moves as long as there's
>>> still just a single consumer / producer.
>>
>> Looking at a couple of examples:
>>
>> 1. spinlock + double linked list (which is what the scheduler used initially).
>>
>>    You have to touch 3-4 different cache lines, the lock, the previous, the current and the next element (next and prev are usually the same with the lock).
> 
> list when pushing:
> 
> Lock + head (same cache line) + head->next
> head->next->next
> 
> when popping:
> 
> Lock + head + head->previous
> head->previous->previous
> 
> I don't see why you need a "current" element when you're always only
> touching head or tail.

The current element is the one you insert or remove.

>>
>> 2. kfifo (attempt #2):
>>
>>    3 cache lines, one for the array, one for the rptr/wptr and one for the element.
>>    Plus the problem that you need to come up with some upper bound for it.
>>
>> 3. spsc (attempt #3)
>>
>>    2-3 cache lines, one for the queue (head/tail), one for the element and one for the previous element (but it is quite likely that this is pre-fetched).
>>
>> Saying this I just realized we could potentially trivially replace the spsc with an single linked list+pointer to the end+spinlock and have the same efficiency. We don't need all the lockless stuff for that at all.
>>
> 
> Now we're speaking mostly the same language :]
> 
> If you could RB my DRM TODO patches we'd have a section for drm/sched,
> and there we could then soonish add an item for getting rid of spsc.
> 
> https://lore.kernel.org/dri-devel/20251107135701.244659-2-phasta@kernel.org/

I can't find that in my inbox anywhere. Can you send it out one more with my AMD mail address on explicit CC? Thanks in advance.

>>>> The problem is really to separate the push from the pop side so that as few cache lines as possible are transferred from one CPU to another. 
>>>
>>> With a doubly linked list you can attach at the front and pull from the
>>> tail. How is that transferring many cache lines?
>>
>> See above.
>>
>> We have some tests for old and trivial use cases (e.g. GLmark2) which on todays standards pretty much only depend on how fast you can push things to the HW.
>>
>> We could just extend the scheduler test cases to see how many submissions per second we can pump through a dummy implementation where both producer and consumer are nailed to separate CPUs.
>>
> 
> I disagree. That would be a microbenchmark for a very narrow use case.

That is actually a rather common use case (unfortunately).

> It would only tell us that a specific patch slows things done for the
> microbenchmark, and we could only detect that if a developer runs the
> unit tests with and without his patches.

I could trigger adding that to AMDs CI systems.

> 
> The few major reworks that touch such essentials have good realistic
> tests anyways, see Tvrtko's CFS series.
> 
> 
> Lockless magic should always be justified by real world use cases.
> 
> By the way, back when spsc_queue was implemented, how large were the
> real world performance gains you meassured by saving that 1 cache line?

That was actually quite a bit. If you want a real world test case use glMark2 on any modern HW.

And yeah I know how ridicules that is, the problem is that we still have people using this as indicator for the command submission overhead.

Regards,
Christian.

> 
> 
> P.

