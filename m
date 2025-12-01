Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B610C99942
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 00:23:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E97810E4D5;
	Mon,  1 Dec 2025 23:23:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JHDb/pT3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012017.outbound.protection.outlook.com [40.107.209.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A2BF10E4D3;
 Mon,  1 Dec 2025 23:23:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vh9W0Hm3Ew/DU681ZY8IPxiXc7KNYLpMCiCffmWPDGklJn66FTh3LdbWBGrSWRxsrBRm065y0Yl19IwWQUrQygCJPjMXyj3BjJQ80MF82L/HU+JGHoxIomQNoRCknHvqVD7zyGdGHg/FfK31IScuTxLzEpstADpSvP627YIJkSRMf6eR9u3EUZOn6krWXEHOVpGSLMmqM8BgLglEDyCBstDDS4m27Uik7CsRvVTcISRCwFKPrSiM1dLxiE5rjYG+w9QzTw35uOfX+vdupbenaebK21lbDUwUb5BsAd/hQejnTGC3rKjpGsygA3cFfi1Z7oinyIoiJtNM7t8JnSLgQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2W7kurcCOjlcTfdF8QO5WCApqkd5BtY+U2k343fvsFI=;
 b=jv3A0EYkyKzf+v1I+ZKtPwJQF1+/vJPrGyTJp0EDa6H6Iu6scmT1WYgdjqqhg8ONtGa8hB7YqanJNOuuWMHx/BrTSVT0yYNdk4waCR1Y62jyCh97BwyxjxO22MEMfeoWrNQ34EQBoNRxej+csCCiKS1eETmv+qpJpZ6lh/nVuZPukNUYtA3WpkFbJ127IW+C9I9a1hBjQNMmGQyDD9DbZB1US05HALfwYQi2sa4lMoinXWuugZS+LQ3iCqoh6ZMkk5Gv9kJYjeQ6zh4N0Zj8bIe0rxSZRhc7oC1gkLb2BlUKdvBtK+qxgoNb+IEwkndJqdXKm/HAyE8Gfyqxx3zHQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2W7kurcCOjlcTfdF8QO5WCApqkd5BtY+U2k343fvsFI=;
 b=JHDb/pT32CJcVFAhJM5VyrBV5UCpJjFoKSzErYlleURakqFrjfCPtPHHUqFJxAVqL+nOHlL9GtleUqUZBP4i05irhbdxeqgyGuOFwTYOPr/4xIMnlmGB6/D6WlGwQPaW88n1mQyXp4jFLzfFL3gcM5dK2cOMS1ETbK6wKLjXh4yiYIIFILheVQaI2R6GDlP3iNjDQg/t17nym7Q0OR4gKsBNu/F3ffm9rJnB490g3U5c1AZQNb61eucMdBiGeXSAvrep+cAFClB0xLejgOdK70TBgDoq9xwhSwyqnr+3cf9ax7W7v57XcjQhTHIF/1y8B1Yy01ovEDy9HyQbYVBa5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH7PR12MB9066.namprd12.prod.outlook.com (2603:10b6:510:1f6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 23:23:28 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 23:23:28 +0000
Message-ID: <4be3e780-fd5a-4688-b8aa-242f4c089ef8@nvidia.com>
Date: Mon, 1 Dec 2025 18:23:24 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] rust: clist: Add support to interface with C linked
 lists
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 Dave Airlie <airlied@gmail.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Timur Tabi <ttabi@nvidia.com>, Joel Fernandes <joel@joelfernandes.org>,
 Lyude Paul <elle@weathered-steel.dev>, Andrea Righi <arighi@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>
References: <20251129213056.4021375-1-joelagnelf@nvidia.com>
 <5B89D953-BB52-4E8F-AC40-1FA33C016780@collabora.com>
 <87d2c2d5-12d2-4655-b070-872c909f7e0a@nvidia.com>
 <1933c83d-7692-431b-b2b8-9c9a637ebed2@nvidia.com>
 <2584CA37-1AE6-4B1B-90B1-8DE4F826E760@collabora.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <2584CA37-1AE6-4B1B-90B1-8DE4F826E760@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR11CA0022.namprd11.prod.outlook.com
 (2603:10b6:208:23b::27) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|PH7PR12MB9066:EE_
X-MS-Office365-Filtering-Correlation-Id: 415a90e9-c70c-41c3-f6d0-08de3130a237
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q2M1REMrekQwUFVCdTFIRzd6Mjg2dFhPOGQvYmlYT2NpWEJzajRXRmFRdXdP?=
 =?utf-8?B?SUE0UkV3eW5WTkVXY3VPQnFKeVhNRkVMWXV1NzJOc0dqQzliaFRRTzJONVlu?=
 =?utf-8?B?emhieEd0UzY4NjNHRGt4ell6cDVjNnU2YVVYYlpCTmVsbk1xeEprd3lCa3Nu?=
 =?utf-8?B?c1pMR0dpZTBjcWJjd3Ywd05GV1VVVk9od3E0ajkvby9ma1dXVmI0SnpCYzdm?=
 =?utf-8?B?MlE5Tm5Gb0VtYWRSdXkxY2RHV1lWbUNYRHBpeEZYMkNQSWU4YWpIQjJsK0Q2?=
 =?utf-8?B?R2lJenR4eTZCUVV4RG9rL291QkFLS3paZFlBWENpSW5mY1UxOStMdmpwbW82?=
 =?utf-8?B?NEJiem5WMU96NXdxaC9uV3g2OUdDbTZ2WFU2ZG5yUnk0Y1dhc09zMitzK0tk?=
 =?utf-8?B?bTBuUzdPdEkrMHF0bW9qbUdZMTRJNURFNkpUbzYvUUVmZzQvRS9hdHNJcGUr?=
 =?utf-8?B?VU1iUDBQVEpnU09pZUdDQVU1aUZleUpWVG0wWXNMREtwNDdzVE0wQzZBeCtt?=
 =?utf-8?B?T0U2TE4zaTFydGdQb0N2QWRRY285RXBab2RQOWhEdTJhNy9WbXhmOVhhM3do?=
 =?utf-8?B?cHk0N2VQUkwrYkhqMytMby91VWdmY3c2dzZ1ZUxaT2huMitkL1B0NXpKaVJV?=
 =?utf-8?B?ZU9RczFTS2pjcDRDNFVITjJhQjJrN1czYTNJRVg1bDRRaU8ySy9Yb205Rmpj?=
 =?utf-8?B?NElaa3VYZEtMTEJJQjBSZk5pM0traGY4eXdkT1VrNjRCQitZbUZXM2FaWUUy?=
 =?utf-8?B?QTVaQiswYjE4RkUxTmZwVVM2R0swMGtUeWpZR1pyaHNWNDNqTEluZXIyRjN4?=
 =?utf-8?B?RFYxOGtDN2pPKzRXdmZyVmwrOW9IRG9sejRERUhidHoraEFCWEVJaW1rbjFk?=
 =?utf-8?B?VzRmbTVzaEJGaTJTL2RqcS91RXZzeStqc3ltSnAvOGV5dHJQb0EyZEVaQjZi?=
 =?utf-8?B?N1gzekJWL1FCaDdyaklsZEt0TGYvK2ZhWWk0eGdpRWFJRllpejZKalY0WXpq?=
 =?utf-8?B?RWxhanovUTIxd1R4ZG5EZHNZOHRjSWJub0JhR09UTHI0OUkrTkpaa1ZzZkl2?=
 =?utf-8?B?WXQ3cm9XRkJ1TlRhWFBFajVuWmg2bkNQVFZxcmh5WitmcnJMMjF4Mkd5cU5L?=
 =?utf-8?B?QzZmZXdvcTJFYU90b2l2a2J0c3J1YlE3TDZKbENVdUxXNzlHb0h5UHRVZ1k1?=
 =?utf-8?B?VXNTUmR4dTFrQlhkbGxIdEdYU1pwYWlvWG5MaXF1KzJvaCtFSmp5RmkxalE1?=
 =?utf-8?B?VFFFbGR5YTJQem5MTDVkZlN1bWVSQlZpdEZyQzdpTm9nb3dMOXE3cnhtQmN5?=
 =?utf-8?B?akF1eWNjbk9RNHo2c0s4dHA1MHo1VnBTTElpSVZKZGVsZGsxTmJZamlheUly?=
 =?utf-8?B?QVFCa2JHWXcxTEQ1RWVrQlRSMmJmNmVwMWJ3ZWNvVDlhdzRNTlU1MitQUURm?=
 =?utf-8?B?eDEvbEJmYm1CVGhIWUJaeWE1ZFNwZlRFZVMvYXNLdFF4QXpNRk9GS3oyNXMy?=
 =?utf-8?B?S2s0RmJKMlB1bGtmYTRpRlY5dVRLZ09ORng5WVRVQjNoUFMrMlhjdmpWcEdT?=
 =?utf-8?B?ZDdJS1dXWWlkZ1dabmRiNUc4aU1saFFhRFI5M0pEREc2c2hId0x4aGZQMCtw?=
 =?utf-8?B?alAwdWlqQ0w2d1BPSDZ0K0o5QmxRdEdXZkRHWlk5cDY5M2hhWlp6STNubTJm?=
 =?utf-8?B?RjhJMUd1L1l0Zm1vUXlVci90QWhQVUxwYmRKQ3MrdUFmbWdYRWdZUUs3M1c5?=
 =?utf-8?B?NThDSnJzMkdTYTBmWThFZ2J4czBpQTBzQXQ1SWdKNHdTTzVNdjZ6K2orZ3Bx?=
 =?utf-8?B?Vy9VS3FLanFFd0pOc1JIOTRLK0I1aUhUNWJxZDRsa1VOWm9iQ2c0bm9VTi91?=
 =?utf-8?B?aEJ3a2RRZnBrZDIwcjM1Q0RXV1ozYzZkcXZKbC9UOWJFK0p2V21WWkRqWElM?=
 =?utf-8?Q?S7pTrwSB2CIjNq7rhT4WpVSSWIM0lYOV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGdmRXVDNmZkMWFzLzB1VG1KSjB3aSt4YzgvMU03VEdMbk5SZTVnTHltM1l5?=
 =?utf-8?B?U3N5VVNzVldpaXQ2VGt1Z1RBNnlhY1dqVHA4THJodzZ5WDYxeUVEaGloak4z?=
 =?utf-8?B?ZWVLcGl3dlZaK29vc1l5OE1CM2NldGFjNFBHbjJvV0JEUlNOOFVRcndCYk93?=
 =?utf-8?B?Yk9vOCt2M1VZK1o4TmRqRnNib1c3TzJYYjkyUmVYMkg0Qlhac29pL0tML25L?=
 =?utf-8?B?SkNrdjRYY2kzM0Zkcmcvci9YZEhnUXNzUW9hREl3S2pkMzJOVTkyMzBVSlhQ?=
 =?utf-8?B?UnBFcjJhN1pIeHZLYmNsTXJLalJHWjc2ZFpLRnhyMzVIVTdydFQvTU1zOWpG?=
 =?utf-8?B?TmI1Q05HQW1kTmxVQjFtRTF4Z3Q0dGp2UHlmTzE0RUN0cU9CUmFoejd5eUlJ?=
 =?utf-8?B?UWJBK3E2MGJiRm81SG9uTEpRMVFOQjhWdE1UUkJTdi9PRm1kMzYxN05XblND?=
 =?utf-8?B?bytldXd4UjEwZFNjZGhHc2gzVWFpUnhVNlA4eTVMcjFNKzdveWxxc0RnYWdt?=
 =?utf-8?B?eUtqeHM2enJoRkVjeWlzbk5tdnJ4QklzK2JaV0p4SXVDQWpBU2RZbkplYjdX?=
 =?utf-8?B?QWpjSHBOT0U5M1NyRGNtMDZseG96UzVKZzg5NUlGWSt6VkN6cVU3RmFMb0J6?=
 =?utf-8?B?dmhiajZvSXFoOTIyeXVyaXBOM1dBK2FEUlVlN2FJQ2UzQytzbGpkamw5UURI?=
 =?utf-8?B?dEFkV1JPeWhBbHJjeHNrMWM4RmFTWk1hWUtUTEVPSFdRa0RLV0VLRUJ6RUFM?=
 =?utf-8?B?a0ltQVdIK0IxOVZkZUR2Y2Y1clJBWmdnZ204c0hrdDZHcFoya1V4dDkzdTFu?=
 =?utf-8?B?ZlYxYkVTbStLZTRvV1RwWjJ6TDFaZjVvcUhiWnBiUXMzalA5RTYwNS9ETkJ2?=
 =?utf-8?B?cHBtdDJFR0pTc2h3ekhCR0dHUHVlTlo1WmJ2dU9WbDZ6MFJnUkNlRW9DQlFj?=
 =?utf-8?B?czltQ005VUFwT1JrMmxMNkdteHo0ejlZbUhkcFhBSG00TVpwQ1ZpT2U2U2pm?=
 =?utf-8?B?NFlld2xHdTFVZDJFVlFDRy8xSE45N1JQeFgxZXVqUFg1cjNtdWRKT3RJRjRK?=
 =?utf-8?B?QlRITFU2cGdYZDJlZUFWeFJxaE96K1dwdFQwOFVDR05RdzhXRW9ISmNWeUVs?=
 =?utf-8?B?alB6R0tCQlBDY1Z5MVU0N0tTQnNhcWlXQXpncG91WG9oa0YyYjBnN3R6YVQ3?=
 =?utf-8?B?b1RpY3BnS0E2SG8zZUxTVWxXblhseXNwcHFNbGZNQXloakFjcjUrWEZaM3Qx?=
 =?utf-8?B?Vi9pZjlmNnBJT2VLVWtXWWJrcE41bHRZaFVBdlZjSHhBaGtXTm1DaDFMQW92?=
 =?utf-8?B?YjZrYkkveFlLbk02ajJROHIxU1BmbFRxaHRnSjNpYkFjR1hYMUhIcytsV1E4?=
 =?utf-8?B?cWwwcGtBVUhmZTJWWGxRWk9QRmpJUno5L1U5bVlwQkhRNU1jd25lWms2N2ZF?=
 =?utf-8?B?cG5pQWRpd3h2UERyTlljZzBqaSt4L05QOFk2Y0VLT0lCTTE1UlFMN0ZUZ0ow?=
 =?utf-8?B?dnUvTGxPSmp3UDZwb3MyM0dCZmh3L1podkYvVWYvL2JDOThmOU01MFNvaHpP?=
 =?utf-8?B?L0RQTzYwbC9naHRDVHQwOUFxc1FFZHFkQnlvMjFRSHJLMkIvVFFFNFBoVlps?=
 =?utf-8?B?Q1V4R0tYZ3Y2cWRnSFZDTDdHVFcvS0tkVkR5YzMva2Z4S2tTNnhURWo4RFJB?=
 =?utf-8?B?RldGYTduVUtvaVZoRytPZDc0c25NcnFXdFdMN0Z6WkVKVTNjNjYxL25OL01F?=
 =?utf-8?B?aGxjNFJydndRR1dMa2dtWkxLbnYwdHp3R2dvenVIU0NRSVJlZG9OMy9LOTFl?=
 =?utf-8?B?VHFUMXNVaW05bm41N0tJZGlXR0YyMUxnM3VOZnd0aldXSTlvTHBpZEU0Rndp?=
 =?utf-8?B?a2FWWGNpOW8remhOakdmU2JVWjNydnVQUXF5MkdVTUl5WHdQRFVUR0JFYllq?=
 =?utf-8?B?QVBBVEJYWHhZZUcxT2ZKRHdBQnRHcmVPVjdWdFV1amVSRk9nSUFvcHJuaE1H?=
 =?utf-8?B?TGl2Y2dyekpLVThrTlN2aFlxWlZXVkI5MUI2dm1GcmxPOXlpOUZHMjI5ODJI?=
 =?utf-8?B?ZTc5Tm1kdzlTSGxLRGp5TUxDOVNCQWR4enYxRG1hNmhycklOZHpid3BURDZY?=
 =?utf-8?Q?h8JgRkY9swzoevmRUkC5qJjRS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 415a90e9-c70c-41c3-f6d0-08de3130a237
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 23:23:28.4522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i+uFPX24RH6TK4PtY2GIRtWBR+Ife0QoczVIdlXbVsrIXFvBk3uIzi3NKBZPzWtHxXEm5uiy9hvMnzMm5j3t4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9066
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



On 12/1/2025 6:01 PM, Daniel Almeida wrote:
> 
> 
>> On 1 Dec 2025, at 17:06, Joel Fernandes <joelagnelf@nvidia.com> wrote:
>>
>>
>>
>> On 12/1/2025 2:35 PM, John Hubbard wrote:
>>> On 12/1/25 8:51 AM, Daniel Almeida wrote:
>>>>> On 29 Nov 2025, at 18:30, Joel Fernandes <joelagnelf@nvidia.com> wrote:
>>> ...
>>>>> +#[repr(transparent)]
>>>>> +pub struct ClistHead(Opaque<bindings::list_head>);
>>>>
>>>> I still think we should call this CList. IMHO, it does not make sense to have a
>>>
>>> I am guessing you meant to place this comment after Clist, rather than here
>>> (after ClistHead)? Otherwise I don't know what you are actually suggesting?
>>>
>>>> Clist, and a ClistHead (notice the capitalization). CList and CListHead are
>>>> easier to read and reason about.
>>>>
>>>> Did anyone push back on this?
>>>
>>> If you are simply recommending renaming:
>>>    Clist     --> CList
>>>    ClistHead --> CListHead
>>>
>>> ...then I'd say "+1" for that suggestion.
>>
>> I am not fond of the suggestion but I don't oppose it either. I honestly don't
>> like the triple capitalization with CListHead though. Lets see where all of us
>> stand and then take a call on it. Opinions?
>>
>> Thanks.
> 
> Well, there are three things at play:
> 
> C, List, Head
> 
> So I think that the CListHead capitalization correctly describes it. IMHO
> it’s hard to see “C” and “List” if you spell it
> “Clist”, i.e.: it’s easier to read this as a single word and wonder
> what’s that for a few seconds.
> 
> This is a bit of a nitpick though, so feel free to keep the old spelling if
> there is no consensus here.

No problem, I'll change it to CList/CListHead considering John and Miguel also
felt this is better. So I am the odd one out here :)

Thanks.

