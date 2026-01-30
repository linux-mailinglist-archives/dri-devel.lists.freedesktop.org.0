Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +M2YMmJtfGkqMgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 09:35:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B32AB8732
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 09:35:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFB7910E953;
	Fri, 30 Jan 2026 08:35:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dUljGZ44";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011063.outbound.protection.outlook.com [52.101.62.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A7BC10E965;
 Fri, 30 Jan 2026 08:35:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hCb9tYBZLYgZfKfUhXhSOUw445tjS7hFXZqbkSdDcJDu2piiu5CLfqPBDtH5Wo+6sgfQfDWXVbcO2ZcWv6CGOue/bQtD4aaMkYBWRLmNM6KcxgSkmzGzGIY0RhM69p+k/HvRUhFbr+8u1Zrsy606uU0YNLpW721zgXt/T0ukh7NXaIGe0ZPn/CiGA2kctENUH+bXMw1ypp5E9s6bAB1bRimf0iEcAsGe0R18hmx8IRJjL8sddjYF6vq6M0UtUV2CvX7Pp1sh7f7dAnXgGBSIwmE5EsvQtUrfZeJpmWQdg3oyQVfGjr+C1DCtJugbUdazG40+2UmxxFgC6HJbiAJsUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9y9ODM4+ldeghrT49aub4SQ57dU9CY/QpzXDKno35mE=;
 b=XAZEdAJA8/+gCwiBNlVyHsPkeuKxMndd4tzi7EOPgxUk9/dEN7UP996XFVI7W+VjP+gntDaGw2Tooam1x7xtzcfslT4ASBkXWUTKpvFfNjrf4S5jZCzKQ3WY5DpUPc83iRflhbtgdKgbVq+f+9uZeFah5lGYVr6SOc1IbKTzNlUu4iN0DmJ5NEU4JTtlLGBlmK3RCePv35f4QMVYiK8lorMyTwqRrwy8iaWvuEr/pawBcpLhL6wZ3NdHEYb1gXbkOjFGZyhC/JLpPD07WA7CHI+oNeFscfFWvCcb2sW8vYeebt95YE8ZUkSkx5ttXGB/PyI7o8Z3eKjC2VJjAxEdGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9y9ODM4+ldeghrT49aub4SQ57dU9CY/QpzXDKno35mE=;
 b=dUljGZ44A+iD3N3b0a+2eqX/5wRVRfTlnMYMtCdsMEXQ1HLBHT6ZQeAA8cJ1UbThOwjDaeEAkQ0TQ2rGpBztg+SBdfezq60CjAMU4Zfm3o+8Hr/TIVq4NPxe8R0o3i33hV0bxYHl42CYmWgP+AGzF8x6kqvshMNA6iMtVEDep5tQBLa5ufeelyvV/8np+0D1x6RnVCSNv6wvmruLjgzBetffDhGdDItCCu49qpr7dOQUFcaMzxh6O+5HnIyij0/YscvioE3xoi8JF+a+1XU29XLBZfZMvdbaePWOSbhnRCtJoeiP3TqD4GBtwn6qyCMDWKbK7vq2ry0jCaxL7AIX9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by DS0PR12MB9400.namprd12.prod.outlook.com (2603:10b6:8:1b6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 08:35:35 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%6]) with mapi id 15.20.9542.010; Fri, 30 Jan 2026
 08:35:35 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Fri, 30 Jan 2026 17:34:06 +0900
Subject: [PATCH 3/9] rust: dma: add CoherentArray for compile-time sized
 allocations
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260130-coherent-array-v1-3-bcd672dacc70@nvidia.com>
References: <20260130-coherent-array-v1-0-bcd672dacc70@nvidia.com>
In-Reply-To: <20260130-coherent-array-v1-0-bcd672dacc70@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 rust-for-linux@vger.kernel.org, Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: BL1PR13CA0174.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::29) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|DS0PR12MB9400:EE_
X-MS-Office365-Filtering-Correlation-Id: 77b79c9b-89d6-45ce-0b26-08de5fda8981
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eWVXUG84ZGxrWStNWW1CZzNVNlpZMVZFREYyNWZtdjVxM05hRTllV0dkNTlV?=
 =?utf-8?B?SEE0c3owUGZnZ3lLSFdzZmZsZ0dxWEhaWlJrYW91K2JyREx4UEFweERxUHdo?=
 =?utf-8?B?UzBZcWxNWk1MQjFOSzZ1VGFrekNhU2FaZFlXY044TDlRdStPdUlmdkZnYUls?=
 =?utf-8?B?VE1xYlBiUitCYU5wU2RFL0djbU5SRHNWeExlYnVCYWNqWTR2YlJGY00ybzZQ?=
 =?utf-8?B?ZVAxT0UyVDRYa3NXV09NVlJvKzVVaVExNkRCWGdTODF1SW5ESHVPcTFpSnRZ?=
 =?utf-8?B?OW5vVHhhMzhXc0o3T3NFNFNxVGlPbThhT2ZVbGZpbjF3STFFRkQ3R0dzQnhh?=
 =?utf-8?B?YnBsZnhEeFd6NlRFN21aWWRrRUdDdUtEcEdnaytxcDFZZ1F1NWwzRUZPa2gz?=
 =?utf-8?B?eG1RVjNoQ1c3NFpvSG50UHlpRU9aaVpCSFVOY2MwSVd5UUE1UkxuN3RiTDds?=
 =?utf-8?B?dDFmV3dLOURzVHJSa3dQQk5LZ1FoendHTk1iZk9leTZMT2RySUpiZnFaZUFY?=
 =?utf-8?B?M0Y4ZzlhVEtOc1JtV3UwMDNYWmVMWFNiUDlBay9DZVBwYkNXQVNGWU5yc2Zw?=
 =?utf-8?B?OW00VUpiNUs2amk2YUxqRTJBQ2ZmSDVyUkxGNEx4M3o5QmtyRy9XU3NjSlBW?=
 =?utf-8?B?WUVVWklCTnNxUFJTaWlLMWZVMlFuTFRSYlJiSHQ4cDJIcHVmd1VOOElWN0Jy?=
 =?utf-8?B?SkViRHV4WTM2dWpLS05iMW8rNTRyMWZIMnFaTmp2MDIrTGNFSHBBZFR4K0JM?=
 =?utf-8?B?T3pvcUxBUkYrTDBmRTFZSUsxcVlRNnZtZWNNQjQ2bzVJVkZISXQ1ZjVRYXdr?=
 =?utf-8?B?YUM1eCtXTkk4RS9qVUNVbWJtQjZITENNSFFJeENlQzR1WHNlTXNjTkRGMmEz?=
 =?utf-8?B?aEVxTE9aNXVobXZ0TGxNVW42YVhka2E3bE80QS9KTVQvWFVCRmRzY1JmSHVS?=
 =?utf-8?B?a09OSFpNVTlJdVBXKzJPR3ZCdE15cGc3ZDlmaWFYaGthaGxCNFBmM3NmbVd1?=
 =?utf-8?B?SFFNQWx4U25UZm52K0w5QmRkNWMyWVJOczlvQVNtS090aVU2cUlmbWlBQkRT?=
 =?utf-8?B?d1ZRZ01WR1c5R3h6RHh0aTlZVGJmT1JlRWQxeHNoL3duWnZoQUNWd2xXZzZP?=
 =?utf-8?B?Qm56MHl6WkhmazhYQTNNMXZid3VsM3JqeGF1bkJDU1h1dFJadnpFZkRFSU5F?=
 =?utf-8?B?NmQ2YksrYk11Q2JqTUFjRW5GR3AzNHZZeFloNXpmNTlXV3JBSVdQWE4zek5U?=
 =?utf-8?B?SmNnWXc5NWpHTWRxbnRyWGVkajd2ZU9zTW85Ry9rdWNVdldxL2MwS2NtZk4x?=
 =?utf-8?B?eVZ0eFFQbHlEMEJkVVZhUGdZblppTCsxeTFZWGRpVkdnVGVNaXF6RTJ6NGth?=
 =?utf-8?B?MTl2WGkxQXR3bVAzNTVBZ3NpbnZNOGVBbVAyc2ZzTDY2ZzFVOC90cXNzSExp?=
 =?utf-8?B?ZnRFQTd2RFdBalNoR3VXa1VzZzcweWo2OHhDRzBFUGtzOU54THZmdWxYZ25z?=
 =?utf-8?B?OUp0empUUENVWXZnWlUvVm00Slg1TWJPTGFuZmt5MjhHVS9rRFlBTFZ4dkdP?=
 =?utf-8?B?MW5PcHJXc29yOEVvNU96SkF5eXRJNUk0Ny9LZG52ME9MZEt4R0FiMmh4d0Z0?=
 =?utf-8?B?WkxVdWd4RkVRQytIa1BSdjZhU1NhU05PbVJ3L1pXSWt1ZUtjVmdjaFBkM0lP?=
 =?utf-8?B?cEcyRS9URTFNOUFGSlNuZys4UUw2Mk1aTWFIMFMxOUVXUCtsTXphNlVqU3NS?=
 =?utf-8?B?RzdjaFFBV3dNVHVWTHVQYTU1amJNTHZrWjN0TU0wZ0JwWWh5TGVmZVRyUklo?=
 =?utf-8?B?QWVzQkdmVFZubC9rSmtOaE4xUjMrQVVteHBkSmhLd2RET24vdlJPNWVhcGtT?=
 =?utf-8?B?WHlKV2tSMHRBWGk5cjJqZmtNVVF4WC9xTndrVEIxOUFiZzhOMXNFSk83bUVK?=
 =?utf-8?B?VTgzcmo4VnhlN1lheEpDKzBZa0R5YjhMa283YmZPWXowa3VQTExCTVo0Q3d5?=
 =?utf-8?B?REoxazU3R2ROQnFubkJzTm9FRHRNM3FocjFkSUJ4RERZSnJGNG1JMC9IcXJ6?=
 =?utf-8?B?WlIrc3pnbHN0N2c0cmdJNzJkVjVnS2M0a0JXOWpRWERNMC9zVko5VUJhcWJE?=
 =?utf-8?B?TU5zTUZjZjVuMy9kb2FLN1JRaVcyMUR1aWdmWEtvU2ZCVWhXQUhFUmhVUEpi?=
 =?utf-8?B?QUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDZxOFVubGs4YTI5L2ZPazZuVzNldkdkRkc5YnNTeDNZQVFNdkVKaDY5K0dl?=
 =?utf-8?B?YTl4SE9HcGZoeWdtSlNnTDUrYjNzZlptWkltMkdRUWNXMklMSTh5YTRyNjZZ?=
 =?utf-8?B?TVYwMXY4aW9GUVRkV090ZnA3WjB0S0p3d2Zwak1DSnkyUFBOZXV1RUlPQkRi?=
 =?utf-8?B?KzdpTitlajZGYlQrbEJ1cnROODhVTThrT0J5ZlRHckRnbkRMZDkrT0ErcDFL?=
 =?utf-8?B?R2U4MEhFUTZ0OGErRHhoeXU5bWM2dGFTMzFYTWYyYm05VFJnYlNlOTh2dUlW?=
 =?utf-8?B?d2tLLzBEZXN5SzZmdXpoL2JWSnM3QVljeWRQN1ozQS9TbkNVWWxwd3RhWW1Y?=
 =?utf-8?B?eG1jNVgxcFltRlBRM1VSOGZ2RWs2SnRtdzhncTJzR0tjaFhYOU43YmcrT2Ey?=
 =?utf-8?B?K1Y0NWVLWUplZTYxQ2x5bWtzWFkxam1sV3dYT01sSnZqZ0tBMW5NWVViOEhX?=
 =?utf-8?B?K1RFUnYvODVtSmtlK0pVRlBmeUZIMisyRVIvZEVMVGdsNTVOZS9EblhTM1lp?=
 =?utf-8?B?ekhwS2RoNXo1THZ2T2xJUWgyNExnTTg3WGdQUzd3R0Fzb2xJWS9sQVlVdHlp?=
 =?utf-8?B?RFVnV2Z3RjNNbDA1WHMzOVo4d0ZyNVlFb0RBL0tDSHNRRmFNY1dLdk0xNVVE?=
 =?utf-8?B?b2d3Mmxjb1lEWWdudElvYmY2QitaeVp6TE9BOEgyeXZGU0Q0RUhlU2F3MjZN?=
 =?utf-8?B?cUtnZ1ZweGpOSjdPY2ZYcTdJSFhKQjNESlFoaldsTHVSOHRUVlFEbVhjOG9C?=
 =?utf-8?B?YnlWQkNYd2ExYnExczRLdUtsNDNKN1FmYklFcjM1RHo0eU9aRE1oNWFFNkZN?=
 =?utf-8?B?U1NlZUlzbzVOTzl3emRDdXFKTUV4cS9HNFhVSkszd01ieG0xckVieEMzemIz?=
 =?utf-8?B?ZTBwSDRDM3N6aml3T0dUOU9McnpGbGNJOGNjUXczNW5DOTdSc2VSNFY1REsr?=
 =?utf-8?B?YnNyZjhHRnYrbzl2eW1sWGZKQlFGRFl4ek95SDYrcXFGclBQUjNNS05JV1c5?=
 =?utf-8?B?YnBrck9wMnEyanpNSnpUSExPSmlOOTY2V1pkRFE0TEg5dTZPVDJkbDkvbTUw?=
 =?utf-8?B?NVVuME1JM0pxOUY0bmJqU3hTazhTaURYMWx0Tm90SVhDdGZWMEEzY0FkaU9O?=
 =?utf-8?B?My9iUDJTb2dCZTBURzA0UEJPVWx6aHE1ZnFRckpxcTFLcDNLdUVLT0I4Um94?=
 =?utf-8?B?Q2p4VHN4QlRRblp1T1dKYkZKcTVZMk5SSnVjU0RiR1MvcXA5SnZ5anUreWxn?=
 =?utf-8?B?SGpEYUhUNVhPSzZVSnRhbjhsaG1MYUhEbWluRGczdUFibFB6ek5YN2M5R05K?=
 =?utf-8?B?Wm03TGFJMndFbWNTS3JmOUtBVHVsZFJqbWQ5b3BROGdpU1RqcXVVOVZYSmtS?=
 =?utf-8?B?cCtpcVBIUjdVZUVpMUtUV2I2Rjh3Z29wcXI0dnV1ZjdvZ3hySmNReC84R1Jq?=
 =?utf-8?B?cDB5VHlobFZsQk53UkJaNFNmYk12WkYveWJoY2VNUDB4L3hCTzJlZkNYV1hw?=
 =?utf-8?B?b3l3M3k4elI2eHltaGorM2hYWTYxSnY1YW5lTXdYYmZNNDY0UEtRN1NkMVRR?=
 =?utf-8?B?OVVnVkhNVGhkcmV5S3laSk9SOXdlWDFGVkZJMllwbGRadWIwSEt3Ky9CS0hu?=
 =?utf-8?B?RndiL0IrYldXYi9ucG05NkI4aGhlZU9aak5Xc1RTa3Mxdy96NmVHR0ptOWRX?=
 =?utf-8?B?TForU0ZRbVlxRnpUdW5EUkFFUXRSTldHTHgzeXpMTExneEozUVZMTE95UnAx?=
 =?utf-8?B?OTN5bG1MSWJzOXJCVXhlZzVpa3lsVThod3NLejZBU3RLc3d0R2JYdXk4eWs3?=
 =?utf-8?B?WEZXNmkyWVlVeHpRSDNjRW1pbDlkMlg5VXMvdHFjU3FsS0ZhVTh1ZENhN28v?=
 =?utf-8?B?cHVFTzdpYmh3eXB6ZDJ2Y2NXQlpSYkNlTkNOaFBVQWZhZW9aMHZLOWY1Rmk3?=
 =?utf-8?B?Z1FJMGtYWHZRTnlKckJIbmJwdXhiamFJZkhFeFAvcjlXK21IWlEyY2Y3bGdt?=
 =?utf-8?B?MmJGMFJlamVrN2N2RTBTTks0L3lPVzF2cGlrRkZXeThDenVoVy9FamJaN2sr?=
 =?utf-8?B?REV5WVNPRlF0ZHlJUzRWMzNxZmI5TkRtR3ZSdEdhUUF5Nys2dzFwdktwYVha?=
 =?utf-8?B?OXFZNk1MSERJOFl1K2FNODl0M1ZvczByajFBdTJ2V2pjd0l0eG9HUXhaaFB2?=
 =?utf-8?B?cytiWFgwNGZ6ejdlK2xLTWpON2RTa0k2aHRqVjBXbGg0a0tKb1cyZ3BLUHM1?=
 =?utf-8?B?Q1F4WHMxNEo4MjdTdk04V3pzdXNMOStUWjAzNlBGTUxVUW1saVhNZHRMV3pi?=
 =?utf-8?B?ck04RXU0RElEaUFiTEtsUiszTURqcGltamVidjFaNktaZVVjZ0lBSDFkVlk3?=
 =?utf-8?Q?/GhpzDjxoMuoiRB6aUqsvHUDlsbwwV5ci8mbVdt/KN2p9?=
X-MS-Exchange-AntiSpam-MessageData-1: 5n8ituzASDtPAg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77b79c9b-89d6-45ce-0b26-08de5fda8981
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 08:35:35.0093 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dnb4kOo/arHVayXugeHeS7bM+xeRjDuqR50cHltJdIYE3DVA093WapWibECD9ymK7X3JMd2dW/buB55oPzIGTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9400
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,google.com,gmail.com,ffwll.ch,collabora.com,arm.com,garyguo.net,protonmail.com,umich.edu];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 7B32AB8732
X-Rspamd-Action: no action

Add a CoherentArray type alias which takes the size parameter directly,
without using the StaticSize<N> marker type. This makes it a bit nicer
to use.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/dma.rs |   8 +--
 rust/kernel/dma.rs           | 127 ++++++++++++++++++++++++++++++++++++++++++-
 samples/rust/rust_dma.rs     |   8 +--
 3 files changed, 132 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/nova-core/dma.rs b/drivers/gpu/nova-core/dma.rs
index f77754f12f02..c217cdb14223 100644
--- a/drivers/gpu/nova-core/dma.rs
+++ b/drivers/gpu/nova-core/dma.rs
@@ -9,13 +9,13 @@
 
 use kernel::{
     device,
-    dma::CoherentAllocation,
+    dma::CoherentSlice,
     page::PAGE_SIZE,
     prelude::*, //
 };
 
 pub(crate) struct DmaObject {
-    dma: CoherentAllocation<u8>,
+    dma: CoherentSlice<u8>,
 }
 
 impl DmaObject {
@@ -24,7 +24,7 @@ pub(crate) fn new(dev: &device::Device<device::Bound>, len: usize) -> Result<Sel
             .map_err(|_| EINVAL)?
             .pad_to_align()
             .size();
-        let dma = CoherentAllocation::alloc_coherent(dev, len, GFP_KERNEL | __GFP_ZERO)?;
+        let dma = CoherentSlice::alloc_coherent(dev, len, GFP_KERNEL | __GFP_ZERO)?;
 
         Ok(Self { dma })
     }
@@ -40,7 +40,7 @@ pub(crate) fn from_data(dev: &device::Device<device::Bound>, data: &[u8]) -> Res
 }
 
 impl Deref for DmaObject {
-    type Target = CoherentAllocation<u8>;
+    type Target = CoherentSlice<u8>;
 
     fn deref(&self) -> &Self::Target {
         &self.dma
diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 6e6d91a9cd62..43ed0dfdbc08 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -194,12 +194,12 @@ pub const fn value(&self) -> u64 {
 ///
 /// ```
 /// # use kernel::device::{Bound, Device};
-/// use kernel::dma::{attrs::*, CoherentAllocation};
+/// use kernel::dma::{attrs::*, CoherentArray};
 ///
 /// # fn test(dev: &Device<Bound>) -> Result {
 /// let attribs = DMA_ATTR_FORCE_CONTIGUOUS | DMA_ATTR_NO_WARN;
-/// let c: CoherentAllocation<u64> =
-///     CoherentAllocation::alloc_attrs(dev, 4, GFP_KERNEL, attribs)?;
+/// let c: CoherentArray<u64, 4> =
+///     CoherentArray::alloc_attrs(dev, GFP_KERNEL, attribs)?;
 /// # Ok::<(), Error>(()) }
 /// ```
 #[derive(Clone, Copy, PartialEq)]
@@ -414,6 +414,9 @@ pub struct CoherentAllocation<T: AsBytes + FromBytes, Size: AllocationSize = Run
 /// A coherent DMA allocation with a runtime-determined size.
 pub type CoherentSlice<T> = CoherentAllocation<T, RuntimeSize>;
 
+/// A coherent DMA allocation for an array of `N` elements.
+pub type CoherentArray<T, const N: usize> = CoherentAllocation<T, StaticSize<N>>;
+
 impl<T: AsBytes + FromBytes, Size: AllocationSize> CoherentAllocation<T, Size> {
     /// Returns the number of elements `T` in this allocation.
     ///
@@ -692,6 +695,124 @@ pub fn alloc_coherent(
     }
 }
 
+impl<T: AsBytes + FromBytes, const N: usize> CoherentArray<T, N> {
+    /// Allocates a region of `size_of::<T> * N` of coherent memory.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::device::{Bound, Device};
+    /// use kernel::dma::{attrs::*, CoherentArray};
+    ///
+    /// # fn test(dev: &Device<Bound>) -> Result {
+    /// let c: CoherentArray<u64, 4> =
+    ///     CoherentArray::alloc_attrs(dev, GFP_KERNEL, DMA_ATTR_NO_WARN)?;
+    /// # Ok::<(), Error>(()) }
+    /// ```
+    pub fn alloc_attrs(
+        dev: &device::Device<Bound>,
+        gfp_flags: kernel::alloc::Flags,
+        dma_attrs: Attrs,
+    ) -> Result<Self> {
+        Self::alloc_impl(dev, N, gfp_flags, dma_attrs)
+    }
+
+    /// Performs the same functionality as [`CoherentArray::alloc_attrs`], except the
+    /// `dma_attrs` is 0 by default.
+    pub fn alloc_coherent(
+        dev: &device::Device<Bound>,
+        gfp_flags: kernel::alloc::Flags,
+    ) -> Result<Self> {
+        Self::alloc_attrs(dev, gfp_flags, Attrs(0))
+    }
+
+    /// Returns a DMA handle starting at `OFFSET` (in units of `T`) which may be given to the
+    /// device as the DMA address base of the region.
+    pub fn dma_handle_with_offset<const OFFSET: usize>(&self) -> DmaAddress {
+        build_assert!(OFFSET < N, "Offset is out of bounds for the allocation.");
+
+        // INVARIANT: The type invariant of `Self` guarantees that `size_of::<T> * N` fits
+        // into a `usize`, and `OFFSET` is inferior to `N`.
+        self.dma_handle + (OFFSET * core::mem::size_of::<T>()) as DmaAddress
+    }
+
+    /// Returns the data from the region starting from `OFFSET` as a slice.
+    /// `OFFSET` and `COUNT` are in units of `T`, not the number of bytes.
+    ///
+    /// For ringbuffer type of r/w access or use-cases where the pointer to the live data is needed,
+    /// [`CoherentAllocation::start_ptr`] or [`CoherentAllocation::start_ptr_mut`] could be used
+    /// instead.
+    ///
+    /// # Safety
+    ///
+    /// * Callers must ensure that the device does not read/write to/from memory while the returned
+    ///   slice is live.
+    /// * Callers must ensure that this call does not race with a write to the same region while
+    ///   the returned slice is live.
+    pub unsafe fn as_slice<const OFFSET: usize, const COUNT: usize>(&self) -> &[T] {
+        build_assert!(
+            OFFSET + COUNT <= N,
+            "Range is out of bounds for the allocation."
+        );
+        // SAFETY:
+        // - The pointer is valid due to type invariant on `CoherentAllocation`,
+        //   we've just checked that the range and index is within bounds. The immutability of the
+        //   data is also guaranteed by the safety requirements of the function.
+        // - `OFFSET + COUNT` can't overflow since it is smaller than `N` and we've checked
+        //   that `N` won't overflow early in the constructor.
+        unsafe { core::slice::from_raw_parts(self.start_ptr().add(OFFSET), COUNT) }
+    }
+
+    /// Performs the same functionality as [`CoherentArray::as_slice`], except that a mutable
+    /// slice is returned.
+    ///
+    /// # Safety
+    ///
+    /// * Callers must ensure that the device does not read/write to/from memory while the returned
+    ///   slice is live.
+    /// * Callers must ensure that this call does not race with a read or write to the same region
+    ///   while the returned slice is live.
+    pub unsafe fn as_slice_mut<const OFFSET: usize, const COUNT: usize>(&mut self) -> &mut [T] {
+        build_assert!(
+            OFFSET + COUNT <= N,
+            "Range is out of bounds for the allocation."
+        );
+        // SAFETY:
+        // - The pointer is valid due to type invariant on `CoherentAllocation`,
+        //   we've just checked that the range and index is within bounds. The immutability of the
+        //   data is also guaranteed by the safety requirements of the function.
+        // - `OFFSET + COUNT` can't overflow since it is smaller than `N` and we've checked
+        //   that `N` won't overflow early in the constructor.
+        unsafe { core::slice::from_raw_parts_mut(self.start_ptr_mut().add(OFFSET), COUNT) }
+    }
+
+    /// Writes data to the region starting from `OFFSET`. `OFFSET` is in units of `T`, not the
+    /// number of bytes.
+    ///
+    /// # Safety
+    ///
+    /// * Callers must ensure that this call does not race with a read or write to the same region
+    ///   that overlaps with this write.
+    pub unsafe fn write<const OFFSET: usize, const SIZE: usize>(&mut self, src: &[T; SIZE]) {
+        build_assert!(
+            OFFSET + SIZE <= N,
+            "Range is out of bounds for the allocation."
+        );
+        // SAFETY:
+        // - The pointer is valid due to type invariant on `CoherentAllocation`
+        //   and we've just checked that the range and index is within bounds.
+        // - `OFFSET + SIZE` can't overflow since it is smaller than `N` and we've checked
+        //   that `N` won't overflow early in the constructor.
+        unsafe {
+            core::ptr::copy_nonoverlapping(
+                src.as_ptr(),
+                self.start_ptr_mut().add(OFFSET),
+                src.len(),
+            )
+        };
+    }
+}
+
 /// Note that the device configured to do DMA must be halted before this object is dropped.
 impl<T: AsBytes + FromBytes, Size: AllocationSize> Drop for CoherentAllocation<T, Size> {
     fn drop(&mut self) {
diff --git a/samples/rust/rust_dma.rs b/samples/rust/rust_dma.rs
index 7a87048575df..97711a99ac8b 100644
--- a/samples/rust/rust_dma.rs
+++ b/samples/rust/rust_dma.rs
@@ -6,7 +6,7 @@
 
 use kernel::{
     device::Core,
-    dma::{CoherentAllocation, DataDirection, Device, DmaMask},
+    dma::{CoherentSlice, DataDirection, Device, DmaMask},
     page, pci,
     prelude::*,
     scatterlist::{Owned, SGTable},
@@ -16,7 +16,7 @@
 #[pin_data(PinnedDrop)]
 struct DmaSampleDriver {
     pdev: ARef<pci::Device>,
-    ca: CoherentAllocation<MyStruct>,
+    ca: CoherentSlice<MyStruct>,
     #[pin]
     sgt: SGTable<Owned<VVec<u8>>>,
 }
@@ -64,8 +64,8 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, E
             // SAFETY: There are no concurrent calls to DMA allocation and mapping primitives.
             unsafe { pdev.dma_set_mask_and_coherent(mask)? };
 
-            let ca: CoherentAllocation<MyStruct> =
-                CoherentAllocation::alloc_coherent(pdev.as_ref(), TEST_VALUES.len(), GFP_KERNEL)?;
+            let ca: CoherentSlice<MyStruct> =
+                CoherentSlice::alloc_coherent(pdev.as_ref(), TEST_VALUES.len(), GFP_KERNEL)?;
 
             for (i, value) in TEST_VALUES.into_iter().enumerate() {
                 kernel::try_dma_write!(ca[i] = MyStruct::new(value.0, value.1))?;

-- 
2.52.0

