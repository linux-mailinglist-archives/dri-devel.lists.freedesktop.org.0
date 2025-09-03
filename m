Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47322B42C4E
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 23:57:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6156710E94D;
	Wed,  3 Sep 2025 21:57:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="C5InY7kj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2077.outbound.protection.outlook.com [40.107.92.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4982A10E94D;
 Wed,  3 Sep 2025 21:57:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T3fuRzowxL7e2+Ds3HeCb5JNoGcoimRsu7oquQOhmYhxKQ+kkGyESszpUJ6j50wHoP0V2+oUx6arcOnec6W5DThgxaPtk7CetjfcodwnA2oHoJeqWfq/KDqEyY/CH9KAYKBamqKHnipIPuiX6lcBqiF9PvrN9AGyhMPiHrdDQkTezCE75tbh1K9zb1CM8JNEUwB/y+u2vL6MUfFGWELVtq6EeWq7Mpc8pCUzQr62brw48E/zNaEuq5V1AF5C4VFcBbkstZbFaAmc7A72Bz3o0b+UskvIaGYSqhIYYgkVXoedLSewqBeSvA+0nGevpNwvsgXX8sYiLf1AHy/XRyfRsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lr7WOTpyxRmZ8r6DZ+00v837fRkNDKwC+v3dREZ87zc=;
 b=YiSh/4HJc9CpHEgQ7eEPoLKyZoPxOzlXdmmu8kewU3ms8qvFF6OhYlmXOmX+fVCtADjiHo8gbZlqjNJM5Pcy+YAzdP3kcXvWAC+n3O6mnqstXuMoMEuTWYKaTYu4eWUxA98AaqPQCbRAPYwBuD2WZKI/VFMFxhqqCglu3/jE6ylR2eJ+4TTpDjEITFbFiXw4HFPJYxYfov8rRZ5TK8SxnAY2Z43WIVxILsohjvxe/cd+fQRCA7tptjCmWFxFQj/Lz+mX+g7PJt5W4Zt8osYFyXfy8cwxeaezA3T3hsT6hPuyZ2MIsdVcNkCefGft2mnEZHPHyjmXPnIFLRFaoDcDwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lr7WOTpyxRmZ8r6DZ+00v837fRkNDKwC+v3dREZ87zc=;
 b=C5InY7kjgpuL2KRAAdPTkMauCcjIFQjIKxKF2zVpaYVVxwpLzKi24Ecrlz9xEgu06q545OUsj5G/npmlZgp8iHv32XBV1VoLdbEhYWj8WGn/r8VrKdgg8KLCIJxNo9djA3Tdqc8khCLXWhgk95zsmb54kSq2jfW3l9ZDNyOkv9G+52Hr9lsEXrHTtW1oeamFCMUwBZovLH+QaW/JCEzSrUTQhlXH/KUAEdPVxXqdRmQYgRnXLwZPeWQuyjlX4tOqleuGmrEkoNLUnmmRnNAGHnT4+IB+SaurJKel4oFNC+NmGOsl6dz3YNe7UOjUqyFHcYAC8W5mKXWAQnEybY8oPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS2PR12MB9589.namprd12.prod.outlook.com (2603:10b6:8:279::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 21:57:49 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9073.021; Wed, 3 Sep 2025
 21:57:49 +0000
Message-ID: <3eec959e-b15a-4d32-92f5-d95f187319bf@nvidia.com>
Date: Wed, 3 Sep 2025 17:57:46 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] rust: Move register and bitstruct macros out of
 Nova
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
References: <20250903215428.1296517-1-joelagnelf@nvidia.com>
 <20250903215428.1296517-5-joelagnelf@nvidia.com>
 <2B8C8645-206C-4BDD-8EE0-07E79A78E3F1@collabora.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <2B8C8645-206C-4BDD-8EE0-07E79A78E3F1@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN0PR07CA0004.namprd07.prod.outlook.com
 (2603:10b6:408:141::22) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS2PR12MB9589:EE_
X-MS-Office365-Filtering-Correlation-Id: b52efc8c-cbd4-4649-2e5a-08ddeb34ec28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M0xGVHRNVzJSUGlkMGNhVTJ0aDNqMUlvN1RLdEVNZ1ptTnNvK1JqWWJqZ2ZW?=
 =?utf-8?B?S1p5cEorQno1Wi9vV2wvY1h5QUxkbUYrOThJOXVXRXFqK1prV0pIdG0rZkV0?=
 =?utf-8?B?eVB4WXNaNGlva3BZRFhEcGQ4UDFONTR1cVVBWHZPVzlsVGNVRTE1NVE4RjY5?=
 =?utf-8?B?dDF4TUhjRS9VZkgrMWpQZkZLN3ZXRzhhbGtXUUNtV0xKellYb0FRZGoyVlBy?=
 =?utf-8?B?WEYvMDRDUU1TNDBjVGs4d3FXcWpFdmg0RWphRHJJMDFyRHp5YWkweUtWeEYv?=
 =?utf-8?B?YlFiK1RTbUI3aTUwcGp2SWNOUVNZZmRGSGk1UWp3akhZYnlJQUc0bmNTQjdj?=
 =?utf-8?B?SWhUcUdzbjl3cjdjQkswUmxncUNCYXpYQ2UyQUJISHRXcnlKQWVwcXVTNFFj?=
 =?utf-8?B?RFJwVjZHYVZFQ1F6Tkc4RE5ma1lCV3JlaXlpdVRJTTNpNko4SlpZQnh3ZUd1?=
 =?utf-8?B?eHBQYUl1MnZVUXpJN3pGQ2o1MjFlbElhMXRvTFkyYW42aC9MUVJXUFdyakt2?=
 =?utf-8?B?aXorTVhyeXVQZjkwQkJDckQzSWhNLzBvNzlPczJSKzRZTDBHTFY4ZytFUWFV?=
 =?utf-8?B?NTdqaWRERk4vaXplK09ZaVI4c1BRL3VUdEhLQzVFSWdWNmNmekdXRnNGdzNE?=
 =?utf-8?B?V3dsWHFOVjZsRjRpdXlGVmduclVXeU94b2IrTzhVWUtGOUlmQWFOVHlyRUNq?=
 =?utf-8?B?TStzcUlsMmF5U0RNVkliNkFhY1g5dVgxakx4NEFlRkwzRnJEUmNMaXhjaCts?=
 =?utf-8?B?d1c1U0pqN3JYOEI0Y3BaWjFodTRrS05NcURuazVpcFJheTZnbTQrYXV1MWVv?=
 =?utf-8?B?SmY4Q2g3NTVhQU5OalhHR3FtR0IyN0NzZE1QcHBqaHhWRTFGUlRvTUJhaGZJ?=
 =?utf-8?B?YkRPbnduRmJkRngrMHZaR2VoZ2VMVTQzNEtNY3RVNDFudXNzTGs0SU5XVjZq?=
 =?utf-8?B?V3B2RjNHZm9LQ0tsVWFVcURlNFJIaWI4QnJ4SHNtdEJkYjJoc1JUaDB5L01k?=
 =?utf-8?B?Zzkvb3BJbS9Kdyt5MUVPbUJrbzR4bTF5c1NVcEhKVTQ2SkZqUDluQmdNY1ZX?=
 =?utf-8?B?a01mbG04MUxpYUE0bzhqanU3V0lNYk5ZM2VIbjluNXBwU1dRZ1ZlcjFhQmxN?=
 =?utf-8?B?eHZMNTRvMUFhK0phNmpMUnRtUWd5aVVBNDNGQ2NXN2lFcThRdkpSTHRsZ1dU?=
 =?utf-8?B?WisrSDEvb3ZqN3NjWmtuU3AzSnJMWUZxTVVIRk5aMi9RcmV6Tm5MdzNROE9x?=
 =?utf-8?B?UU5HMzQ1YkRnaU1KVzF5UW9xYlkxekZjVWtNaFZCOVhCcGVaQVdqdUlBUzdG?=
 =?utf-8?B?UVExeG1jVmVPN294TEdMVGVETjMreUVibEZVL3FBcE93amorVlp6YndKWndk?=
 =?utf-8?B?dStjbUhScEo1SjYyTmVyZG52NjQ1aUtvaHZQQnYvNjlhZzY3SFQ3VVR2SmxP?=
 =?utf-8?B?cGZheHU5Rm40V1VQTWh2MEM1SzZrYS8vM1ZCOFhUZFllU1VXRFNPcXNuc09I?=
 =?utf-8?B?VGFKakxxN0hQWVZzcDhoZms2dnNBZVN5VGJmNUhiKzZIcHowK05VdmxuMjdy?=
 =?utf-8?B?ZHpXckxMeUxkUXZWbFgxb1ljZjJFcENZeldBMnhjUTZ4cEs4VkxWR0VDdHIv?=
 =?utf-8?B?SUNzZHljRnFnUFlUT3F5TmQ5bFhkSjFpSVFFZ0IyUk1GOHRUbWN2b28ra0d4?=
 =?utf-8?B?Q3BhTEVWc0ZQdlZJQ3FNc2NUbUhJODhRNHRyZEVvbFc5YStMaFhGUnZhNUNC?=
 =?utf-8?B?bEVwQnFLSVAxcVJQVnlJRVlESTBTUTlsVzJ1b2d2eU9YYjVwcFBQaml4OWwx?=
 =?utf-8?B?eW1VVEh4VGQ0ZUkrdzZGRmIzdm1IR3Y4Z0RqWlhzNVlhUG93ZmRDazIyd2F6?=
 =?utf-8?B?SWRwcisxUVUvaUl3cEh3ejFMNlU5UUhQZDBtL2M3R3plaWl6YUErejFQd2FW?=
 =?utf-8?Q?m8k5BF1/tYQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkZDZXJHcHpwdDU0d210ZEZqQk1pUnZNZEV6elFzSXF6N3NMd0ZxR2hjdmRy?=
 =?utf-8?B?dmszTGxvM2g0UmJJM3REVFFYY3VwUzRJTFVGbENzR2pubjM2ZDkxSzNLeFk5?=
 =?utf-8?B?M1N6bjQwN0t4ek1mM3lzTUNIVE9sckJCdW5xRlU0b25WN3RKN1M3Yld1RWZx?=
 =?utf-8?B?elZBelc5Y2hiREUrWEw2dkd0UDB6L3h4b1BIV3ZXa1ZBSFBNTFdNc1JtbitJ?=
 =?utf-8?B?SitMdWpCQTBlU3VIb3kwWTZFQk9iVUtxVFI4a3dNYlNackUwTi9JblFESEdm?=
 =?utf-8?B?QkxGZU5SK1V2Y0RwcVg3NDg4ajdkQzdwRzVCV1I3OGU5V01PQ3ZVdVp1K2RC?=
 =?utf-8?B?L291RGdZYWJCSzFSYktEMVJrbERYbkZGZGxleklLOW1XQThkRVpXQXRoU2xa?=
 =?utf-8?B?Zm9hMmRiZWtXOFpURlBnMFFTWGJWV25OZEdjZWhWdExwUENBemhhU09LdFpR?=
 =?utf-8?B?NTRVWmptYi9JNnlCQ3k2dnhSVlp1cG5JMlFrditUdDRQQmxyMmlpdVNMdHo0?=
 =?utf-8?B?aTFsMWJkaEVYd294aWR6WHFRUlpybTRPSUR2bEN2MzU0RHEzR016bG5hL3g5?=
 =?utf-8?B?RVRwcWJhbGdUSEx3aC8zRWk3OW9ZazhCTzZxU3hCbmZTcERNcTVoSjR2YitE?=
 =?utf-8?B?YlhPaWtpVmJTdVlkbElqNXNDMWlNV0JhRkNpL0V0SlVKSGJMUDR2bDd2RmVL?=
 =?utf-8?B?QWUwcjl0UWRMdUMyb1FRQmlzL0hENGNXdzZVZ25DOW9rU1QwRVE1TFdleVVC?=
 =?utf-8?B?VG1BanhRakh4bnRTMXZadGFlL0ZaVXkydm1LMVc2QkxKN0VWangvYzRjUjdW?=
 =?utf-8?B?bkErRGdSMW5uVGI5Nm5aMHV2VlovckZzT1NocGtidEN2Wk1ORlZ4UWgwclJO?=
 =?utf-8?B?aUV6dHo5ZkQvbDJUY1JEZlF5UHVPNnFjcVZCYTlHM09rNUV2dS9HUFdYMG1q?=
 =?utf-8?B?Tk5NbFRJUWhtdU1nRHNsUCtJdmhiQ0xwN0oxL3lYTCtSRVRRTnJzRFkxa2FU?=
 =?utf-8?B?NlRNbGk2TWlnK1NOM0EwSXdvQTk1d1hFM2pGai84V2xVSmhaWTZ3Q3BlaFhx?=
 =?utf-8?B?ejd0NExSRHl4TUFrTXVTT3QrdkY1YVdwVzJuaUNTeDFjeGdoZENVaWgyY2xL?=
 =?utf-8?B?cE11YVNOZmxla2ZIY0NZc0I0WERsMmN2aTYvdDZ6R2RBc1VCY0pvUUdXenA5?=
 =?utf-8?B?UzdTRmRtc1hTdk9DMFRLRXVLckI5SVAyT3ZDL0NqUExETTk3cFNiejZIZkQ3?=
 =?utf-8?B?c0RVd1Z4VmYvbkQ5NkthYnQ5WlR6N2czVm9kaEtpZXdDbm5NUDFCTkdRMC8y?=
 =?utf-8?B?ZUxqL1M2UDhLM1JSNGNSMEFZdHVsYzc0RW1KMlF3ejBaZHlFS2MveGpTNzFD?=
 =?utf-8?B?YUFBbGhvUFQ1cTk5cXlLYytBZVZ2bTgvT0lhSkdid0xFakEzcWR2aFZZVUVY?=
 =?utf-8?B?ZkxEUDFJcWlBVklwakxHMXRQeGo0ei9kYjFQNVBGcTBiazRnd2F5T2VZTkdl?=
 =?utf-8?B?YWswL0FpUTJmMU1haE0vOGhGUDBhZ0hpUk1zUjNIYi9BWDEvWCtMN2l2cVBw?=
 =?utf-8?B?Sjc0Y29DUkZHVG5TTHJYd1BETm85cVYxOUl4VE9YY0xkM2NHaTMrdkxteHRV?=
 =?utf-8?B?SmYvU1RMU2dmQlV3NVA0Sm8vMkNyS3RtZnpNSGRaSnRtR09YQWFORzVxUHVW?=
 =?utf-8?B?QlF0SkQ1VFozN2RKRGVtN2ZnSmN1OHczRDBpeHdWYmtyNTlpcUV4Kzk3S0h6?=
 =?utf-8?B?WDdwSzJrU0VwZXp4cTQwY2VDSG9zS0VOdFlBaURRSlpKa2hyQUVFWEZBZE1B?=
 =?utf-8?B?eHUyZHZoMlprZkUxeGVtd1lHckRXWG1adUtyZTRKV3FnYWZ5ZjhiY2lIVG43?=
 =?utf-8?B?cmIxN0MzcnM3NU5FN3BKN3dqMVBDdHZHcWhkb2NGT2lGS3FhcjF1T0lXcWNC?=
 =?utf-8?B?RmxvQ1ZJNEp5eEQwL3Qxc0ZZZUw0S1EyN1pVTUdJQmFlRHJlZmNEVHJQTDZt?=
 =?utf-8?B?MDh4N1VsWitLUU9YOG9UbHRLQ2xjMG1maUVHRUFXclUxNVVuNDBUWFlFODNM?=
 =?utf-8?B?eEhocUgzSGl2ak1rR0dWaDFNd2Fmem9NRmw1WUpPK2ZZU1FsbzRsUEFzclV1?=
 =?utf-8?Q?8yVhn60ELgumj3DLyx+/Lvok6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b52efc8c-cbd4-4649-2e5a-08ddeb34ec28
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 21:57:49.1310 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DWvPx+pOM2cY97jLzj/uxSWO+0R0P2fj1kBc102z118W2fL1eyBXPZEWjbWh7WsBDZhUNQo2arpeCvkKUOMiJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9589
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



On 9/3/2025 5:56 PM, Daniel Almeida wrote:
> 
> 
>> On 3 Sep 2025, at 18:54, Joel Fernandes <joelagnelf@nvidia.com> wrote:
>>
>> Out of broad need for these macros in Rust, move them out. Several folks
>> have shown interest (Nova, Tyr GPU drivers).
>>
>> bitstruct - defines bitfields in Rust structs similar to C.
>> register - support for defining hardware registers and accessors.
>>
>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> 
> Thanks a lot Joel, I will pick this up on Tyr and let you know how it went.
> 
> Expect a Tested-by tag in the coming days.
> 
Looking forward to it, thanks!

 - Joel

