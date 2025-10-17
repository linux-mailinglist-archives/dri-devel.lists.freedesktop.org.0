Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 117DEBE63EE
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 06:03:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2DE410EAE7;
	Fri, 17 Oct 2025 04:03:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="c04pUiqd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010032.outbound.protection.outlook.com
 [52.101.193.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D45FC10EAE7;
 Fri, 17 Oct 2025 04:03:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gh9r9Mlzb3BnO5n3LRV2Sn7gL2c6TzaW1/tur+36SYL5GB98u3UXVYBiTYQq41QQmXqolfQr07/0eiWFPBoATpNCyosNJGrKlrZcnc9xotJCeQB4oPCIMHmfxiu6qUuKugQczM4Jn0nhXM+Fg6fVyNEms86jykInhvpDFpH3ws9e4PwYOBUUQsGEa1E9Nk9Ugcc0shCaJpgQTIApuKrjNlgwQFg7GuqyK1n2Ck3AdNmlC/m2EZZE1UOmTuqHkdHgy9XXMl0AqJoghDNGHh+ejOC1WdjqP/xQTfOOn0EhgPn4VNqyb5ZUrtSfBoF9ELfwvJrm4AYUbMXvTrKMgzxL6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WL0l8CXA5w8Uc8h1xezmbEmj9KFFAnnH3QfN3HwsWFQ=;
 b=CMqQVzAvFhiGYv8uTXLUcQG2pdXE4slrsmYCkK6JQaq5XIT5eDjhVNolhd3LegHbVD6wHanNV3dJ/eKhoVk+sl0doHE1m9/Iercuu5fw03Ept15+0PyaX89g7DCTBdEfWLZU8Sf0+E86SSYbV0A+ClzAPhEQ7aZLkePiU7LV7wtr2LmtipOMwBT7Wf2ROPfYNmhg7O++Oif02rV/YGDoT2LbMLjVmCaVNliPIXYBoYy0tz4AZYIlvK2lvyJ5/6oN5eYpG9lCamF+2HCcPnXfda3MQSlw/Cz2ar9erOeiivtKubJnEa6ht5D0HGS7ux1dJx6+AAnnhIDFcKHGTjD8CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WL0l8CXA5w8Uc8h1xezmbEmj9KFFAnnH3QfN3HwsWFQ=;
 b=c04pUiqdUMJ8hgZ1hLg8TPUTvUFYf/5JcJNFKdWaiqo+zlsnIjwyNRav0slceVKzklHtKtN+MiFPE08Ux+i+Zh5nS1DywbWvvaitiNVBDojep/job/cgtnMDLjTV7xdCwQUCflQX3MuMcP4sfxiGDoEuRpHwMl0KpOkc8gEN14YeyIGlTzxE9noIA/riclHK/z6a6R5hmqSt0umU/HwW3YxBbDbLDUOmUPVxlRnlzPTuDye5n+51bnOom0ImeCVnI7NM3cBT8HDEpoOADo0Hcy3luGOCS4SXibsLjjhTuczKqB+GQjg1ppte4uBiguijo3jA0oZi/dP1iTFSTya5Cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CH0PR12MB8579.namprd12.prod.outlook.com (2603:10b6:610:182::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Fri, 17 Oct
 2025 04:03:40 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9228.012; Fri, 17 Oct 2025
 04:03:40 +0000
Date: Fri, 17 Oct 2025 15:03:36 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, 
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
 Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH v5 06/14] gpu: nova-core: Add GSP command queue bindings
Message-ID: <4lkclhrurxpxamlsf45dfoihmh4zrorgsr4jibqp3ye6tqd2xd@xfjllw4j55aa>
References: <20251013062041.1639529-1-apopple@nvidia.com>
 <20251013062041.1639529-7-apopple@nvidia.com>
 <DDJJ4Y320YEC.O6QIUDDLFVOH@nvidia.com>
 <CANiq72kWof2RL93s5L7t52ax+G65iBrOnfMa3XrqC+LgSO49=Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72kWof2RL93s5L7t52ax+G65iBrOnfMa3XrqC+LgSO49=Q@mail.gmail.com>
X-ClientProxiedBy: SY6PR01CA0151.ausprd01.prod.outlook.com
 (2603:10c6:10:1ba::21) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CH0PR12MB8579:EE_
X-MS-Office365-Filtering-Correlation-Id: 74061b8f-1274-4481-bafe-08de0d322816
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dlVvdjlwV3dRTWNFbDZGU3d6U2pnem1MRTIxNmVUVTBoTFcvUDMvNEZRTTQw?=
 =?utf-8?B?Y0tBMmdnaUFmOFRQY0todlUxYVV0NFNsMS9tSkRvR1VJVkNIVWl2SXFHdWUr?=
 =?utf-8?B?MGxQSi93aVh6c0FrSjl0QXR3SHVBdkE4alc5SnZaelFnMDc3RDY2dXRPWXI1?=
 =?utf-8?B?QlRLZzVoRSsrOXhzSHBqRFVrVno4OGU2dnR2SkJrcEFtU2M0S1V0UFprU2Jp?=
 =?utf-8?B?d1JWdk9BQVZueXU1aWR2aHlSSmhCblVGa25mSVhhbDA5WC9XajREZ08wUDlF?=
 =?utf-8?B?dmxjclpGYVc4MjZLTml1c0xiU21ZVmlrMnhVeWpOQVBQcTMxNG1pSlU4V0N3?=
 =?utf-8?B?NnpqSjdCWDFlSUN0VUVCR1VsT1JCOHU5UEFQK3dsVVAwbHFXdFpoZmV0UHVX?=
 =?utf-8?B?djFBVjY0bXV1MVZ6eWEydXZVSDg5YTZXUHFhTDFYM1BxU0JSMC9pbTRZNmxG?=
 =?utf-8?B?cjliaXhnQ1VWMERCVmJHcXV0bEJMdWZ6R0tVVzZ2QXhiOUtzdk1DTjFxYlRj?=
 =?utf-8?B?NmxaTE1Ua2VNZ1dHK2tvWHhKTDAyaitkdFE4QzY0cUk3S0dtMThKRGM5dDk4?=
 =?utf-8?B?S0xSQ0FnR1dOejRxM1hyajl6Q0h3a3Yxa3Zucm5pY3ZhY0RMTjJYNE8rSVc4?=
 =?utf-8?B?cmw3MjgwS2kzYXg0dzRSd3JsOXJDN25sdXoxcGFGcmxtaldFcThUT1o0TW5I?=
 =?utf-8?B?MEN3REVPM2tYY2RRaGNwYktPdGROMktrMmozMzZLbG92bVRNWnlHOWpBN29I?=
 =?utf-8?B?TnNYUGFDSnBmcnlTOFYxazNEbEtra0V2b29HKzdMTERKWmx2ZldzSzROZ0NR?=
 =?utf-8?B?OE9DQVFyNCtrbmJFV1kxd29qTkF2dmpJNDN2cXNNNjlkOWZHSkVaSDAySmta?=
 =?utf-8?B?R3hYVzN0RzZTQ2NKaXpFZEs0Q2dpM1g5c0NyNmRCelR1bWEyamhnbk1SaUh2?=
 =?utf-8?B?VE5DMXEyQWdraG1qYUhHR1lMZmIwaG5sUDNCcGlsWVJHc3NQczZ0QXg2TmZX?=
 =?utf-8?B?a0RRT1RWNUZ2R05rb0JpWjRHM1dpa1Fib2ZxRTc1UkF3U0daL1FmTllaOUd3?=
 =?utf-8?B?aUVHUldvcFU4VGhxSUtFcGlMQ1Z6VWJDbnFRd2tEc2FaeWR3MkE1SlZUS0ZM?=
 =?utf-8?B?TWZwTlB0eGd0YkY4WkN5aERlMTJJM2lXK0RhcHkxbXNQWEhENjBJamF5L1Q4?=
 =?utf-8?B?b0dGdTRvUGhpUkdFTmNlYVZ2VTRiSkJxNkV6TlBpbmxZNStHQTV3TkVMeHJx?=
 =?utf-8?B?WDg4WHIzQVlzN2VuMmdaQUp0MHZLenF0dUd4dktOREFQVEJQOFBXK1U0Qll2?=
 =?utf-8?B?OGJGNGI5eGthb3dpbU0zb2VlVEE1Wm54SitCeG52K1lLUFNRd3ZGbEI1UWZX?=
 =?utf-8?B?NmYzU2h0ajMzSkZoQyt2dHQ4bnRTOW1aUzg3YldsY0dLWEZkcEgvSTZXN2J1?=
 =?utf-8?B?NUdyN3Ewdnl0K1J2N2RDUkFwMngyYVorSmR1VTJMUTRKb3FWcXY4Z2MzbnBH?=
 =?utf-8?B?amt3VEhIQ2dCbE9zaThwVXNDaElUanBwWmFPUmFUOElIL3Q3eUt6N0EwTWx3?=
 =?utf-8?B?amtyQjZrMEphYzMzbTEwQ2laRWp0ODdVSUVOSGlFcHV0TjRSSldkbWdkcGhK?=
 =?utf-8?B?VjZrVFByL01WMDltd0s1Yzk3S1A5YkZBTUtjZWpVV3REQ3dySGwvRnFLTWVJ?=
 =?utf-8?B?UnJ6aVMrdHhXT0w3Q2lSVk9IRGpZNWVjbzVGRE1LYkVPQm9rQXRQWWpKM1ky?=
 =?utf-8?B?alNsYldjYVZwaWk2TTlndUJJOVFaN2YxL3Y0c2xyNjJwQVhhYWcxQk1YZHBz?=
 =?utf-8?B?enk4Z0JWMFpFZkZpSW9WQTkxK1VtYjMwa3JlVDFLTmtGeUdERzk1QlM1VkhQ?=
 =?utf-8?B?MEY2NGl1aEY5K1ViSno4cUNkcE9tUWZHd0dGcXJwTlF6Z3hLOW9tTitCeUV4?=
 =?utf-8?Q?hNYEl0ehkg+IYm3GBRSs0sEUjR9UVpUe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekRKRXp3blBiNGNuNEI5eWxjb3d2RHZUR0hvbDFxVHhPL2VmWVlDVDd0R0hC?=
 =?utf-8?B?VTFGUS9ITlA1QndDVTQzWC83YzRJLzFGd3FiQjlENUtkWVVMdjR6S3lreUIz?=
 =?utf-8?B?SUFaOWdvckRMZHJUQUZNMGxUeXFmTDNqL1VjWlZBMkNjM0ZtaGJiV2NXZFFz?=
 =?utf-8?B?UXNnbjBtblhObk42ZW5KRis1bjlINlY1ZURCQkdZdms2SkpQS1grRUQxSWpx?=
 =?utf-8?B?ZW54Umc1NGVXNUk2MjBOTE10THI2ZlcrSWF4TkJhN2NYQ1FwWWJkcGtlUDNj?=
 =?utf-8?B?djRjQ2NHQVVicmpxZTRTT2dOeTBVeWhvU200dmMvQkszUGprbmMwK2ZrK1dW?=
 =?utf-8?B?eGxHanFPWmxBM21mUnplZFVlWHlkSkJLRkltalV0Tlhqdmd5KzhDRTZzWVZJ?=
 =?utf-8?B?Sjg3M3loOWgrMnY4Z0QzNENhVDBrY3ZkRFBEbDJFcFZFekdvRU5vUVBqT285?=
 =?utf-8?B?QVZFbTJlNGtoeDZpVE1tVlJmeUp1SXVMQitHeHZWankyaUVWMGswVkh3RmZi?=
 =?utf-8?B?K3FNeHJ0ajlnaHl2MFMrMkxNbFBKbVQ2LzZ0NHBjaXBXRTBDRGNTcnM2MHJR?=
 =?utf-8?B?NzZ5NzJhYk9JTU1TelJuWHRBTWdHV091VmFFSmVjUzBWWXRtSldiaUdtVmpN?=
 =?utf-8?B?MXJLMkNjNVNYdGYreHQ0WC85UmZ1WFdINlc4c2NCeTBGQkkxOUxCZWhydXZQ?=
 =?utf-8?B?TjkwRG85bEpmendDYWIvb0ZjU0kwRnMrcEtVTlY4WjFnY3dncTZMcHloVDRs?=
 =?utf-8?B?UGxBZE1EQWgxNkIzcVVBSThZU1JiUDdkcTNZR0JlbmphT29tRHdIcDN2QU1z?=
 =?utf-8?B?SHZxMCtjMDdsL3RlanlYekJZTEFwdUtvQlNMUk5waHdCaGZFOTNRbGpRQ09Y?=
 =?utf-8?B?a1JHT1NJUTJjVUw1SVpQL2VRczZBNEo1TjQxYi9JdnMxWWovVTBjbWNodE5B?=
 =?utf-8?B?SDJnSGpjZm9PQkh4L3BjZEpUVnJyekE4K3JUSHl4bjZJTks0NTJMd1JhMkcv?=
 =?utf-8?B?WWtQckgvNlVoSjkwMkFWRE9LV3FzOW9GWkI5TTNueEpWdDVVTzllSnk4TjMr?=
 =?utf-8?B?bjZ6WFhlQi9iTjBuWk5ZdDhZckRaTjUvNXVTRVl0ejljZXIrNEd6T0RnQ3JG?=
 =?utf-8?B?ZXl0emJDTzhJUThrR3FyWnJyU1BxaWc1OTRmMUFwQnJQL1REOVRSTGdMaFpV?=
 =?utf-8?B?KzJ3NmplbGpIRXp6NGVQcUsySnluVXlNRXdrL3FDeFdhUEM0Vmo2ZFdtaDZI?=
 =?utf-8?B?dmtMREN2VlJ4ekxzdHVWc0RYNmpReDh5QUFxZlZ4Qkw3clAyR1RXV2ZnUDhC?=
 =?utf-8?B?OXMzQkEvY2xZeXNzU2hOOXgwSzYvaFozUjVEVHBXa3FYcHdHaWEwbCtwNUNp?=
 =?utf-8?B?RmJkQlpTS2N2Z1RGRUhFcVZ4Y1c4MHd0Wk9CMzNtSWlGYndsN0R3MlR2d1JR?=
 =?utf-8?B?blh1WDJFV3E0QTFvcHpmZWhsL0lmMUk4SHZMeUo1bW0zc0RkQWVUZFMyaFJr?=
 =?utf-8?B?aFExNXJlOFFCQXc2TnlFd1l4MkpOaU5PelR6bmN3Uy9zbGdiVHNkOWFwNFBi?=
 =?utf-8?B?RVFZcXMzMkZSRGdIU2VVYnowODM3d3p0UkgrTmtSZTJGNTFrN3BVdmFueFZa?=
 =?utf-8?B?amhrNXd6UTRmYW1MWlpmSGI2c0dGdk5LQUhGWmRwSndQTkFWbXFTczFkTmxa?=
 =?utf-8?B?NlJPY0VObWRhNkl3ZWpRdjVmT2F3QnZ3UE9pay9qYjZoOGg3clFkMUVIM1pY?=
 =?utf-8?B?TGRrd0pKQi8zTkxpQlNORDlqS1lkVXU4ZXN4eDdKQXdLby85cyt5TU9rTnlX?=
 =?utf-8?B?d3NLY1JDQmpFTXBKZFdiNWQycUFHNzlQRlFVRWNoMmVhYkxvdnRCaTZYK2N4?=
 =?utf-8?B?VHRENy9hNzdoNkNCb2V3YmhCTjVrc3FneFJSSVBrWFVNMTZmTWpkdjF2dUcv?=
 =?utf-8?B?RTBxTUYxK0RoVlpySFdacXFwdVJqZW55Mml4dzdzVTRRSEFXamV0QUF1VjdC?=
 =?utf-8?B?VENaUi95bG9qSVMrY2tuN3MzQnNWYS9OYVd3MGRvL294NTdGdzNCTU1wcnk3?=
 =?utf-8?B?Vys3TnAzUTdTTzBXTTlTa050SGpBWlR5MnB3bjJxdS95TkVWVll3cWJmZi9j?=
 =?utf-8?Q?sOxrwgPsTjnxl8IBYEJnbksA6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74061b8f-1274-4481-bafe-08de0d322816
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 04:03:40.7022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6AZRn1/sgstoORxXDy8yAUSPWXIRYFYHcjbXAeqv/1hZuICyKbS37GPHHcYauPxclyutZjS4LvWmRtD199E0mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8579
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

On 2025-10-17 at 06:22 +1100, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote...
> On Thu, Oct 16, 2025 at 8:24 AM Alexandre Courbot <acourbot@nvidia.com> wrote:
> >
> > There are lots of unused warnings when building on this commit. I know
> > we don't like big patches, but since this is semantically related to the
> > next one and the two touch different files anyway, how about merging
> > them? IMHO this is preferable to adding lots of `#[expect(unused)]` that
> > we are going to remove right after.
> >
> > If you have been told to split in a previous version, let's just add a
> > the `#[expect(unused)]`  where needed.

No, I just split it here because it seemed like a nice self-contained thing.
That and I'm conditioned to linux-mm patches where 20 changes is often
considered a big patch :-)

So I will probably just squash this as suggested.

> 
> A possible middle-ground is to add the `expect` in a "more global"
> position, e.g. at the top, so that it is a single line change. I think
> that is fine as long as it is removed right after.

That could work, thanks.

> Thanks!
> 
> Cheers,
> Miguel
