Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25337C82831
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 22:20:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB1289CA4;
	Mon, 24 Nov 2025 21:20:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nQ66ekxu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010040.outbound.protection.outlook.com
 [40.93.198.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E8FA89CA4;
 Mon, 24 Nov 2025 21:20:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GTzHVw3rbwabRUWdvmls2ddMDUtfJS3V/awa/HrOOvpiQEb929Qm9nf3ICcT/pv7tbbcdGTcwrNPGYMqL0G8J6O8hFFVweMiTcNyX+dvFE56kcDP72BWTFd8/Kw24kAX5SijRYdLKPBh33waBPhyT8elvdJlch7iOnDuSMKle+ETsFXv7uUlFKPaznhdH58DIc5c7cm9GwHfwRwbn+s/lBuil/kvC64LUHemFwQszY/3cpVCCceByUZ0kq+sjNj3uLSbGBcDCfFbSasjK03b+8nPTGqJ/P08qGNW6kY/WBbZA481+ZNswWM+5G2CGbKOzouzWka8XCgw64vvLO6ITg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oigwN4Ii1wiH/zYAmItzJZzyUK0P49a0S2sVFPGbnXk=;
 b=x3u++1ywI6t2o/P6aaa1BNMwEiCy+KXm+ob+qKda8j1XyUwK2pHYlN/3NHRG4e9RTHK/DmHFSSrCAaZ4DnppZETevBElBkWnjBCWlI/jhtfV46VGFz+REHuMjk2OpXJdttenp5WAslp0eHj62kerBRiwYGFd0YXME994zF6ge3yzrgsYlv8/VAVVoZilRKCu19+d2nty+Ho7Uxx6Jh09ofwWy673KaXDMP9dcuZZagmM47zWop2U2T3hUKXeQq+0JgjVaPS92F0/yheg1kJ6rCxdBlNFwHuStnRHNOM2MGV1UBGbRlYLThoCWs2aA1PinIPuXOhJL5EnNrYNJKzmRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oigwN4Ii1wiH/zYAmItzJZzyUK0P49a0S2sVFPGbnXk=;
 b=nQ66ekxuRjY1ZcZPH3jsj8tpKv5BGrxCQo20yDi3hmJyZQDvi41jsht7ihcjvspaDvM2x5+uKeR6icAfRUOlWTk9InPk44zHkYRbREmXiYsYNjJRtDx+sWqfMivyOoW/V9ZUgPl8TwkKCYY7WdxOx6rNwIPGhd357InJ/aQBK5jEZ+Y0N79htSTfJ6W9xczkGtNqVVRLlJHuHanSLBHAJmNrCMG6lnY0vFqXkwoRiAKcC5N9EBWvny9k1VTAk0+IAqdPjlW8OWTwPi/9mh+MQrOqvdw78I0G4UKarK4afQjirp0fPfrkAJtXuDcJbaqHRyB5EML5vdBEIenMvFtyYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB8056.namprd12.prod.outlook.com (2603:10b6:510:269::21)
 by SN7PR12MB8770.namprd12.prod.outlook.com (2603:10b6:806:34b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Mon, 24 Nov
 2025 21:20:30 +0000
Received: from PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6]) by PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6%4]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 21:20:30 +0000
Message-ID: <bf56634c-c340-4bf6-8b25-059d1dd7bae5@nvidia.com>
Date: Mon, 24 Nov 2025 16:20:26 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] drivers: gpu: Update ARef imports from sync::aref
To: Shankari Anand <shankari.ak0208@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>,
 Suren Baghdasaryan <surenb@google.com>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alexandre Courbot <acourbot@nvidia.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Igor Korotin <igor.korotin.linux@gmail.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-pwm@vger.kernel.org
References: <20251123092438.182251-1-shankari.ak0208@gmail.com>
 <20251123092438.182251-3-shankari.ak0208@gmail.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <20251123092438.182251-3-shankari.ak0208@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0114.namprd03.prod.outlook.com
 (2603:10b6:208:32a::29) To PH7PR12MB8056.namprd12.prod.outlook.com
 (2603:10b6:510:269::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB8056:EE_|SN7PR12MB8770:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f64d7f9-5bcd-4339-446e-08de2b9f4bb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bytMTnNEamJCUkZtS3JtR3QrQlJYeUtqK29CSXRNTUZhOHRRWHR5R0ZLdXFh?=
 =?utf-8?B?RmRnTXBrMG5ueVZrVlJadmNla2poSXZRL0xhejM1M0U0MHBmUWIweFNoOTkx?=
 =?utf-8?B?SXQxSFRvT0hkSDYzN2tTelNoZmZBNnA5WkdLMDZGSFBsRktJY0ZxazF6b29F?=
 =?utf-8?B?cEw0aGpPSjA5SDhBc0Z6NlRCQkJjSlJIbllsbXpyVXZ0ZDk4V0xwbXBvYkUx?=
 =?utf-8?B?ZUdBY0xHZS9xb1FEL3Y0Mi82V1VjdFVJV1FxUkJlY25ib0RPYUZHYVZLQ1g0?=
 =?utf-8?B?N0pGQjFkZ0JGZU9ucW5nYnN5ZjkzczVNMEdqL2V1emR6b0gxcHh2bVp6dTJI?=
 =?utf-8?B?ZjU3Y3V4eDFTLzZaT1hpNVFSTFVsa1JacVI2ZDMwS05aREttYmdERUFVc0NW?=
 =?utf-8?B?aHFabkFlWWx3TnBjN3RZY0lqd3NETE9lWkJiQm5pODdUQktJU0ZoalpLQzZR?=
 =?utf-8?B?NitVSGR5eGVFVDJ4R1dBTm8rd2I2Y0p0dS8wa2dpU1VzYzBRb2VHRnVPR1lD?=
 =?utf-8?B?RTlSd0diT0JGZllIWS9oYmpOVnoxdmcxQTZrdCt4RWdRK2hqeTVpZFNlTjg0?=
 =?utf-8?B?NlJFaW44TEN1b0Zmcmx0UitBQzFrbDhSMW50TlFSN3F0em54WnF0RU14dWov?=
 =?utf-8?B?Q0Evc0lsRkNnYmc0ek5EL2JvNXR1dDVHZjZXdk9UTER2emJNYTNxMVR6THRm?=
 =?utf-8?B?YUhUbVk5MlQzL3ZpOUpwSFBrL2wxbFFacURtVlpobU5YR2VMOVYzSmk1NzZX?=
 =?utf-8?B?NVBPakZhVTFOUUplZHVYWEV6SytVV0VENXAxQVZrdU1Va3FmQkVmR2ZYUUFn?=
 =?utf-8?B?RXYvLzJ3OTJRUjdBLzI2cVJOenhhWWhIQTI5MnBSWFJBZ0c3Zmc2Rk91SVI1?=
 =?utf-8?B?MFhIcHR3NEF0QlZzeUpUQ3d1WUdiZGNKbEEyTzF6MXdmck5zSlFjZjVTMHNs?=
 =?utf-8?B?ZkROSWlzY2V4RmQ5SFlQOXFQR004cTY0MXlOWnBGcFpsU3dTNWdmam9ra2dN?=
 =?utf-8?B?S2dEa3lYS25KYXVRQzdXV0QxZG92TkpjS3ZVVlZsWGNlcUp6Um1waGVCYUdR?=
 =?utf-8?B?OWdJb0pkLzFPZUl2Y0FxTEFKaTNiQXl2SGpkNzR1eE9XY2ppbjN2YkRyRXE0?=
 =?utf-8?B?bEtlM2hlVS95NWdtTys2Wnh1SVg2azdoZXJWLzYxYjJIY3hPUmRDYTJEN3Bh?=
 =?utf-8?B?Z0JGT1VxUVoxdTREYlJGMVFmRVhUVi93UTVIRVRBSVI5T2tUaXhQR3N0TERS?=
 =?utf-8?B?NjluZGxRdTYzNFpGL0ZuTm5pdERqSlBwcDNZNEdaUjJJaGNENHpQYS9pcXJa?=
 =?utf-8?B?K0ljakZxWkZnSlF2aEFRa1d0bnBsODByalA5TkladlFYc3JVaXBoaDh1WFJ6?=
 =?utf-8?B?bXRKazh6VXl4b2dQSWxGaU16Ukp4T3BkQ2pQckhJbnhNbkg0UGltaHRkRC9L?=
 =?utf-8?B?aGI2cUNaV2NYSkd5aCsxRUswazFpNnBYR293eVNJM2tTeTNSTWtJTVRFbzhX?=
 =?utf-8?B?aTZjbmkyMXdvWjhZalJ1QUVZckFib091S2ltOGtpSVNqR1RFNnNjY0V5RENa?=
 =?utf-8?B?Z3JRMngxYzVqNCtPQTQzUFFKUmlZK1N4UFNVRTVWOEl4M2dtdERZNmFFYUJv?=
 =?utf-8?B?ZUhGbDJrZXdCc3RaV1VjQndLTkJTYUpMZVV4aHBnVW0xQjFnWUpjZEwvZVRy?=
 =?utf-8?B?YTNTM012YlhOenNMMWZSakRJZjVTZUR3TG1WQ05nNHVPSmxRcUZ5NVBxUjB4?=
 =?utf-8?B?bEkrOXNoRnNuTmlOaWZrUXZVbGdqV3Qxbk9VRG0yOXdwTE9VUWNoT2lVRWhu?=
 =?utf-8?B?RW1RL1BYRGE4NTZTNWhBNDJlTnhvMHhhMzkySm94a0wvc3B2M0t5ZUtkaE9P?=
 =?utf-8?B?TE1Xckk4ZStRTTZDcGVhVGdlamNoT2ZqN09YRGwreTByM0ZhTHdMcnZiTCt4?=
 =?utf-8?B?cGtUbC9oQXIvQ085YStlNUZEbHR0YlNaenUzaDVoU1ZwekJISEJGekZ2cHNK?=
 =?utf-8?B?Q01IRjlUTjR5UVFESVUvTU16eElXK2Vjb0txSUkxaURCS1dwc3BIN2UxU2FR?=
 =?utf-8?Q?GAIsVJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB8056.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enJtTlNQd2t2dlB5RXJYUHR2R1oyWEpyRE1ZRHNzU3JNN3NMdkpIWXFZUmR5?=
 =?utf-8?B?ZFg1WkRaYmhHTDBRYzdHSVJJN1duZkZqQng2Si9WRm1tRStlSXg1NjI5ZjVK?=
 =?utf-8?B?M09tbEFvUUhiYjBNRGI2dXB6YzErZTFLL0taZ09UZHFHUHVHQVVDMFBUcXBB?=
 =?utf-8?B?LzVmSG9vSTlybGI5S2syc2F3N0FBbHRHQVl0dWpqcCs4Qm1sUWFBS2x4T0FC?=
 =?utf-8?B?VzduakNsSHltSkk5ajVoUDVaWEFtK05GbzJtZmdGZ1p6YjNKUzh0S3lpRFI2?=
 =?utf-8?B?RjducXZzbTFzU0hIRUNCNGRPeVBSVXRvS3QxdE0wV3pQNmtYNktNKzNPcXEv?=
 =?utf-8?B?cEhkZkpDRjZzZjIzRk9rdUVJVmN1NzVNSUJXVllvM0pJQjdNRUVicmVqU2RE?=
 =?utf-8?B?cGtpRHNnU2RRalFhbEgvbjRPVERKdElnWmk0OVBiQlRKeVdYRHM4WVd2U0xD?=
 =?utf-8?B?aE5sbnhNUVVkMm9va3RSTWowRHl5MmI5OEwweVJrcngzWS9rMW9NdXJZRTB3?=
 =?utf-8?B?bFc3R1J1WlY3dnJrZCtkN0dVeG9ZaFNhRXpMS1Jka2JHbkdQVkcwZFdzbEpB?=
 =?utf-8?B?cGJsVS9DY3pqdmFwNldXcWN2NmVtZVRvcXQ4dzlBUnpTdmRaaEdmZm1ibDA1?=
 =?utf-8?B?dldFUzJubnRNN0pRR2hJcFlJQ1ovNUhqVE9SaEhPZEw3d1lmU0ZYVjRwOTVo?=
 =?utf-8?B?WnkyeHp3WDFnUStNNldZK0NoZUFhSTB5c0RRL3ZkL2M2TzZCdjYyUFZldVBo?=
 =?utf-8?B?SVg1a1orZkpUS3RhdnI0eFpqTm42MUtaYUR1VS80bEQ3RU1oRkZFOFpSQmQ4?=
 =?utf-8?B?UlNqYVJmbG1rYTFOYjZ4c2YzL3NlMWpJRFVtWnFrK1VUbGdMUFJDOHVTNzQ5?=
 =?utf-8?B?ZjY1aEs0dVhYMk9KWTVYVldRekh2VU9uOExPUGxCUDJQRUF5d09qQ2JoYWw5?=
 =?utf-8?B?SmNkb0VjUTM2SGkvUVpsbHBHY0k5eE9PRFV4Z3hLNE9SYWpQbzhJb1dzTVd2?=
 =?utf-8?B?VVlDK2E0MXRhR3BrdHo2c3gvdFFjVHgvVjVtRExCaUYxSmRERmhZQURsT1pC?=
 =?utf-8?B?K1AyUkZpMGU1ZUt4NGp3NXNkZ1oyNDRkVEZiKzRzL1EvNXVIMklKREtxbDJz?=
 =?utf-8?B?c04xKzZteWNqbUFuVFpjVWNGYmVpQXNONlJKTC9vQndGT1ZrclhHSFJNUU5v?=
 =?utf-8?B?Z2pvRUNNMkVvY213U1ZaRkQ4VzlyMmtuckg4NnF3WHF1NUJFaXB3aGx5Tnc2?=
 =?utf-8?B?RDJxWXlITlFmdWNHMVFWUG1oMTAyZ2lUSkE3R2psM3JTWEI2aWErZU9QTmIw?=
 =?utf-8?B?YndxYm45R1FKSVRMYU40V0xZaFp2Y1k1b2RzY1NVaDBXOGRNTGVjRGtRWTJL?=
 =?utf-8?B?K3J1SXlDUXRDcTBKMExLSVFlSmR0QlRjd0N1SEE0LzBCOFBrcVpQK2dkUXhj?=
 =?utf-8?B?TDM4RGZ6ekxVL1N5VGV6VElIUm9VblVtM1IzWVlrWlFTTWQxdjlIRjQvenJE?=
 =?utf-8?B?TmtYbEpuU0R2VndsNVhRWVo4VmRPS2xUWHEvTGs0TGtydXNyNGdtZFVLNG9S?=
 =?utf-8?B?YkZOUUNXRzR2eVJOeE9mS3JBM29TMG51UTBKcnZHQUhoMTJvYlRGd0lQZDF3?=
 =?utf-8?B?NGlQQmplODUrald1R2FuU0VJNFhYNEU2cEVoNnF6ekdxWlA1aXB5ekZVSHAv?=
 =?utf-8?B?dThkOG85Qzk3RHVCQVdKRkt3b1hVUXhSUlZyMSt5YzJ1UGpuM1FkT05jRFYw?=
 =?utf-8?B?YzhwOGpuL2xCOVg1Vm4zU2lBUVUya1MxclJBeWpkbHE0Q0t1RUJnQU5GNUJr?=
 =?utf-8?B?QmNKUkNYVlA1VjE2VElScTN3ZWxROFB3UmtiSG5OdzlOWTh4MjN4ay9mclNW?=
 =?utf-8?B?S3BKRlJQYXdkZTF3YVAwcEZLZUpnYmxBQ0VJbEtXRW9kcWpHOCtmTWk1TUZC?=
 =?utf-8?B?TUNLbHlFMGtxUmpwYkR2cFV0UEdEQ09kOHQvZXdBc2ZtL09uMFVBYmJKaUNS?=
 =?utf-8?B?SXpydW9rU1pLRFgzelBoQTVkanExbEhXbGNKNEZIdGR1QVRaWUdHRU1TMGZR?=
 =?utf-8?B?R3V4TklsQjJ3M1YzWTg0R01QRm1kVWQ1d3lqNUF4YnFvZWhWZ0hRTSs3dVFO?=
 =?utf-8?Q?EYSdCiGvD6qR9KjEhC76XzhLE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f64d7f9-5bcd-4339-446e-08de2b9f4bb8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8056.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 21:20:30.5790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: os7olWNfN2PCezEPfn3cx4jcOuh/9q2DQBG1r3Rw7ivhTf6RzNs2rrLeASNxKjvsXf1YOby/aqAN+svdKCSuaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8770
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



On 11/23/2025 4:24 AM, Shankari Anand wrote:
> Update call sites to import `ARef` from `sync::aref`
> instead of `types`.
> 
> This aligns with the ongoing effort to move `ARef` and
> `AlwaysRefCounted` to sync.
> 
> Suggested-by: Benno Lossin <lossin@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1173
> Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>

Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>

thanks,

 - Joel


> ---
>  drivers/gpu/drm/tyr/driver.rs          | 2 +-
>  drivers/gpu/nova-core/gsp/sequencer.rs | 2 +-
>  drivers/gpu/nova-core/vbios.rs         | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
> index 0389c558c036..264c2362237a 100644
> --- a/drivers/gpu/drm/tyr/driver.rs
> +++ b/drivers/gpu/drm/tyr/driver.rs
> @@ -16,10 +16,10 @@
>  use kernel::regulator;
>  use kernel::regulator::Regulator;
>  use kernel::sizes::SZ_2M;
> +use kernel::sync::aref::ARef;
>  use kernel::sync::Arc;
>  use kernel::sync::Mutex;
>  use kernel::time;
> -use kernel::types::ARef;
>  
>  use crate::file::File;
>  use crate::gem::TyrObject;
> diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
> index 2d0369c49092..9c689f0b21ab 100644
> --- a/drivers/gpu/nova-core/gsp/sequencer.rs
> +++ b/drivers/gpu/nova-core/gsp/sequencer.rs
> @@ -14,12 +14,12 @@
>      device,
>      io::poll::read_poll_timeout,
>      prelude::*,
> +    sync::aref::ARef, //
>      time::{
>          delay::fsleep,
>          Delta, //
>      },
>      transmute::FromBytes,
> -    types::ARef, //
>  };
>  
>  use crate::{
> diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
> index abf423560ff4..7c26e4a2d61c 100644
> --- a/drivers/gpu/nova-core/vbios.rs
> +++ b/drivers/gpu/nova-core/vbios.rs
> @@ -11,8 +11,8 @@
>          Alignable,
>          Alignment, //
>      },
> +    sync::aref::ARef,
>      transmute::FromBytes,
> -    types::ARef,
>  };
>  
>  use crate::{

