Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B944CAEBC5
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 03:31:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67FE310E140;
	Tue,  9 Dec 2025 02:31:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sZDXm7fA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010056.outbound.protection.outlook.com
 [40.93.198.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA12210E140;
 Tue,  9 Dec 2025 02:31:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jci2h16AAfurCMweGTiFUvE3dflOwMzYhIaEGeH/Lp90jCWtqLDuAtgkZkB7WFGPMMTBtrpyUbSoPTW7sXM2qA6Y+8Dkl1BvBEJWs0F+ZKlFHVfTllvU8WcJaRf3QKPNbJ4iTpMfVzDbcEOUhF80xY5f9KIhqxNoYTxOC9B3JIm0+FDlkeLYMwCa7iE050Hi7vrHv7b5Q4vO2tZFSCgG3h5hdrllAQLRQ+TJDAyPNzSL1KnP0nuhvWcTlqICPUahKfHqE95LJtt3ce5jXzlGdTbq7AXb0PcLbMoOblW4oudpxrHYetbw9QfVLA/G11Rg0BbpZlC972yCHP98NvCE4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l94zeaeamf18TyGALMq+HGp0DU8DiZoz5UJ/7wrjNt4=;
 b=OG/CpuWcAHpaHUyoKtUJCrCoeRtMYK6067bfP6wMcJkUmDtMILmXGsF+PW+vjpZKxUUqGG93VjLx9GUgmUIGkhqnb0bpg04gYNkSdPDxIJyY82Ipc/ZnFIeNnIf8XKs/wbRxxWy6Y6jFhg04IAYIcOYBly0XHbrS70MpPoB6Sb93QqOIAlrgeLD45Oei6ib6fJ5EPqG5G1MU0Q69X06y+UFh0VFEDoAU78BBhl43IgLhwtrkhXh6lPbG5tEpHeW8kuqwQAlrHidRmkfgcqaI0xNaa8+yNWbuxyLDHM04FXhxWPC6TqWZhrbT74DT2B1Xa+GfHDXzRf2nxbArx8wt8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l94zeaeamf18TyGALMq+HGp0DU8DiZoz5UJ/7wrjNt4=;
 b=sZDXm7fAbwpVTB1OWQ1kJNKn2o8OPmrOB0dOflhTA53p+GuT3K+151p7mDXvIzjbmM3YXQXneuAOlPGUm1M/IhzJJU0dcyQwVV+tdej5SCH9lGw9bIQl9gmbbZCHhS1A9ZM0gjoHYzz/aHFexHwZUXXCR9kuaMFNb9QJl+0l660OZ+4B/wYlVvaQo4YiyD7lOpC1cmUIAUNaVpAyLi35WdgSK8KIxYG+qnV3AJGjQMrW/DVK6F97laVymk1YoQXbS7QRwHQrNUER4iE1ONPzP44F/5jUtBITzwO/SVo+mxYFhbopvtuWIcHclmE+iGVHCSAvC9LkIbcb+3eOjHpQsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH0PR12MB8486.namprd12.prod.outlook.com (2603:10b6:610:18a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 02:31:00 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9388.011; Tue, 9 Dec 2025
 02:30:59 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Dec 2025 11:30:55 +0900
Message-Id: <DETBZXTFR2EM.1JSKPE3YS7908@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "aliceryhl@google.com" <aliceryhl@google.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "John Hubbard" <jhubbard@nvidia.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Alistair Popple" <apopple@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 7/9] gpu: nova-core: firmware: fwsec: do not require
 bound device when unneeded
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251208-nova-misc-v1-0-a3ce01376169@nvidia.com>
 <20251208-nova-misc-v1-7-a3ce01376169@nvidia.com>
 <6da7ff0ff31c1f4250b8d6cd1b535bd69322d0c9.camel@nvidia.com>
 <835a223c-e738-4804-b7db-2b24ad37410b@nvidia.com>
 <2c383dec07d33a58d4fbcf1c99013a59ce488b4d.camel@nvidia.com>
In-Reply-To: <2c383dec07d33a58d4fbcf1c99013a59ce488b4d.camel@nvidia.com>
X-ClientProxiedBy: TY4P286CA0063.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:371::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH0PR12MB8486:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c7b0b3e-7a41-4c4e-5a27-08de36cafcb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eENkWDREUlJJU2tXZnhESW15N2NkdUcwVVVyQnZhY09vOWxsaFg1Rm16ZFYv?=
 =?utf-8?B?WTJ1aXloRElTU3B2ZFhQSkN0QS9HdGdBNEorL241ajcvaUh2V0hWeHI3V0Z5?=
 =?utf-8?B?QnJXNUt4NmRHTnFTZEc5d0d1RmpXcUtVOHNmL3BreHVaZjBEV3JiRE9QbjFn?=
 =?utf-8?B?cnhDUllrNTNzbEFMZW9hbXRsckVSeVBldndXalVLYzdLUVVtdWNUeUxNb0t5?=
 =?utf-8?B?OU05QnNKZkxMckhyUVRNR3BXdUc1bkZQZ1JQc2FuakV1ZkJUZC9CN3A2RnVE?=
 =?utf-8?B?amQ5ZW1tM21FVU9kRHpBRjhtQW1wcXpEcHpVRmI1d2FHL2RuazNrS3NTM1FM?=
 =?utf-8?B?M1JGQXJZaVlBY0dkUDVIRllIWWpTWkFkL2p6V3NiUG1ZZWhPZ2lsaXIrb2tS?=
 =?utf-8?B?ZG5IMmJCb3J0TlQwdWw4S0tjNWFkK3FWdVNaMzBRRlYxMzRwQ3JhSU4xdzQ3?=
 =?utf-8?B?V3p0bUlmSkw4UjlyYTFpWHZQK0ZLTk9UbXkxMmMzT1lTcXIyTHF2NDg4dmZZ?=
 =?utf-8?B?WFBjSUJOYTVweEF4NHpWNjZXZGNVbzVzR1VzRFp1ZU9DSEpOS0RKVjhka25K?=
 =?utf-8?B?MDU4QzdWWElPMkVaWHN2dnh3S2o5UnpwTW9QMHBDbWdwb0lMdFc0dTlpV3NH?=
 =?utf-8?B?RVVGbzFyWEk3eENDQURxK3F3VVZyTzdBZ2ZWdjhzZW5TaEgzSDJZbVF5ay9w?=
 =?utf-8?B?OWlvRXZIWWZlT3c4TGU0TkxQMzI0TXVvd3NqMWdJM2RXU2hHc25LWTlKL1Ez?=
 =?utf-8?B?ZFFxd0ZYYzAxbDJ4MWcybkttVkZ3eU1lamM2dnZNV0VuMjdpaU03dkZUTm5Z?=
 =?utf-8?B?U2FOTy8zVms2MVlnUHVGSmtoK2Y5TUxhUWdxZEtMdld5QVUrTEdFZUtGRXl0?=
 =?utf-8?B?Q3o4MDBucmlTSTRzbUw3dWhOZEtmY24reVBjWnRpZDdkWEpCOFNpeVVkU1Q5?=
 =?utf-8?B?MEdtWERtUE00Y1BmWmZzeDNkTFV6OHpRZTNwWDlBaXI2d2FubU9IK1lid01W?=
 =?utf-8?B?WkpacWxQakkxM3dBMHRobklpYzhndnc0SWptalFyYUtHdnRLVExvODlyeDUx?=
 =?utf-8?B?VEJvQkV3QVNnUXlzVy9tNmdJOXp1R016OGVJMXNJYWdxbHZ1NTV0Q29ON2hw?=
 =?utf-8?B?UFdqNC9pcWRDSDYwWTNka3poZk9CbHdJZmdtbmM0S0xuVzFmcTFIY2luYVBn?=
 =?utf-8?B?VER6cXJVNzRaS1kwbmpHblRHSFpQMy9JMTQybHlQc1VBdkh0dDgrdVlmUms5?=
 =?utf-8?B?cXRwb1ZUOHBnVnlBZm9HcWxhOStLWGUxMFhaYzc3YVZlOXRXSWdMUGpJWDgy?=
 =?utf-8?B?dnhoS3I1aW5QTjYxMS9tRitlVFNhUHRaWlV3NCsrOUVNNjd6R0NndStQSk5h?=
 =?utf-8?B?d2JHQW9yTkg4Nkk3c1UyR045YW9MUTYxbDZscmRUNGZjTWQxSlFXb0NqM2ww?=
 =?utf-8?B?cWdOaW5MSlZYT3NXUlJzNGt0UTluTmx4cmxRMjdhUjJBUTFBSnRudmtyWHhu?=
 =?utf-8?B?SzJPS2pRWng2QVNuM2h5dE5qdENBdlNXSzJ1V293Umg4dWVFL1RWeGdzdzVq?=
 =?utf-8?B?R3ZBNWFxaUpVSDA2T3krbDI1QjNURnl2RlU3SW9yNGh0NTh6K1ErTm01ZDNl?=
 =?utf-8?B?dnVoVzMwUktxYU5JeTd3TlNMMTJpL2hDSDk0Tm9rZ0VyM2FISnZJSEhhVkdS?=
 =?utf-8?B?bVRjV3JMWkhpVkVTVWFvNG1Rd1B6bGxNT2ZUY1k1Tjh5ZVkrVzdqTDJrdTRq?=
 =?utf-8?B?a3FiamtJZi9nelFFYTRhQnFGTXZPSmp0QTM5eEY1MitwbExTdzgyZEg4TWRO?=
 =?utf-8?B?cWw5dHhsU1lteVJhaFhOdlMvWVhtNFd0elpEa1JBVERjdzVIQTBLQUJZKzNY?=
 =?utf-8?B?YjVpNzR5ZTFCVHFwN1pNUEt1NlV5VWlrUnJ0SVUvYTJUYW9sQ0xRY0VUeDU4?=
 =?utf-8?Q?hVmaPZCsmX/7r09k/tBpgDK9MAAQj6sL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWpZb29IMGdxQmhRSzkwTHZBaGptUmRPZjdlejFUNlRTRVA4bGNoYk15K2FF?=
 =?utf-8?B?a1hLQkExM09HK05oM0M1RmYwOHBYZmZRckR3VHlXSmovRzNURTZraDZjWUJY?=
 =?utf-8?B?bURBUks5bktuUWhWVHRad3psUTVIRUdMTFRUUk1Nbk9wREdEZzAySWhidFNa?=
 =?utf-8?B?emg1a3lISi9lNWo2WlE0Z2NmWlVPVGlhQ253akxtYVUyUmVLVG04cmtFaGlw?=
 =?utf-8?B?WERkYmg3RjVLa1hqalJMS3d4ZTQvMSsveTBsZkFUd1RXcTBrUDErWWVzU2tI?=
 =?utf-8?B?bURJNWRvRzdTT2h3NXRvRUNrZ05QL2J1Vkp0M0toQWFVSE1zcmdwNXAxWmRP?=
 =?utf-8?B?OTBDcVp1T0tzMlV1UUJ3M2VHOTBGclJqaXdycVhqNnFqRU5UazBZOGV0ditN?=
 =?utf-8?B?bnhQbDlMV2hoak52K2tQL0s1OVhoYmd3aTVOT0FVK2kxVWNLSHArMmhjakw0?=
 =?utf-8?B?UjhCUmF3UTNmMEpSN2wvcUMzc1JORDlUVmpaQ3QrRWdTTlREdWlkMytIdUd4?=
 =?utf-8?B?Smx4NDZreGQxM2toQmV5M2lZc2JVYURZam9lUSsxUjMzWXVvd2ZoMHFwMFRm?=
 =?utf-8?B?ZERjY3h1bGRSZTdhTGNvcHdENTVvNHl1ZVk4Vi9IMzdodjNwZ3JzMjUvZytu?=
 =?utf-8?B?YWVPelZPMkMzRWJVT0NwMjFJQjFCRGFOYlJ0NktZNlpvS0xWczUzdTZqcjlG?=
 =?utf-8?B?MmpFbUo5U3doekoxemlVN2ZUcWF0SmdNT0YwTEwvTVFQbWdhbEdjUHYrc0VZ?=
 =?utf-8?B?ZmlGNWZneDFBenJEN0pVR3V0dWY3cno1d0krQTRUeHhGaUNBVGNpUHZlY3Z1?=
 =?utf-8?B?OVMwdXNtL3NMQzJJb2VlTzFQYi9XSmdULzRIU2wzM0wvb3BDQ01QREt2ZDZx?=
 =?utf-8?B?SzhxTzJubXNMMkVsdnVWM0VkRWdJaThZQlo1dGs5bUlXVCtKZHNMbFJ5eEJu?=
 =?utf-8?B?WEN6LzVGUm5VQ2QyLzZqN2FKZTlHRVJhaFM5dGJ4Uzd0MUNpdDdIeVFZQXgz?=
 =?utf-8?B?aExtR1BTdUZLZzdwc0NUaFpncXRzZDJCM2xobEhoSit4R3hxUDhNZ3dnWkVj?=
 =?utf-8?B?U2R6TXk2LzlTQUxNQ2ZzeEJBZkJvd2dqY3NZNGRaTWZFZUpQanJKMTJGMnps?=
 =?utf-8?B?TUxvT3BBTm9ERDJnY0Vzb2t5V2ZCS1dkNmRRT0RiS3ZlaEpPRjZQM24yQmd0?=
 =?utf-8?B?OEpMNVhoRUFia215cXozbGJTdE5adDJ0M2tQRjI3MmlEYmxEdTYyUjczSjU1?=
 =?utf-8?B?RTBBdndNN1lLOERlcFQ0TlBwZnIyNXZ1YTczUlByd1NzYmZIUWZqWjZhS3ZZ?=
 =?utf-8?B?NG1tTDUxRVN5b2M1VWhGTzV6NzYxWDlOb2NFWmNJZGt6bFU1SU9HblRtWkdn?=
 =?utf-8?B?b3FQc3FvRHRyNUtjMktJd0tTYldMNUpETUxqamZ0OWx3bEFnTDhOMk9SNWZo?=
 =?utf-8?B?ZTJoeXVkRkZaN2VvbTVpdVI4cmFrR2g2bHEyZDExM2E1WkQ2UlhvSllSVVNy?=
 =?utf-8?B?UGRSVUgrMFJEcU4vRy80TXU5R0J2LzJWQmV0QzJHR1I2YTM0VUxaVE5lZjlE?=
 =?utf-8?B?UjJQejVtYllablROVHZUWkNST0x2WWFDMzQ1L2JFQzRaMFYwRjUxSzRnbzRO?=
 =?utf-8?B?QUtwOFkzV2d5TGlsRGYyUUZYYjdNS1kxMmtEckhkK3RGNzY2SC9XS2RTSm4r?=
 =?utf-8?B?dStFSjhMdG9lc0NmTHBnUmgrZ2E4L0NHcFRiNDBXODlYZ2MybzQvVEQ0K3NE?=
 =?utf-8?B?cTY2c3NjaXNBL0swNERXU2JHeS9mRU92TnFBYklFNUQ2cjBIMUdYR21ac1kr?=
 =?utf-8?B?TFVmZStVU2V5RVVPblhoOHJ6a3FQbUFoclREUW1SN2VsekxIMnBMbEs3V3h1?=
 =?utf-8?B?SkRQdlhJOUpOYkZ1OXcwZVRKS2gzbEJNcXkydUM5ckVjcXRyUTBLWjVrNzRS?=
 =?utf-8?B?UWs2QlE3RzF6Q09Ya25aOGJvem9RRmtycUVpd0FQVXYrelpobldoUnN5Mlpr?=
 =?utf-8?B?ZTh0SXB6eExkVGdhY3p0YmdVaURiY2RBTEFCV2JweDUzZVhWd05OMjBvcEFt?=
 =?utf-8?B?ZmxrcUpCN3RRL1p4UFNmRFhUUUhFaGtRQXMzaHNybE0wcWQvcG1lalJSTGpm?=
 =?utf-8?B?ckpDOTZrMUVEZGdpbmZ3ZVJKYmtmdkttYUtnVStQOU4rdjJyUmRqRldLaEN1?=
 =?utf-8?Q?td1sN28wB0cWPzUDR3VZKfM5cr4OZEeNA6y257tx5wii?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c7b0b3e-7a41-4c4e-5a27-08de36cafcb5
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 02:30:59.5635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Y1YChaOxZBtbS0bcqUQxiu95XQtGVWK+szjhUgJNgy9o04yTF4oH3lg2hA+rU56GG/Py7hP6ykFX7SuL7se2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8486
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

On Tue Dec 9, 2025 at 2:55 AM JST, Timur Tabi wrote:
> On Mon, 2025-12-08 at 08:51 -0800, John Hubbard wrote:
>> It is a little jumpy, as you can see above, but it does have
>> the nice property of avoiding formatting discussions,=20
>
> Apparently not.
>
>> since
>> there is only one way for things to end up.
>
> That's not my observation.  Like I said, it appears to oscillate.

rustfmt is a requirement for merging patches, so that's really all there
is to say on the topic.
