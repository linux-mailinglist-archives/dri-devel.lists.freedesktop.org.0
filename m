Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CACDB406E1
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 16:32:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E6E010E76F;
	Tue,  2 Sep 2025 14:32:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kGdSC6Ni";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2081.outbound.protection.outlook.com [40.107.244.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C62E10E764;
 Tue,  2 Sep 2025 14:32:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BSTJwR2UW0/655PpxSoKZjT91AqL6GOKnWT+TF7U8AI8cWctd1BVyK/M7jiQyk7U3OLQjc6T04se1SXsrwP752cV881VNduSSP420/PrH8yKN40sfioAWHQzpyVX99n2fcxcRVIKwD3+SKFv0wRutEc32WuCSap6GA+Ta4urLXm0udWXyFclHzMCKPo3185EqGncrr3vxAPqQHjCdy/HFtac+FbHqbsQ4QZbLMaCSooYCSBnzoLPKlQQ2sSZC8GruxCIjgRtS8nXOpA87pqFSoPQgFU6MvmRgCtjgbZoQJZ0ZxbKzLS/mxBf3lnSyNnIc4TdtwRMOIdfA4arwKOvSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/oTkzzQkMQDEW8c6STwFRNckeRpx00U/OqHymbkgmI0=;
 b=oEpV9LTtdJ3zZyZnhhHGXIPTNKndSTCMsO6ncOyjsnfCwwpqt/QP0lNH/T5OBsrBLaj4iqY6lwujscQ/IuKCTPEuUMRV2tsjlfm3HuvlOmWwcfRsqXZ1bxpAo5dj7WD8LN0R1ft8AL/LMnpSc14aHjjTqWXoE1sB9q951VGw+8adGXdDviv4isZvPuEsxjcOharvbBtccWrQsxLP2lCjI/r/6A9hSdR+NSFiNRHSDluIc2Nv3s56o2B5NX1ycKbzST4AbW6wBN0feKXTcXC+kn0iZYPFva2A6t/xjWKOksUP0O9hbhz+Hhs1dMr1bM26XZcAG/PZtff5HSfEmQ/exQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/oTkzzQkMQDEW8c6STwFRNckeRpx00U/OqHymbkgmI0=;
 b=kGdSC6Ni9syTU78w+xRJqHYp+K6bOWddxfFSnoUMJV8vS3pq/NQl/wK9lLCjMyq7asHURBXFf295rW6+dJFVHoe6iCtkCnigWI2lSwBCw1t0KxfFsrq2sZNXznL0OhEB5NbOBePzwhMNmu6XSvGiKchyO95zazT9+nPTxWAZ4Bau9HnEiSr9MAhwSZfy+kaVCNTarGpUU4aoIGbyKQRpYCP6aDgN5N/wtVFczSAYdkgpp74eRSTtqKYYG24f58O5+GHQBjMc0qrhi/MROUVomAqOkhkjxYWyDV8LYAXNYJ5Vy5yNuQHhBuDkgJHbRJVBE9+jR11KvL94U2z2BTKQZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB8955.namprd12.prod.outlook.com (2603:10b6:a03:542::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 2 Sep
 2025 14:32:21 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.027; Tue, 2 Sep 2025
 14:32:21 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 02 Sep 2025 23:31:59 +0900
Subject: [PATCH v3 05/11] gpu: nova-core: firmware: add support for common
 firmware header
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-nova_firmware-v3-5-56854d9c5398@nvidia.com>
References: <20250902-nova_firmware-v3-0-56854d9c5398@nvidia.com>
In-Reply-To: <20250902-nova_firmware-v3-0-56854d9c5398@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0157.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB8955:EE_
X-MS-Office365-Filtering-Correlation-Id: a2e044e4-3b3c-4220-3ab9-08ddea2d8692
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U2pXaGxGQWRCZmNwU3FJaVVLT3RNb3dGanhXU1ZjbUF3SUF6ZVFackVPdVVH?=
 =?utf-8?B?bXQ0UzN1NklIVzZnZlg1WUdRVFVoY29HQWFYVExRd0JaeFF6MnF0b1k1SVVE?=
 =?utf-8?B?bmtmRG1ydStBSWFVRzkxZ2lXdS9SdTdPS1NIakRKQXFWWVRGWHZmQ3RmZ1pC?=
 =?utf-8?B?ZFRFZUVEVk0rTEYvQkc4OHVGWUNvVVFWeEhzWlBRYVI4VXhIdHBMZUc3dDFr?=
 =?utf-8?B?bHlReVJFNXRzWCtUV3ZETzhidUZNeXh6VVR4M05OOVZwVjc0bjBJNzFNM2JD?=
 =?utf-8?B?K2dQNWZDd1JQSlNHNmxKcWh3OVFSS29PTjYrZTRRNmE1Yk83dSs4SzMyOGtV?=
 =?utf-8?B?ZVJFOU5TZzNSejBiYktQNzN6MkYwbkI4RjlTbUt2Z0ZiV2NxV3Y3aElpZ1BL?=
 =?utf-8?B?andEMEdneTgxY2c2TVBxN1R3MmNwR3MxbzFpTS9UaDE3UnhiTWZTQ1hLMHlv?=
 =?utf-8?B?SlNZVlNWdFJDT1dUakp2aG1rdXlSYUtONlhIamhBRUU2blQrMHF5ZDczTkcx?=
 =?utf-8?B?U2pwN0ozZ2tZS1lJVUdzMHdQTE92MkJpS1g2SG5kMHV5VmR6U2N2Z3R1WmMr?=
 =?utf-8?B?N1JOUlhZTnN2U2RHNzhJcXk4TjVBUGlOUDJVZnI5TGg1cFpyL0dqZk5pOTky?=
 =?utf-8?B?Q1dQa0Fqc3hCTURXMUI4YmJ3YU4yK3dqOTExYjdyRGkvUkxIbDEvY2tuLzNZ?=
 =?utf-8?B?Q1ZSeTJ0MDRqVXJiMGg3SlpleG1LUk5OeWNCZ3pRNHoxODJwczBrakJBM0Jp?=
 =?utf-8?B?Zi9ZaEhYUTRzWTJRWlZadEk4YWx4YWwxaWgreTZaYjdZRkdoOTJmendsYmhV?=
 =?utf-8?B?UFB1aUZBU0h1WnNBaTNjNnJ6M1VKcWdDaXZ1bW9peDFmSVdQajI1em5JRU50?=
 =?utf-8?B?bTRXUDYzeTN4M0VnUjN1YXlldW5VL1dGWW5PdlkrVXRSczNtenBTeXM0a3Fp?=
 =?utf-8?B?MWMwbWV3ekVnTWNWdWh0anZYdXJxNWZqWjdIeW9sd1hqTnp2N1hkeXY3STFM?=
 =?utf-8?B?N050cXpadHZsQWkyc1NGa1AwQUk3RUMrbG1LSFNIS1djOHlNa2h6OXV1bFhw?=
 =?utf-8?B?QUU4NDJleFZoeUJ3NDBmbzNpT3l0aXd1cm0yR1JweDBzV1B6cDdBTzJmRFZI?=
 =?utf-8?B?SmhBRWFuOXRQUnV4bnBLYVpQcGRBOEo3VjhEdkl5SGNkK1lIWVJScEg0Zktn?=
 =?utf-8?B?dHYxYnJpTmdjdHdhall5ZGVZNDUrZXpRU2VhRFFJY2tKbTl3UUlKNjdQSjIz?=
 =?utf-8?B?Y2N5aXVwdyt5QXo4dXowL2RDNTJ3ZXhqRnpFV0FtMk83VGhZZ3BhaStzZFVh?=
 =?utf-8?B?ZVpQZEZhTkM2RmtiOStsTVFkZzRxRXYzbk9uUGxBNW04ZFFtOTYxNU5FOGs0?=
 =?utf-8?B?ZWV3d0w3RXEzaEZKR0xZN3BWcS9tRnVjaGZ3Smo5MFhOREk3R1dTMkJVQThO?=
 =?utf-8?B?cllLcjdOOGs4S2l4M3J4c0dsamUyeWV4NzhGZXpJYlEwVFl1L0R3V2VvU2xi?=
 =?utf-8?B?YzduaGNhZHdFK2pvM1cwbXVaTmdEMFFvclRMcHM1enpQbUNpNzhySU40OFFP?=
 =?utf-8?B?V20wRzlGamFXbWcxZlR2R3N6QW5nQmZSMElpOWJiRDRubzhHYVFnQkNkeHVW?=
 =?utf-8?B?RUFJbUFjbUpNTytmYUlGSVZjNG5lZWRMcFlFdVJUWjNMbWJ3QVIzUHlOQmM4?=
 =?utf-8?B?NitDMjcwQjEzY0RQamdubFRucVcxM0VyKzJWdXFHSS9UTlhwalk5dFhpenh5?=
 =?utf-8?B?TzVqTDJhQUlrTDlUR2FVa1lTVHZmbXBJU0VnYVR5cHVkaHpEUjhoZ2JiZFE5?=
 =?utf-8?B?T2hEanFaZlE0K3dvZC9mcXQycXlNRUVHVUhzOXBsa09ISmgwbTBidndtaVU3?=
 =?utf-8?B?b2REcHhKZHl4L1JqdjFmU2JtUlovdjlaaUlkVk9ITDdBWkhjbnFUbjhIMEdM?=
 =?utf-8?B?dUh3MTJJaHg4VWRVWHBCSkZTcVYxYXdBd3JDNHV0TUVMbS9hZmVqbjBVa0sz?=
 =?utf-8?B?eE05SEc1Z0RnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(7416014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEdyMWtLQUZzc2NmYklaaFhpY0Jqd21zbWtKWkZjSFRnaTRzcnFJVWlnWTBK?=
 =?utf-8?B?a3dWZGR2a0QwUE43WlNaVmRhRGFHdUkvdWxnYi96SFJNbHFySGVyZW1EWWp5?=
 =?utf-8?B?SC90eVFBbmxSbmx2NzZOMUFDcWhKaGxPSmpDUmpwQXAzZkxvS1BXcE5rY2pq?=
 =?utf-8?B?enpKcEtESy9UTTM5aUxSYjd5ZHZabTl1dHZ4dzU5aGxvSzhZRUh2TFNoWG1w?=
 =?utf-8?B?bUNibHlZUnpnRTVrWjRSRkhHcHZ0cEVxOTRtTEE3SUkrRmpKSThMcE4yTVNP?=
 =?utf-8?B?REM3R0E3bUdrYTYwcVp2b08wQUlId2swVnZVeG1GSHU3YkRlVkRiOWg2Ukt1?=
 =?utf-8?B?cXMvQUV1RWczQW4rQUVBVFJkM1d5RnlBVWgrRXVWNFZQYm9zMXhpbkN2K3VY?=
 =?utf-8?B?bis3Q1I0MXhTanhPN0hzWGlDSHAxWGZ6Z3B4ZFVkT2tTQ0dOeHRuQ0ZuY2Jr?=
 =?utf-8?B?Tko1Q2JHSXlxOXlYUU5zeHBXV2w0OU82ZTdJNk1EVkd0akFjQnVvbkFFbVd5?=
 =?utf-8?B?TXF1ZmNZbUU3Y2FjK1AwdVhVWTJrWUVRQ01QK1MrV2xVSVRpUjc5aHE1cDZa?=
 =?utf-8?B?ZSsrWmRVZ0pQdWE2TVZhUTV1VlNYZzZxTy9sNUQxWENGQkl2bldTU2gzcEc0?=
 =?utf-8?B?OVZLS3AybUJLdXVJaWVGTnN0eUxONFJlcWNqSC9SNDBnWTRwTzlFMVdwSFhT?=
 =?utf-8?B?L3I1NXBhUHlNYmNiSXluaCtNd21aMVVQWmx6MldhUnM5dDhiUkdMa3J6Uyt5?=
 =?utf-8?B?RnA0QWZIaCtOWlBNWlU4TmZheFZkOERuajRBMjFSSGhEbXhueVRZVndmU29J?=
 =?utf-8?B?RnJtZnpLNzJFR2dGUEJOYkoyWU9GR2R2OXNtS0E0T0lsWmlPK2h2d1REdVpl?=
 =?utf-8?B?cEFkeUQyV3Vablk1Vy9VaUYzTU5jZUYxelphVkN3WnVqeWNkKzV3V01aUGF6?=
 =?utf-8?B?TDJvNjRDanVESmNObXh1OFpob0hQcVFyV3ZhdnJKMWlTd1BCcDQ0QXYyNXpY?=
 =?utf-8?B?Tko2ZS9QZDNKN3BMZ0hBQmFndHZEa0FvdmM5ZzZpSG9XaVRhU0tocXVvTTFR?=
 =?utf-8?B?UmVhWXFCbEJOV2R6T2hOT3lMTVozM1k5NGJySm1xcnl0bHBhQlgxRWkzeHpT?=
 =?utf-8?B?bTNablYyRmc2bTJtUEFHS3dFMm5VVHl0bWJ3cnhnak9ZczlMODlSRDExb245?=
 =?utf-8?B?UnZFd1l3ekpJRSsrRzlWOXY2dkJlREhLdURqZ0RzWTZPdUd6MHdVTFpxQXpm?=
 =?utf-8?B?L3lNNlJkRnlQeDB1WXVhUDk5bGdJUndyYjUrWVE1U2d3TVhTQ3JrVE1HcVpH?=
 =?utf-8?B?OXdya2thN1pEbEpPZ1ZQK2VTZzNNT1ZESWVOdnRXa1lucEpzckxmQ1djcG5B?=
 =?utf-8?B?aktDV29Sck8yaWVKaUk4NWFmZEpsUlNVUDI2S1JwL0NLenRUMDhLM09US3ZL?=
 =?utf-8?B?c1FPQi9Qd2tWa3JyUHcwZ2wvVmJoeEVSd00wZk1VZ3FGbXhnNkVoRmVxN21B?=
 =?utf-8?B?MU10RE00L3JOY1NCbHpCeWdXYWhhK1FQU1ZodU55RFZSU2hycXI4c3VvUjlm?=
 =?utf-8?B?dHd3ME5pV2NaYlllRWhsa1BZSjNmNGMvTElHYXRuekhUaHdEbGdQblhFQVZ5?=
 =?utf-8?B?L3UzdnhsVW85T2dIdnVRNVpoVVoySjJPMDQ1bDRKSXNuUmQzVG1JMUpwMmIv?=
 =?utf-8?B?WlMyUHNiSy9OUUhkQ0l6ZGljcXlwanhXOXJxUXo1UlRVNFBGOENJZ0xOOERW?=
 =?utf-8?B?S3MzOHBTby9qNWhxdkkvY2FidlgzYmxKUTNZQUd0RVJDVEZFbU9DNjNVZ1Y3?=
 =?utf-8?B?RHNTKzVyYlJWTys5aTh3YXlVVHIyUkVDTWtMUFNFbTZURno1ZTJFR0Mya3RW?=
 =?utf-8?B?Ly9TZW1BSzc5clFRaU9aL1FmbzV2SUpXRXlzSGtyeXhFaFBYNlJoRFVLeXRK?=
 =?utf-8?B?MlgreXdFcjBrMDQvODBPVTVySXowVVJXaVpZbjNzNEZ6YjlQQ1JmZi9rYm5U?=
 =?utf-8?B?K0FZU21xWDVGOThUa0RnMUE4M0FxdTViSzJmVjg3RmF1ODFkWVFFQVE0clNo?=
 =?utf-8?B?SERyUWRCcmxJSHg2a1gwaHZKY2VRc01EMHpINkZCcDU2MllzMmc2YTV5ZnJP?=
 =?utf-8?B?ZlNudDVRODVPaExhdFRqbFByYVhRRGhLSnJSenFxUDBWbThDbSttZzQ2cWNs?=
 =?utf-8?Q?/PunskodFbpoC/RdLeJoucw9MzEjZtaBjk9kbuipIdUs?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2e044e4-3b3c-4220-3ab9-08ddea2d8692
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 14:32:21.0635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iAmCoj+PSy5ytEAqnQdNE+tKTA+BHApfsARC5H3f3j2gWLbL8C6slA2j8VPyQXVRcVbO4p7S/ad3ty+w0YnvVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8955
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

Several firmware files loaded from userspace feature a common header
that describes their payload. Add basic support for it so subsequent
patches can leverage it.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 62 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 4e8654d294a2205ac6f0b05b6da8d959a415ced1..32b685c8757b1106084577c2cc7d5ef6056c1c64 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -4,11 +4,13 @@
 //! to be loaded into a given execution unit.
 
 use core::marker::PhantomData;
+use core::mem::size_of;
 
 use kernel::device;
 use kernel::firmware;
 use kernel::prelude::*;
 use kernel::str::CString;
+use kernel::transmute::FromBytes;
 
 use crate::dma::DmaObject;
 use crate::falcon::FalconFirmware;
@@ -156,6 +158,66 @@ fn no_patch_signature(self) -> FirmwareDmaObject<F, Signed> {
     }
 }
 
+/// Header common to most firmware files.
+#[repr(C)]
+#[derive(Debug, Clone)]
+struct BinHdr {
+    /// Magic number, must be `0x10de`.
+    bin_magic: u32,
+    /// Version of the header.
+    bin_ver: u32,
+    /// Size in bytes of the binary (to be ignored).
+    bin_size: u32,
+    /// Offset of the start of the application-specific header.
+    header_offset: u32,
+    /// Offset of the start of the data payload.
+    data_offset: u32,
+    /// Size in bytes of the data payload.
+    data_size: u32,
+}
+
+// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+unsafe impl FromBytes for BinHdr {}
+
+// A firmware blob starting with a `BinHdr`.
+struct BinFirmware<'a> {
+    hdr: BinHdr,
+    fw: &'a [u8],
+}
+
+#[expect(dead_code)]
+impl<'a> BinFirmware<'a> {
+    /// Interpret `fw` as a firmware image starting with a [`BinHdr`], and returns the
+    /// corresponding [`BinFirmware`] that can be used to extract its payload.
+    fn new(fw: &'a firmware::Firmware) -> Result<Self> {
+        const BIN_MAGIC: u32 = 0x10de;
+        let fw = fw.data();
+
+        fw.get(0..size_of::<BinHdr>())
+            // Extract header.
+            .and_then(BinHdr::from_bytes_copy)
+            // Validate header.
+            .and_then(|hdr| {
+                if hdr.bin_magic == BIN_MAGIC {
+                    Some(hdr)
+                } else {
+                    None
+                }
+            })
+            .map(|hdr| Self { hdr, fw })
+            .ok_or(EINVAL)
+    }
+
+    /// Returns the data payload of the firmware, or `None` if the data range is out of bounds of
+    /// the firmware image.
+    fn data(&self) -> Option<&[u8]> {
+        let fw_start = self.hdr.data_offset as usize;
+        let fw_size = self.hdr.data_size as usize;
+
+        self.fw.get(fw_start..fw_start + fw_size)
+    }
+}
+
 pub(crate) struct ModInfoBuilder<const N: usize>(firmware::ModInfoBuilder<N>);
 
 impl<const N: usize> ModInfoBuilder<N> {

-- 
2.51.0

