Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A832A47136
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 02:34:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5317D10E1A8;
	Thu, 27 Feb 2025 01:34:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="YsPxjTzj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02ECD10E1A8;
 Thu, 27 Feb 2025 01:34:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FPHTPyjpUyNHFW1mFdxIsK9Q7jpCRA7CM/G63UuWsqiUaBc0dkme7IF/j5yqOwe/3e0jh1SbpK/gBLa95rDJ/32camklI6zoc9S5IZOMYU7PAvFSo2aVajdo+PiIJhmDYRjZfSL4Oz5MY1vQxIX8gmlAHZ8qaMon2xoxViTEvQc1TDoue6a/C22bzgprjIv41L9/iG8rHJOPnvpfyw1+sojZHNhd9IUz/ZELyAf+oCVF/p7rF6GqooX+bxUrrOUxU/AI+nTr04aTybvm9l+EAlv26lu5Zm6FzfNe1m1fJ2P5ORPYgWq2A4YdDy7mlZZfCzhJ4zA+lTcr+sGznXd2CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XrFWySyTMxTdpm3NaxaK3YlC7qNM2Q+O6r38/YeMbfw=;
 b=nbKqLIWl2ZKFPZdzPRu7OVQnAsqRJxWQpjuvMBfNQs9pPOUjyH2GZDXjfxKiMhFU93j79mTdGlCI0cOxdpxAMMG8GsWS5r4mSgkQhG/TvmceKx9FecXsnAVELsvh5AwGvghhMc3KwcTALyfELjuOr9CX9B9/ZKzWVt2Uo6qOXSZ/q4aphYxVq2K7h2Thr1UIxYHG//zknLno4aoKHQsaGjjUTVTWnb1rIa0nz7Ks5yR4YkFnlkd6KbbMcDJNbBN44ZaImj6V/D4EI0w1jdwjahdfrBugzYzkbpffGQo/KdP3sxpett2RXNtwe3l7Y/GZ7eLJBnCPEiqDE0drerO66g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XrFWySyTMxTdpm3NaxaK3YlC7qNM2Q+O6r38/YeMbfw=;
 b=YsPxjTzjAdxbKh+HuYExn8pmaECaScw2NdoKcmwFKYXHRECu/UawQiI9bJo+ClWKQQT9yzxcN5s798uiP8wdzTaG1RMK7/RK1irwTu+hHxQovGl8Ng1NvEeXIgEK4gMYxYsWtjB2Hu6ZfV0V28k3gmjh58iwUADQbnFyY2HuXONx8O56TIYCwCj90JuaMq75GWAjRA6Ad2U04+Qi54UG+CDUy6n2ScLSXwbyutdNEw8VygDCDkrVcJJL1g/GIfE8X5qtIjiGZDdKV5/KwVlxdGw9pnzULUTl09I0VW0fIMHEsXAqHze9uZD0QAH/h2IU/RiuUzZ0L26WgOYhLEonBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by CY8PR12MB7587.namprd12.prod.outlook.com (2603:10b6:930:9a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Thu, 27 Feb
 2025 01:34:03 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%5]) with mapi id 15.20.8489.018; Thu, 27 Feb 2025
 01:34:03 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Feb 2025 17:34:01 -0800
Message-Id: <D82UB3V6NZ55.3OEPPW2W8MFZV@nvidia.com>
To: "Greg KH" <gregkh@linuxfoundation.org>, "Jason Gunthorpe" <jgg@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Alexandre Courbot" <acourbot@nvidia.com>, "Dave
 Airlie" <airlied@gmail.com>, "Gary Guo" <gary@garyguo.net>, "Joel
 Fernandes" <joel@joelfernandes.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Ben Skeggs" <bskeggs@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <paulmck@kernel.org>
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
From: "John Hubbard" <jhubbard@nvidia.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <2f062199-8d69-48a2-baa6-abb755479a16@nvidia.com>
 <Z73rP4secPlUMIoS@cassiopeiae> <20250225210228.GA1801922@joelnvbox>
 <20250225225756.GA4959@nvidia.com> <Z75WKSRlUVEqpysJ@cassiopeiae>
 <20250226004916.GB4959@nvidia.com> <Z75riltJo0WvOsS5@cassiopeiae>
 <20250226172120.GD28425@nvidia.com> <Z7-IHgcVVS8XBurW@cassiopeiae>
 <20250226234730.GC39591@nvidia.com> <2025022644-fleshed-petite-a944@gregkh>
In-Reply-To: <2025022644-fleshed-petite-a944@gregkh>
X-ClientProxiedBy: BYAPR06CA0022.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::35) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|CY8PR12MB7587:EE_
X-MS-Office365-Filtering-Correlation-Id: 01c817be-f416-41a4-31ba-08dd56ced146
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a1I5eVBXM1RpZ1ZkVi9RUnpDdHFWcTNqYnB3Q0t2dDlXUU9rSnN4aEx1c1VH?=
 =?utf-8?B?akxuTTZrYmRmdHdpUzM4d1E0YURSM0dvVDcrMWFwRXRUQ1BZM0RPSjh6dXlm?=
 =?utf-8?B?cjY1cjRYQnoxdk1JZGJETlZTcmtEelRCeDVtSkFudzJhTFdsbWtqY0RET3ND?=
 =?utf-8?B?OVFaZ2tiZkQvYTJhTWdnWFE3S2Uyb0Iya004NkVyN2tmbzlEYnNBb3FQbzNT?=
 =?utf-8?B?Qk5aQ09uWkxiNFJaMmpoSEtmZHFvT1YvUnJuSmxkUWdMblhON0oyeHp2MHlh?=
 =?utf-8?B?R3JHNVYxNTFJNVNYQ3B6K0NqenFNM09TaTAzYndBRTl0NC9yK0htSCtNYU1M?=
 =?utf-8?B?dXlYVmFLbWZRY2ZCdStnNTBHN1lRNDFSaC9tQ0lVN3JGUTcrMitoVEJZQ1RM?=
 =?utf-8?B?WHFyamtTNi9TaXZBb2NlUU5Xc1orcFdTbkhrSUxIM3VTcVBpR1pRYjZMVTJF?=
 =?utf-8?B?K3JzclRBRk5Ddkd5SDdjVmg5T1ljZ3BodC93MXdOREJoeG1ZN1NzMFJlZjBw?=
 =?utf-8?B?TUQxdngzWnc3UkhPVGJHK2hHL3NvWjNXMTl2bnY4U1ZtUUI5dnFMTkp1d3FY?=
 =?utf-8?B?ZkxLNnVqNkxvN1dCdEZGbFo2RTk4bHNlUnh3WDhFOFNVT3pNQllVZGZPbjZt?=
 =?utf-8?B?UWRHUGNMNUFlOEJ5UUFudlZNbGhHY0IybGlJUHJmNEJOQ09lQlh5SWRmMVlk?=
 =?utf-8?B?RDUvWUNwUXV2UjZ6WnhDb2xydW0wWVRncFZKOUtBNWNtcFhFYzBxS0czZTF6?=
 =?utf-8?B?QUlYZlhjUlZpSlNEUXFRRHc0aEMwdjV4Ykt6bGZ6ZzlVMC9laDN6YzNFNjVY?=
 =?utf-8?B?cVBZenp4Q3dIQkNseFpndENUNEErVXhaNXRmVTlZdkpacmlvL29nWW5MTFFk?=
 =?utf-8?B?ejdDcXRrOG03a3orNVZIbFJYREdtWTJDWWlnMzlteEVBMVBqbEhJQXpCblli?=
 =?utf-8?B?UnpSNWxVdUdpYndtZ2tQUjY2cWhJR1Vub1pxdXJwQnd4VlNIM005OWliTEpF?=
 =?utf-8?B?bXBsNkxJaEYzNkQ5UFZieWlYYzFUTGlTbjJtRWRvWkMveGkwOUU4bEhaaVIy?=
 =?utf-8?B?WE5WT1NrckxnQWwxODl2UGNRZzdHb3Fucy9CemFaRmJxVWFUMGJLZ0Rxc1cz?=
 =?utf-8?B?VFZDUkFIVks3L3hSUTBwZTcxSkdsNjEzK3dhSVZ6R2lpOE56clVEdW5nU3Fm?=
 =?utf-8?B?VHM2MXN2V2VJUHRFY1VBd3J3bkZEcW5OYkdISXJDYnFQNGtNbkptT2drdDR5?=
 =?utf-8?B?VjBLQjZWNTBIUnpXbUUxeThoSm1MSExnY0dyUG1oejF3OGN2K1kzc0hZTzRY?=
 =?utf-8?B?TUJZUGt4MTdSY09OZWJtOTVrT2hMdUo5QUhXemJLMmpSa2lVN0NUdnFBZHNq?=
 =?utf-8?B?TExwVWhqOGxXeTVhOGFnUVI2dEJMZkorMFZVRDhES2xMT2FtazJJRTljOTJR?=
 =?utf-8?B?bktNRmE0N1NnNGNyZWgrNmpmbGpYUmh3N0xyRVdhNHhFTHBtMlFjRTVMbHdl?=
 =?utf-8?B?ckdtUVFFSTd4Wkk1S1RGMFBGTExWaVMwR0tsd2srSTVManFkeXJzdTQ4OUZ1?=
 =?utf-8?B?YlhHWUluaDdoNnBTR2JBekJoeXd2TWd2TnhXaGtmMk9DamsrS3BQdlZoOVFH?=
 =?utf-8?B?YXpuOG5JcFZ2MU9pTklVUmQvanFVUXRaMEZqOTU2bE92VE1FclM2cUQ2SG9F?=
 =?utf-8?B?dkRiWHM2SE5NRGxKL2tCa0pYK0x4allmRjNRNVFOaW43UHMreTdZLzhsaHN3?=
 =?utf-8?B?anVkTHg4Y0xmL0ppeG9zY28rK1RLUHpETHpqaGRiUHpMV0MxUFVWdGN4WER6?=
 =?utf-8?B?K0c3Mnh0L0J6R2N2bUhXTjduK05JTkhIR3YzK3psOStNU2N0YXdab0RRQTFU?=
 =?utf-8?Q?qoldbL5J+Bi9w?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5968.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckRwQjU5eEFjc0VkTHF2VlJuUGZNMlU1a1JLd09UWmYrV0k4R2Q3SFcxZlF4?=
 =?utf-8?B?dXlNQk9adk1paHNZeHF6UlhmRzg4WUZSdGQ4RFJXaWFjSU84Rlp4SitMR25s?=
 =?utf-8?B?SlgzWnlETTZKb3Zod2Q5Q2dyNzZyU2kwNloycjlweUNCeDRlTzRyQklNdDE1?=
 =?utf-8?B?NUgzRVdmbENyUGd1Z1JQdUtZQ0FxKzdiREpBdC8yek02OFJQUVJoMlJxWEJx?=
 =?utf-8?B?N05YcG9VanRwUGhBOXBrcC9LOTN3THgvU0RXb3h3K2QzL0Q0VUJ2K0pya1NJ?=
 =?utf-8?B?RmExMDVycngzZXBZK1FPa1A2ZTEwbUxQSXJxZVlKdW5CK0FERW5hem9wSkdH?=
 =?utf-8?B?c1BselFBTDVlWmdocHpsSCtPWFJNZFZ4eTNpTlE2K1dKdzdVaUpCWlh6RUgr?=
 =?utf-8?B?b084YWRTM0EzVEd0R3FjYkFwRzZVdVlqQWk1dkxQNi9UWlFMMkxsOEZtTE1K?=
 =?utf-8?B?QlpIcWdzaWdkTFVEdUFCc3BWN2FXbXU0OGhrVnAyWWtGQmVFQjZKeXlTbTJo?=
 =?utf-8?B?TU5FTjZ3bDdSSHovbW9OWmlsZlQ3QUg0a2FGUmF1TkdLRk5URGwvREVrYVhR?=
 =?utf-8?B?aTcwTTZrUGJvdEVKaEFHU2FYUzJZeU92RjNWRzlqQyt2TUcvNTJ1VG1TU0VK?=
 =?utf-8?B?SHFqM253L0VYRE9QdHlhSFBHRStad0pqYmE0em0yLzVib2VoOXM2RDd6THYx?=
 =?utf-8?B?NGdCaUZ1amdOY1haRmduZzFJamRYU1pDY0VoYUh6T0FvOEJ2eVlUV0UxVlU1?=
 =?utf-8?B?b0kvdmlNN1Y4MGJjTURaQjI0L1R5YnBzbTlQK0tCbGZSN1BEdE1ndytySWpm?=
 =?utf-8?B?VTNkcFl1ZnMrR25OYVcvZnBPbW1OZlZuMmVtWUtLcEtMWjV3VTd1Tk12VUp4?=
 =?utf-8?B?N1NIS3BzemxCSnpCR1krNWU5a2hRbnAreWdxLzI5czdNRFRUTWl6d2lsQmJv?=
 =?utf-8?B?R2Y2K0dDRVQwR3pWMUFWSjVqWnlyeC9vVGNKelZlNTZvVVpCUVhzZnJXQ3lJ?=
 =?utf-8?B?dTJmYTRZQXZEUDgxQk5JOCtBZ0JMejlFc3FJNUV3ZVBPTDE2OS9EWW83WEhp?=
 =?utf-8?B?Tzh6TnFQMGE5dkFXcW4zWjV0eHlIMklNNldZdnRpYWZ1STNoRnVoTWU1ZHdk?=
 =?utf-8?B?SmhCS01NZ1BtaW04bTcxcmhESVNXUTZ0emJmejc5STFvWnN1YkhZLzJVOGlC?=
 =?utf-8?B?TGtibytkYU9FSjBCWU9QQVpHdG5PN2s2dzZGVlN4NEY0Q0NZQlNjSlpmNCt4?=
 =?utf-8?B?dWJIV3B6K0RCVW5KMXB4dmVvOE5ON1Jyd0hybkxmaFg3NmZQQjcxK2lLU1VW?=
 =?utf-8?B?RGtlUE9MeGpldGc3Qm82N3YwM2I0SnRyTktEM3hEa3lDcFJiV1VJdkJNMVJS?=
 =?utf-8?B?QWdXWC9nOFlLeFhyRDcvSTBuV1J4a1hYTXk0UnJEbnIxdWZmdkhrMUVYNzYz?=
 =?utf-8?B?Vy9yeXJKclJhMm9ublRWNjR2UmlVUFhVbnhzaXNSNEZoYVJmOVhNK1FpT3BG?=
 =?utf-8?B?MWxmdFFGMjNMejRvSTZ6TFZmWnhzQldPT00xV3dPNFhqaEVXT3pRVE83eUJK?=
 =?utf-8?B?Sll4N1E5UGNDbGMxR2YyNUJtV2lnZWlrb0U5a3BVbzA2ZXQxVlR1Vm9ZdEZJ?=
 =?utf-8?B?Z3pVVnBYWERFYVZtTHdYMEdQRllEMy90TEZtRTlsYnFlKzNVYldLKzBWOFo3?=
 =?utf-8?B?eG9adG4rSGo2UVowY1lsSWFhTFFyYS9id21QOEttQ0NFM2Z1TlR3eUZuTnFD?=
 =?utf-8?B?eUV6SG9IaVJoQlhuYXFGdU1OWEl2SG0xb0xUWERKb2dhYWVOQWVCRkpldzBI?=
 =?utf-8?B?a3NDU2J3b2x1WlZxdEI2SmF6T1ZvYjRFa2lvd0E5aXAwMmlGQkdUMGtVbnQ4?=
 =?utf-8?B?enhUNmREck5uc3pmZmlKaDdlVGFId1RpS0R5YmZlOVNleFhybDNFc2JMUmx5?=
 =?utf-8?B?K3loZktvbmlETFZOYVJ2d0hJRmRZalZmcHo1YkdDc1dSMmx6SHdhV1hYWDln?=
 =?utf-8?B?NWRWTm9sNCtMdDBhMjFQMHdkOUxaTUhWQW9mV0Q5eUhWdFdBMFNSYWRNUnRW?=
 =?utf-8?B?dEQ5bmt4aFZaVjg1RWo0SEk3SkRad0txMUZOeTljWllJV1MyQzlxYndWM3pZ?=
 =?utf-8?Q?oHUlKWsxY11JM7eLfXwMkRTfy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01c817be-f416-41a4-31ba-08dd56ced146
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 01:34:03.2232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G1rc97WL6piB/n8E2vFEa+0FP65vWY/mHDCnmOrYnAcJmsreknTF+m192SReSWxVi2TZAdE/bEnIkgU6tfcfJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7587
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

On Wed Feb 26, 2025 at 5:02 PM PST, Greg KH wrote:
> On Wed, Feb 26, 2025 at 07:47:30PM -0400, Jason Gunthorpe wrote:
>> The way misc device works you can't unload the module until all the
>> FDs are closed and the misc code directly handles races with opening
>> new FDs while modules are unloading. It is quite a different scheme
>> than discussed in this thread.
>
> And I would argue that is it the _right_ scheme to be following overall
> here.  Removing modules with in-flight devices/drivers is to me is odd,
> and only good for developers doing work, not for real systems, right?

Right...I think. I'm not experienced with misc, but I do know that the
"run driver code after driver release" is very, very concerning.

I'm quite new to drivers/gpu/drm, so this is the first time I've learned
about this DRM behavior...

>
> Yes, networking did add that functionality to allow modules to be
> unloaded with network connections open, and I'm guessing RDMA followed
> that, but really, why?
>
> What is the requirement that means that you have to do this for function
> pointers?  I can understand the disconnect issue between devices and
> drivers and open file handles (or sockets), as that is a normal thing,
> but not removing code from the system, that is not normal.
>

I really hope that this "run after release" is something that Rust for
Linux drivers, and in particular, the gpu/nova*, gpu/drm/nova* drivers,
can *leave behind*.

DRM may have had ${reasons} for this approach, but this nova effort is
rebuilding from the ground up. So we should avoid just blindly following
this aspect of the original DRM design.

thanks,
--
John Hubbard
