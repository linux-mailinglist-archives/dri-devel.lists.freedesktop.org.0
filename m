Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 679D3BEF5E4
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 07:40:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B14C810E258;
	Mon, 20 Oct 2025 05:40:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IZ2pqgHz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012018.outbound.protection.outlook.com
 [40.107.200.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C15D10E256;
 Mon, 20 Oct 2025 05:40:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N5kLBTKLctWgKgJnI/O0KDDXyOhZCYtKK2nWDyMopmaY3GMAQD0v2VhO5wECT6eR+FHCID6i8xTQzdixnIyoqXHzj4ggC4OyOd2HSZuKqsrmJUZ9+GNJwy7Vld316EwDaZNovaula44i0WNNaC1zABWsRsWab0K+v+if1xLOvB8Xn/u+xEdA2utQnCFEdIkf1IRyfttPav2StGbKh6ZMp5UABXib8hP432YTbjxAlxJO3kkbcW0VjD214/E6Vrsd9mdtrsJ9LlGKF62GMM59CVS6Rv+RHPb6GCDCx1HM8ocunvle5XYxC7Nqz0ixJ2zbhT4uMO4JZzX/w0EkPz/lig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vj3moEDcUQYgCdQhJ8TgNhRk/uudF8zXtE4A0ivi3YQ=;
 b=iS1wBPLDkzRY68HvCEdjrr4hzQqIgVEzfT2scxzzKmEEKUBIYXQ0K1v+xjEvz9cX8Uluq60MVevhW4o3og8hDaQHWlJs1mtuJu1qLKB2MyGcRvILr94s3PG7yLgoWRwCzEbX0q1dh9lhh0cOlcdgSdQRwni4Z5Xhrf3gIw9kLxi7UmVTAWLCWZULaja+sX6QVsGwLKm0AVmhPg/DRmUc9rWS6KxVNYFVoVAHbLioOvsVock1icZsCNhff0/tY28DxfpOsdQ+m6R6YjgJEO4IChYw0/H5UuZa1QbUgw4QXP99hrbUm4/JoE95wIdOaFEY1jYICoEjbuUjk8bouXQRqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vj3moEDcUQYgCdQhJ8TgNhRk/uudF8zXtE4A0ivi3YQ=;
 b=IZ2pqgHzb5ANvq9Wgu5vlM90FU/VphhNMq+8/J/Tq7famDg3fRLYVeoYzSV5ft+6ecEACbh0uVrPsL323CJ35tq1pCVJsTlTtHFveqmN/xYCkkR2QCOsYcRO33AHQH7Ayy0+BVM157DwhuQ5XtABvonEmXPkiRQX6SRQLr70wAYBCOy9E8n4ZGSmp2IVGsH1h7FqSqj2485h9MlFoZEHLL3BGQRWUYHlENpAqK3WJorWoK7XkuNP8KUcQERwXuRlQGe8gz2SH6jUZtLOoehoGqg6Ou7UVZ6PPtAz6dL5sRSfQt0TB3DmhKPZ9uMymrtj2B7tm+NsNqqrP8J1xhVFnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY1PR12MB9676.namprd12.prod.outlook.com (2603:10b6:930:104::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.15; Mon, 20 Oct
 2025 05:40:17 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 05:40:16 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Oct 2025 14:40:12 +0900
Message-Id: <DDMWPMS0U5PK.3IW61GCOI3GZB@nvidia.com>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "John
 Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v5 03/14] gpu: nova-core: gsp: Create wpr metadata
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, "Alistair Popple"
 <apopple@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251013062041.1639529-1-apopple@nvidia.com>
 <20251013062041.1639529-4-apopple@nvidia.com>
 <DDJJ4ECCSE2I.1EUAJRU9JBGNI@nvidia.com>
 <zwaefk62to77b5nyakeiboyj53fge3lysc3z7arp54tyyherdo@nsqhuig7bmbc>
 <DDK4KADWJHMG.1FUPL3SDR26XF@kernel.org>
In-Reply-To: <DDK4KADWJHMG.1FUPL3SDR26XF@kernel.org>
X-ClientProxiedBy: TYCP286CA0213.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY1PR12MB9676:EE_
X-MS-Office365-Filtering-Correlation-Id: 289276b3-bde3-4976-1eea-08de0f9b25aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WHNXTW9CaTB1bWpsRzRrVC8wSWNjanBwenJOd2NxMVRUNEpoVnhmTlpvd29p?=
 =?utf-8?B?Q2lvVGZJcDc4dkI5ZEl4T2VIOTZYTThHQUQzc2RFU2NrN1IvVnJBaDlEVDls?=
 =?utf-8?B?L05TVy9QNDk0MUZCV2I3ZkQ2b3B2c21EOEo3ZE01T3Y1WlJFT2VnaVY1dTBO?=
 =?utf-8?B?YlhuYzJNUDJhYW11RmZBVmtFZjkrZkxEUzVVS2hZS2kxNkhYVVlvV25RL2h3?=
 =?utf-8?B?NUpwd2FMRHMzcjFISFNFSlRMTytnTlNJRUxpMThnS3BjZkhnYkc5cTlpdHFP?=
 =?utf-8?B?V2JOaUdONGpqRGJueEhlMzFMMGVvZ0RLTldFdzJzWmc5Y3F4am5Dc1FrdTQx?=
 =?utf-8?B?WWM2cHJmakIyWndFOVhsQWlPSkRFSTJZMEdFTWNpUWFUbHZQRjNJN3VBRmE0?=
 =?utf-8?B?QVh0MVA1Tmk3SmJOeXlFaVRFNnYvVzB4d29RQXFqMlNOZTIzaGtHNWhWcGMw?=
 =?utf-8?B?eUV6Sks3Z0hiOFhBTS9zV0phS1RqYytYQTZaUnJGSjZ1RTJZLzVWTVF5Qldv?=
 =?utf-8?B?NEk2eEVkZ01BbUlVR0VwTTRiMHRZQ3lXa29oRXIwNEJrNFEzb3hNbVoxSUJI?=
 =?utf-8?B?Ly9GOUtsMUI1a0FBMWxDR2o2VVNLamxQcEVidnBFb1RTN3hYK1hzOUhRc01J?=
 =?utf-8?B?M2g4akpXcEZJdkRtcWx4Tlp0SDNuQU1WWVRIenJsRFYwNGptS0NRdzRLbUYz?=
 =?utf-8?B?ak5Wa1ZVM0FKT2p3STNVOVpjSlYwbmlKTU54RHJaMFVSUnVNb2pISFF0Uncy?=
 =?utf-8?B?SUdGRVg5amNUYU5FR0ZwTkVQTSsxNjRTbTh0TXNqOElrK2tiTW9objJRdTF5?=
 =?utf-8?B?MTZsUU5DOHZyMEprL1R4Sk5kNStBYWY3T0hUbDM4OUh3WEI5TUR3aTg3eVpj?=
 =?utf-8?B?NUo4eVY3WWdYcFlHWUVYRkQwa2ZQWXBOYUt6VXNBTmY1a3FyUm5HdEFKQ284?=
 =?utf-8?B?dmFjcDVFaHZPVlRBZUlDaENybEVHenFZTG5jSEM5TTUvWGVwQjUySEZiZDEx?=
 =?utf-8?B?bUYrT0ZBSmo0QVAzeGh5MWJ3enp3YnJURlJuaVNGUzRRQUZweGtqakpoazhx?=
 =?utf-8?B?NTEweHpKejFNRUFSejFySTJWZDEvYVpPRGIvNHZaaVI1WjZPQ3l3Ly8vNWdx?=
 =?utf-8?B?VUlTU0t0bFdDR0FVMittSXZibktpazl5YzNUZk9uTEhIYk0wazlDc0s5UjVo?=
 =?utf-8?B?YzBad0JxNDBhN29xbGpZcDc3QnAzd0haSTRpaFV4dzJRbVBOK2NKYnlWaHJt?=
 =?utf-8?B?ZXRENTZKYmYwa3B4UkYvSndibHpFL0p1clN5VUhielBnMDhJQjZnbUNzR2Vk?=
 =?utf-8?B?T1E2ek56YURCRlhURmdXblg0L2t1THhNaEVkeGQ0d1I5d0hHV0Q5OHZpREpr?=
 =?utf-8?B?dVNQRnRVTkZOczdTQk5oblBpSGNUYklGU3BQMU5EQ21Qdmw4UE9kZVV1Wkcw?=
 =?utf-8?B?RXY1Nlg3UUlMeHVDQWpOOUhtQk9QN216WDhFL2p3WW9SRGkvV0s1ZStvY0sz?=
 =?utf-8?B?QkUxS2p5VGVxUzFNcVh4QTBVbVFoclZvbFNxSTZ4RHhSb0k3NldLMmpuYkJo?=
 =?utf-8?B?YStHb3piWWFlZms2cUxjL0FXWVVWMy9mLzkvVVh0QjlmRWlPZzA2TGJ5NUl0?=
 =?utf-8?B?ajdubHdmNkNHZENmYk5kWDNaQnNJbUI0Z2ZCaThDTjhvcU1FSktzTFROSElW?=
 =?utf-8?B?aU9BRG9Fa3lnM2c4Q1hLZ1JmWVF4R284QmloeE1id0Q5Ulg0OC90QnljVzVp?=
 =?utf-8?B?MmVoNTZKVnhONGxHNmpSMy9VenNVK05PejR0TVQ0K3BDeW9Tc2RBQmdqMFJT?=
 =?utf-8?B?TFdYZUI3akd5Nmt6clFJR2xTaTVqNDVKbko0bE56akdkeXdZOWlTbmcvYUhT?=
 =?utf-8?B?dnFUY1RtQUdQdXZwSTgwOGdCQko1YndCQVdTVGVzTW9TbnZkMkRrbVhpeGdY?=
 =?utf-8?Q?Xw9ScAG9CdpTsgtKiZ/4tAXMmRllCq+S?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFFtSDRRR2RtY1UvZFVCODd2ZEdiMkNwZ1RjRENaZUNaTHpLbGp0TnVBOCtN?=
 =?utf-8?B?Qi8zMFFjbGIrV0NKOHAxVUREK0YyZ3VJb3FXelBBUmtRZ1RjM2VOMmZwaDEr?=
 =?utf-8?B?SlVjc2E0MGJmbjV1ckM1TWlEcWtjSjV0YnhLVjJEbnhrY3JzeHZoVjUwNVZt?=
 =?utf-8?B?QnBZWjJrRHFjQURZQkVLb0ttTUVtV0w1UG4yamI5MFdoMTg0OE1BTGJBbXha?=
 =?utf-8?B?MVRKUWpZYUhrbEJuSklhL3dHNUNLdmVkb2pSOVRRMGkwOFNHK3hxaXgyMCs4?=
 =?utf-8?B?amhvdkV2QTBnK0JWaHEzNmgxbnlaWHZRTzExeWVGR0UzdStOTE9Bb3ZXdnNp?=
 =?utf-8?B?Z1dYa3lnOEhRdFRhek9RTStvNWwra3VzT1dHbGQyQnl1OXBoTVBuV3RnZWZC?=
 =?utf-8?B?MFhHaThVSERrNEdiY3B1K2syZ2RWSURSdFNBNE5uQmJ2enBMQ0Fmd2F6NDFj?=
 =?utf-8?B?RnVFWk51akVDNzhJc1RCN3JGTSswcDAzSUZGTnFCbndtTzRsdDZiNEZ6b2F1?=
 =?utf-8?B?cUhLS0pLNGt1MnRnUHpwN3JJTmQyVTNjWHJJZi80Yk1xS2FNSHB1NXJwWjFF?=
 =?utf-8?B?ZkJsN1ROd1hHaUlVaUk4NG9sYjI2UXNtdFgwVkpaTWV0NW5sSnZIVGMrdXpz?=
 =?utf-8?B?Q0pITThFK0xTa0FHMFd4MHVLSXZNNkcwWklTdGo2bU9xZFVXeHIraktNUXZC?=
 =?utf-8?B?cUNxRWo3dmhHemh6MlVGSkVPR3IwMXdmNmZ5NUVOK1lKRC9UWko4anZRR0lP?=
 =?utf-8?B?T0RQdkgzNXJhL1VDb3RCTkhtZUdNNXp2UUkwd2wzblVVMzJ4aG5tUHBwcllk?=
 =?utf-8?B?eDFrUGdyVU15Tnk1Z3lvWmpUWTFtd1hHVmFIYUNaU0FpZjNYUGZCUVEyejl0?=
 =?utf-8?B?VW9sTzJpdUJycUh3VnRVKzlEbWlWd2pPamxpZTBqUUQ4MlE5MlpDT3VuS1Nk?=
 =?utf-8?B?c1ZWSUlmc0JFYzFKZ2FuWFhCUE84VWZPMHlncGt3ckhJVC9XWnpCUjhHQUhi?=
 =?utf-8?B?cXVFTHFhMEVXWXlZeGc5aDZvM0w3RDNRQXhRZEhhMGRIdU5kYWVDdm1sT0hv?=
 =?utf-8?B?Qmw5aStkdGZjTVZrK3JmTjAycmppNWgyUUduRFJOUHZudVN5RTh3QzBMQk1H?=
 =?utf-8?B?QnVKUWJoSERYZVlkbzRZeHlHdlZQVzRDNXlORlo5VExONEF3OC9PVEg4UzAz?=
 =?utf-8?B?Y1JLUVVWQWduTXp5U3g4MHMvVnlrNlJWMzNGdGxOUGIwWHFPUkZNL0ZraG1o?=
 =?utf-8?B?TXNoaW14UHVIVUZFVitON1pONmJRRW0vL0lobEFBcnBiRVp5VDI3VGsrOW9V?=
 =?utf-8?B?TjZDcDliTHR5NmRtTkpNSHNNZXJ5Y1A2bHpOUEp2N3FUUHM0OHowSDdKZGNn?=
 =?utf-8?B?QTlRcGRvYWdXeFNUSHdnS3AxaEJDY3FoOHZXeG9mSHVvcllqRnBQdW02VzV2?=
 =?utf-8?B?MDZBNUxRbFM3M0hBTkxaOXZ1UjJ2S2J6anlwbkNJcFhlT3Q0VCszekwyWG8z?=
 =?utf-8?B?bkh4bXNqeGU3TEJsUW9mVXl4dnJkbDNhS2V4MGJ6WmNrZFlnUkFzNUJMVHlj?=
 =?utf-8?B?ejhZNlp1TkJTY0duUDFyNXcza1Z6WDVzemN3YzNXeVhRSTI2Ni9YbzNJSW5P?=
 =?utf-8?B?eHhYQnh3cWF5bVlPYllyZE55b0dMSFJNUjR1bkZRSnB3cWV1dGtYSGV5UE1O?=
 =?utf-8?B?eUpYd3lRcUR1bDJXZ0JITU1uMlBiaHVLd0JpV1g4NDVjZ1ViazJDa3l3dXhE?=
 =?utf-8?B?cmwzMFVCR1JOdDNXdU90NTJYZUxSS3RVTndYUzVyNjNValMvSlpIK1FXT1VC?=
 =?utf-8?B?UVRUTUoyM1NRR09ncVpWMG92MTFpQncxaWdKbnllMTdQSndoWEtaWVYrMzQz?=
 =?utf-8?B?UmxFeUpYUGxPdVV0ZFViaXM5L1Z0NWs5NzRSTzZOdmZaYkR5TEFpbjFhNGRN?=
 =?utf-8?B?UVYwT3pQd1kvYUdNSVZveW43ckk4Y0hyWkh4WnFkNmxVWDdNTFZaY0NUSzJl?=
 =?utf-8?B?NXMzMWlaOTkrNGJxTXlaZ0tPODRUNU9IZGdwNEU4T0dKdTVxakNNbjZwNFlM?=
 =?utf-8?B?Q2xkaVA0U1hWRzhxMEJNdjNJSXpCeDc0N0ZDN1dMYTFuWTJDaEVFK3VaS25q?=
 =?utf-8?B?S1dFQkVucU1KZ28wL1JrcDJvQWFwdlQvTUlFZDhUN2d6OXZYenFyTytaRWhK?=
 =?utf-8?Q?LvNsPGlhMsP5Hf6r0DfHmuh0eTiJU3ujChhUgogHRpvv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 289276b3-bde3-4976-1eea-08de0f9b25aa
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 05:40:16.3921 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7PogSj449FwezYDUKeb7rzrw+CATK1NBjRr1RD0iF+uEZ9ixOHIDIeUNXOtj+pjrsjeZH7rlqMGI5xgrADdBnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9676
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

On Fri Oct 17, 2025 at 8:11 AM JST, Danilo Krummrich wrote:
> On Fri Oct 17, 2025 at 1:03 AM CEST, Alistair Popple wrote:
>> On 2025-10-16 at 17:23 +1100, Alexandre Courbot <acourbot@nvidia.com> wr=
ote...
>>> On Mon Oct 13, 2025 at 3:20 PM JST, Alistair Popple wrote:
>>> > +impl GspFwWprMeta {
>>> > +    pub(crate) fn new(gsp_firmware: &GspFirmware, fb_layout: &FbLayo=
ut) -> Self {
>>> > +        Self(bindings::GspFwWprMeta {
>>> > +            magic: r570_144::GSP_FW_WPR_META_MAGIC as u64,
>>> > +            revision: u64::from(r570_144::GSP_FW_WPR_META_REVISION),
>>> > +            sysmemAddrOfRadix3Elf: gsp_firmware.radix3_dma_handle(),
>>> > +            sizeOfRadix3Elf: gsp_firmware.size as u64,
>>>=20
>>> Very unfortunately I'm afraid we will need to replace the `as` in this
>>> method with `u64::try_from` and make it return a `Result` for now.
>>
>> And presumably most of the other `as` keywords in this function dealing =
with
>> usize as well? Have made the change but would you mind quickly explainin=
g
>> why this is needed? Is the concern that usize might be more than 64 bits=
 or
>> something?
>
> Since nova-core depends on CONFIG_64BIT, I think we want a helper functio=
n that
> converts usize to u64 infallibly.
>
> This helper function can simply generate a compile time error, when
> !CONFIG_64BIT, etc.
>
> We can do this locally in nova-core, but it could also find it's place in=
 the
> generic infrastructure. nova-core clearly won't be the last driver runnin=
g into
> this inconvinience.

How do you see this taking shape concretely? I have tried writing
extention traits (e.g. `IntoU64`), but unfortunately we also need to use
these in const contexts so that won't until const trait methods are a
thing.

The alternative would be to have const functions like `usize_to_u64`. It
doesn't look as smooth as the extention trait, but can be used in const
contexts.

I can try and provide an implementation to apply before this patch
series if given guidance on which direction we want to go.
