Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE35ACF3C6
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 18:10:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB74610E8F9;
	Thu,  5 Jun 2025 16:10:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bC7jRXqW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2061.outbound.protection.outlook.com [40.107.100.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1678F10E320;
 Thu,  5 Jun 2025 16:09:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PyWl5W2PyTsNiaj04JbFytKIRrHXyUvl4RA4oQgG3C5pxB907+AYB+QByUW5J5Y+wx1RV7Mpfg6Q3fOBOZRL2qGAur/XC/77GwWBjdAig2Dfj2hl1sRzpYkE+4No/0EG3T9zoIiqljwInWfgoQf0WNiA0ULZvBvA0kw+7T8KFWJmyfTRx9seKCpPDz9LI+kPT+nH0ujpA5FRf+bzv3bUOAh1Ot3NB3nPJqUEnxMp2sXxMtKuv6kaTgt9H99dqKEqz7PhIQbKCubYdvzGC+VICSGTJVkagv+WCzn2yx60N1NV88xlPlJEhsZrwWusRm2aMmRQ6bwhqO4fKNqesqOV2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bgmpHnPINDiAo3B95pAy4bv+fUDVZvER13iOIqdvf48=;
 b=B9DuPd8bIlDqhkQeOdCPOjY0GwvZQwogKblJ2MM2kSoKNp0hFuTsdkc6f5d2MLzHxaBGyyuACTL5cjL5nrqygVzMdZyXEI/s//Gc3NzT8UuvFil49kZSResJO2YebhH5wfTvleERmuQkgWC/HjpFrr8k8qIR10C27wxhZcLyVENKSLtrFh1c5y5CxzXCcFq9MEqA4qFvqlCTxq/JSa3i+ueseSqZRq1j1JYXBNJvfvM3jQbM3jZ4+0J5eTz5mWdv1wRY9puYcpQc7p2Iwe7Y92+wyLiiq+Y+2/q75BC9lS7A4UYnT6NVEQUAlIHQ0MOgc9DYs1eo3W+o1LHe9WMSkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bgmpHnPINDiAo3B95pAy4bv+fUDVZvER13iOIqdvf48=;
 b=bC7jRXqWzuIJQ42soxcrEWeBaXO/6fT8fD6FzjYX1rIWeQbjgt2YPcwMf3clQpj+/SfgZMKou4aFNjvuVK4InVzafUqlR7FjdZBDyG1XJkeXlRKlP2UbSOK/AMZlTtrWqCh+khU3YmCsuLZUE4fTIqy3liyvI0PgCe4mGSFf0XobTIr6r+JZ0qt9cmRq03AFh9fJ/GtlLs9HskuSxrMoWPGJsr9VnRvYAPkZPRo5zvwpFLdr+37hAznWq/2Uq1M2BIkwpcYrL9jsJw8PtUBAR2ZxuGAIjH7TCVudOadUaQxvyqRC3mOq3iCvWv/ZYLpobGlh+tEfSHMI46eEb678SQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SA1PR12MB8143.namprd12.prod.outlook.com (2603:10b6:806:333::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.36; Thu, 5 Jun
 2025 16:09:50 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8792.034; Thu, 5 Jun 2025
 16:09:49 +0000
Message-ID: <9de086d3-e441-439f-9ff5-aa66a99643ba@nvidia.com>
Date: Thu, 5 Jun 2025 12:09:46 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/20] nova-core: Add support for VBIOS ucode
 extraction for boot
To: Lyude Paul <lyude@redhat.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Shirish Baskaran <sbaskaran@nvidia.com>
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-16-05dfd4f39479@nvidia.com>
 <f528cd2d491f15404f30317dd093cc7af5a00fa7.camel@redhat.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <f528cd2d491f15404f30317dd093cc7af5a00fa7.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0415.namprd03.prod.outlook.com
 (2603:10b6:408:111::30) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SA1PR12MB8143:EE_
X-MS-Office365-Filtering-Correlation-Id: e79000de-32ad-471e-c692-08dda44b65f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M2ZYc1I3TGFuK1BSUWJCSlEyN3Rqc1o3VmFnN2JIK2RDS3k5SXRWU2J5QWpl?=
 =?utf-8?B?c0JLajhLWlZBdUlDNlNPckcxVVhWeE1IWHh1bnVEY2pZVjBTYzdjUVpZR0V4?=
 =?utf-8?B?bHFVYWUrVVpkaUZlRHJDT1lLeWQwY1JUNUN6eEI2UXhoQ1NtcGZHWVIyaEFL?=
 =?utf-8?B?elVTL2NJYTlBOTcrd3ZyOGtZWkZRak1yT3JoRDR3TEN0VmRqbU9RQVpGQ0NM?=
 =?utf-8?B?cmpqY3dyRWcxSjBxOU10VXgvOXU0ZHhUK1RGUmtkak9LR3hVZ2lYQm14Vlhs?=
 =?utf-8?B?SmxLd0RUOVJtamtsb1dqL1poOUVRRDJzUnpsZGo4L0ZuTHl1T0p4bUVoZzYy?=
 =?utf-8?B?cTVJVFRsY3F6VSs1OEdOeHh1a0xLR0s3bFcxNVBTeUxUUXg0T0pHK3VBaFN2?=
 =?utf-8?B?QUFPY3BxUVRqeGFoK1FpcmNoclg2eDZzZDhORk5tQkVkSFNGejQvdGZnWkVQ?=
 =?utf-8?B?TE5zTnc3cE9ZdnZXN1VTQjd5MGtCWTBTZnVFUHN2bXVFWXExaGVvNnd4bmZ6?=
 =?utf-8?B?MnR0YUwvL0lvM29uQysrek85WWJ6SDU4YktsR0d2NTBBTWRQQmN1VjBqVUJ3?=
 =?utf-8?B?UlZ1U1FudDFsQzY4NnhtVzdsZVp2WVBPOG9NSDBZSWJhSDJVNTBvZStzQVRm?=
 =?utf-8?B?YVp4TWt4TDRrOTFWN1NSZnN3UHJqa2RBakN2NXcrcm5kTEQvSXRSMjV3TERv?=
 =?utf-8?B?YjUrMEh2WjhuUG9mWlZoQ0tXRk1iN2hhUTVTbXdrTHdsOU10K0xFbW03cWFp?=
 =?utf-8?B?bG5CbWNxdktuMVdkb3Q5VXJWMkRuN0NubGh3RzhHdWxsN3FSTTVJUE05OWx0?=
 =?utf-8?B?MVZrNEF2bFdFRHN5S3h2STN5MG1LK2NMVEpic3BZd1VGbkpObi9jc1NXd1Rw?=
 =?utf-8?B?UytjNmp3NFBPRXpvNnlQMWpXaVRLQnlwWXJDRVV6bjFVYjlDVldlM2M5c295?=
 =?utf-8?B?NllkZFl3ajdNbXk4RGFIMWdIK2hXOTgrVDU3cGM5WmFHU09wcW9DZ2l4QWgr?=
 =?utf-8?B?M2tlV3lNbUlnYTJNbHRudmkrRkhiRi9qSGxOV3l5U09rOS9ydzZ1Y1FlQmg5?=
 =?utf-8?B?M2VvaTd6d1RSRm9kZytJNnJGSm9aOXFaK1krK3VjTUFJaGFLa2JmUXB0L1J1?=
 =?utf-8?B?OGxmN0IreEcyeTFhMU5xek5NRklqVCswVTcvL2FrWkNiRnhSQUllaXpzeE5p?=
 =?utf-8?B?UVFiOW9iMG5scWhhZW5IYmdDYXhQajZYM3oxNHBSeUhDZW5YNU9PS1E3bUFu?=
 =?utf-8?B?N3VyNFlwS2VLbmlGdFZHNkVIQmMwTU9NWHFMTUxLK0tZWjFEK3hCcWZaOSs5?=
 =?utf-8?B?RjVTcGMrTTN5ZHQweE5KZDdkUnVOU1J4N0NPV0tMaUdPWFBDbkFscnlQK0RU?=
 =?utf-8?B?QUNaZldsaUZmNm9LWDdLVjlpMGpLc2ZpZFVrVnpzTHBlMWpRS3BleU8rQU1L?=
 =?utf-8?B?ejcxeXQrZnFTL1NJd2UxNVN0MU95SnZDWmZlN1hVNSsvTHJaR1licEExQkMr?=
 =?utf-8?B?WkdyWTlNdlh0UUlrNFZydmdobCt4bnN3MFR0YXBiYmQxYXVHTnMrWHJNaWFo?=
 =?utf-8?B?UFg5WmJneThTdGp3Tm5IRTJDeU1ZUzNsQ2tPS0gxNFJNb1pqVlNLTHNsTlhK?=
 =?utf-8?B?Y1ZCa0N3bHozT2Y5VTZnZXp2NUpWeXRMc2RidXpCK1hrNExGY0tFMTBIcEVh?=
 =?utf-8?B?cTdZckdFSG4zZUxHclEwZU5kZWxtVDdNWi9QZ25oU2ROSHZzNDFWR2sxUWVS?=
 =?utf-8?B?NWgyNS9kcklVb2NUbW5kZmtFYVJvTnpXR2o0em9qVjlBcVNIVklxUjI1M0g4?=
 =?utf-8?B?d1NsaVp0N1ppdGg2ajgrMWEvYnh0NVFPaHczbGdtTXk3b3Fvdlo2cEVNM2Ju?=
 =?utf-8?B?NmhaSWdFb0VYYlAwdjRhbU8zUS9ZZUxjUnRacCsvY01Td3ZETkNSaVZMY1Rj?=
 =?utf-8?B?d2NZQ2dhckUxVFRvak14UW0xMXFoQkZ2cEhxUEoweGdwZU5GRjU1blRJV1Vk?=
 =?utf-8?B?aTVoZU9YLzBBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlBsejZ4N3paS0dBSW5ETlhuMXFmM0tlV3k0TWZiZitYczJ4SFVHelNNOEZD?=
 =?utf-8?B?UXJzK3JqRUxkTjhuRXVTaUozV2d4RVBKV2hUbXYxdmV4eklnZStobTBNbnY4?=
 =?utf-8?B?c2RnWTh2RFRid0hWck1TSlhjQkRUU2ZPS1VMU3J0NFhTMGVQblF4M0RRT05r?=
 =?utf-8?B?b0liUHc3bGdsYjNCRE9zczBIR0UwaEJkRFJEMk1adkw1ZHh2MU5GZ3gwbVh3?=
 =?utf-8?B?ak8xY0VGOXlOY1YrTFh0QUZjZ3Zic3ROYlJGYUZWTXJYU0NDNFduN0Vydith?=
 =?utf-8?B?dDV3cDk3c1ArZU9VaXJxaU90N2hSZEJOU2dzYVJnaExDMzkwWXpSN2RSVmJD?=
 =?utf-8?B?Q1E5MGwvVlhRZjlXVTFxWkpwQWM2YkNQNlpGME5zeko2dUxVbG1oYytmMGVa?=
 =?utf-8?B?TVA3aEVqSnlEaHlLWCtwc0NMSWw4bUMxdXh5c3R2SmxXak1tY3o4b3p5K3Fz?=
 =?utf-8?B?anZvQUJmZER5K2VvdUdwSUUvb0lrOThhelZ6Z3FTU0puNktwT2xUNW1ncVFx?=
 =?utf-8?B?S3NFZDlGTnRINlVGc1pJeE94b3hMbytKN2dFR3RhVDNxeGZYVTdJQ3VTc2VD?=
 =?utf-8?B?Z3pBWjRwVzF3cEY0UVR1V3NpTDlXT3lxY0MwWmtUQ2xicWppUDRzMEpwZ1lt?=
 =?utf-8?B?QitJT1kzM2xnOHRvZ1A0c1FONW5GUVdvZ1pqQmkxNDAvWXRvMjc0UEc5VVNt?=
 =?utf-8?B?aWhRS0hGYWh1ck5lQVJuS0krK1dXdFRmUU80ZHVDK2xMaHFEVWFNUDA1aVVS?=
 =?utf-8?B?RTZBdzZqRjVRNWdqeW0vOGt0b2YvdVpXOEE0bmN3bjBneE1HWmZKaDZncE1m?=
 =?utf-8?B?bUY5NUFydjUzVGRrVENDQVRPUlhYb2ZWNTdOZ1IwNng3NlhNckpvQlhUaUpt?=
 =?utf-8?B?OXJXVjMvcWJ5SlA3OU95am5nYWN0UW9xOWNtbm1kTVBDeXpsMTJPbjVMQW44?=
 =?utf-8?B?UDVwSVZiSUtiVHBZamk1a1FiLzBWbjJMK1BTaUd4QnNXK0hONzBkMFZYYnh3?=
 =?utf-8?B?WVBOZjIrZmloV3FIcW1mS2FSTnpPWDdmeHdOMDI0bHBBWTZGL2hFbkVQQ2Qy?=
 =?utf-8?B?RWEwT2JYYUdHekNiZi9MT05YdFYxZDJ5dDhCY2M0QlhIclJjM0xTVlhGeCtM?=
 =?utf-8?B?ZDFqMG0rZ0c5WlZubGNZcFR1QUZxMFRKT2ZBdis1czJrc1lFa0hwSXBXclFa?=
 =?utf-8?B?cGlYY3BscFM2aTM5SlFZZE5iWUlwS2Z0OFBZV1RoNlFxUXB5V2hVWUI2cUN4?=
 =?utf-8?B?OE00R3doTnA5Zld2d1NKNGhxN2RjdDE4ZTQ3ZXcvclNqcUZ3WmhzRmwvTWdL?=
 =?utf-8?B?bXAzZHlIWmVPNFc1dVFBRjkzSzBUSjlUT3JGQmg5WGtDcC9WdVE1N1hoaTky?=
 =?utf-8?B?MXV0cVhhRW9CMVBVcVdnQjZNYWNITXM3cG1MRzZuSEhTRjNnY3JJNElyR3p5?=
 =?utf-8?B?K0gwOGV6RTgyOGhycWRJZ3UxdFZGd2dudHVQbC91ajNRcHhBak1hTWF4V3FN?=
 =?utf-8?B?bFA5MSt0Q0FPZFlENXRWZnpPZllLVFpEazJsalREVWRtTEdIU3hCamQzakhN?=
 =?utf-8?B?UDlHajVoT2R2eGZLUERJRHRVbWNHL3RsdTRSSHA1Zzl4UkRnZ0VqY09FRUl6?=
 =?utf-8?B?Rm5mKzUzSXlrUlkweWpuNWpvSWY5VHdjbWRINzJiVUVDRThVNDlIUGh0NGJs?=
 =?utf-8?B?U3VFTmkweDlGcWdLbjc5ZWhHaFBTRUJ3aFNabHJPMVJ3OGJEcER6Z0k3cTEw?=
 =?utf-8?B?RkFiK0lsREtyU2FsZ3A5OVI5ZTNzc05HOE83bzJ6MVZzTjdCZUVkUVNlcUtT?=
 =?utf-8?B?YUVlQmlNT0x1R1l3WjFWRmNYa29hakUySENhNkxLUllDWllRdWJnbG9sWHZi?=
 =?utf-8?B?ZUQvWmZNTDBRWEZlOUluSVJ2YkFxWmZDQ1Z5MXU3MmsxRWxTOFVyN25SdXNp?=
 =?utf-8?B?T0FGbm1QNkxxRHc1cklKdW4zQmo0VTEyNUMvQ0h2cFBqM3hFUlR1YWJjbnZX?=
 =?utf-8?B?b1Z0NG9jdk01bGcvd1d0NmlXOU03bVlHV05WYVBVNU1OYXpBY3pFbDN6aDRU?=
 =?utf-8?B?MkJ5REZrSHh5MDRkODU0SUNqcG1nL2J2YnFaclpBWXRlYjlWOEF3YkJ4VlJk?=
 =?utf-8?Q?KdsPoAyiAqAbls9JnEHaJKA1j?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e79000de-32ad-471e-c692-08dda44b65f1
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 16:09:49.8370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fnE0W2ggyLDddNUpn9pCawj1BC/89V/P8FGhxg2wCeQ5ZaPsiI5E4mZDhJeQrbi0RX8gRQwcviImKSAYugV0WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8143
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

Hi Lyude,

>> +bios_image! {
>> +    PciAt PciAtBiosImage,   // PCI-AT compatible BIOS image
>> +    Efi EfiBiosImage,       // EFI (Extensible Firmware Interface)
>> +    Nbsi NbsiBiosImage,     // NBSI (Nvidia Bios System Interface)
>> +    FwSecPartial FwSecBiosPartial, // FWSEC (Firmware Security)
>> +}
> 
> Maybe add a colon to separate the two fields in this macro so it looks more
> like a struct declaration?

Sure, will do.

> 
>> +
>> +struct PciAtBiosImage {
>> +    base: BiosImageBase,
>> +    bit_header: BitHeader,
>> +    bit_offset: usize,
>> +}
>> +
>> +struct EfiBiosImage {
>> +    base: BiosImageBase,
>> +    // EFI-specific fields can be added here in the future.
>> +}
>> +
>> +struct NbsiBiosImage {
>> +    base: BiosImageBase,
>> +    // NBSI-specific fields can be added here in the future.
>> +}
>> +
>> +struct FwSecBiosPartial {
>> +    base: BiosImageBase,
>> +    // FWSEC-specific fields
>> +    // These are temporary fields that are used during the construction of
>> +    // the FwSecBiosPartial. Once FwSecBiosPartial is constructed, the
>> +    // falcon_ucode_offset will be copied into a new FwSecBiosImage.
>> +
>> +    // The offset of the Falcon data from the start of Fwsec image
>> +    falcon_data_offset: Option<usize>,
>> +    // The PmuLookupTable starts at the offset of the falcon data pointer
>> +    pmu_lookup_table: Option<PmuLookupTable>,
>> +    // The offset of the Falcon ucode
>> +    falcon_ucode_offset: Option<usize>,
> 
> Shouldn't these last 3 comments be docstrings?

Sure, will change.

> 
>> +}
>> +
>> +struct FwSecBiosImage {
>> +    base: BiosImageBase,
>> +    // The offset of the Falcon ucode
> 
> Same here

Sure, will change.

> 
>> +    falcon_ucode_offset: usize,
>> +}
>> +
>> +// Convert from BiosImageBase to BiosImage
>> +impl TryFrom<BiosImageBase> for BiosImage {
>> +    type Error = Error;
>> +
>> +    fn try_from(base: BiosImageBase) -> Result<Self> {
>> +        match base.pcir.code_type {
>> +            0x00 => Ok(BiosImage::PciAt(base.try_into()?)),
>> +            0x03 => Ok(BiosImage::Efi(EfiBiosImage { base })),
>> +            0x70 => Ok(BiosImage::Nbsi(NbsiBiosImage { base })),
>> +            0xE0 => Ok(BiosImage::FwSecPartial(FwSecBiosPartial {
>> +                base,
>> +                falcon_data_offset: None,
>> +                pmu_lookup_table: None,
>> +                falcon_ucode_offset: None,
>> +            })),
>> +            _ => Err(EINVAL),
>> +        }
>> +    }
>> +}
>> +
>> +/// BIOS Image structure containing various headers and references
>> +/// fields base to all BIOS images. Each BiosImage type has a
>> +/// BiosImageBase type along with other image-specific fields.
>> +/// Note that Rust favors composition of types over inheritance.
>> +#[derive(Debug)]
>> +#[expect(dead_code)]
>> +struct BiosImageBase {
>> +    /// PCI ROM Expansion Header
>> +    rom_header: PciRomHeader,
>> +    /// PCI Data Structure
>> +    pcir: PcirStruct,
>> +    /// NVIDIA PCI Data Extension (optional)
>> +    npde: Option<NpdeStruct>,
>> +    /// Image data (includes ROM header and PCIR)
>> +    data: KVec<u8>,
>> +}
>> +
>> +impl BiosImageBase {
>> +    fn into_image(self) -> Result<BiosImage> {
>> +        BiosImage::try_from(self)
>> +    }
>> +
>> +    /// Creates a new BiosImageBase from raw byte data.
>> +    fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
>> +        // Ensure we have enough data for the ROM header
>> +        if data.len() < 26 {
>> +            dev_err!(pdev.as_ref(), "Not enough data for ROM header\n");
>> +            return Err(EINVAL);
>> +        }
>> +
>> +        // Parse the ROM header
>> +        let rom_header = PciRomHeader::new(pdev, &data[0..26])
>> +            .inspect_err(|e| dev_err!(pdev.as_ref(), "Failed to create PciRomHeader: {:?}\n", e))?;
>> +
>> +        // Get the PCI Data Structure using the pointer from the ROM header
>> +        let pcir_offset = rom_header.pci_data_struct_offset as usize;
>> +        let pcir_data = data
>> +            .get(pcir_offset..pcir_offset + core::mem::size_of::<PcirStruct>())
>> +            .ok_or(EINVAL)
>> +            .inspect_err(|_| {
>> +                dev_err!(
>> +                    pdev.as_ref(),
>> +                    "PCIR offset {:#x} out of bounds (data length: {})\n",
>> +                    pcir_offset,
>> +                    data.len()
>> +                );
>> +                dev_err!(
>> +                    pdev.as_ref(),
>> +                    "Consider reading more data for construction of BiosImage\n"
>> +                );
>> +            })?;
>> +
>> +        let pcir = PcirStruct::new(pdev, pcir_data)
>> +            .inspect_err(|e| dev_err!(pdev.as_ref(), "Failed to create PcirStruct: {:?}\n", e))?;
>> +
>> +        // Look for NPDE structure if this is not an NBSI image (type != 0x70)
>> +        let npde = NpdeStruct::find_in_data(pdev, data, &rom_header, &pcir);
>> +
>> +        // Create a copy of the data
>> +        let mut data_copy = KVec::new();
>> +        data_copy.extend_with(data.len(), 0, GFP_KERNEL)?;
>> +        data_copy.copy_from_slice(data);
>> +
>> +        Ok(BiosImageBase {
>> +            rom_header,
>> +            pcir,
>> +            npde,
>> +            data: data_copy,
>> +        })
>> +    }
>> +}
>> +
>> +/// The PciAt BIOS image is typically the first BIOS image type found in the
>> +/// BIOS image chain. It contains the BIT header and the BIT tokens.
>> +impl PciAtBiosImage {
>> +    /// Find a byte pattern in a slice
>> +    fn find_byte_pattern(haystack: &[u8], needle: &[u8]) -> Result<usize> {
>> +        haystack
>> +            .windows(needle.len())
>> +            .position(|window| window == needle)
>> +            .ok_or(EINVAL)
>> +    }
>> +
>> +    /// Find the BIT header in the PciAtBiosImage
>> +    fn find_bit_header(data: &[u8]) -> Result<(BitHeader, usize)> {
>> +        let bit_pattern = [0xff, 0xb8, b'B', b'I', b'T', 0x00];
>> +        let bit_offset = Self::find_byte_pattern(data, &bit_pattern)?;
>> +        let bit_header = BitHeader::new(&data[bit_offset..])?;
>> +
>> +        Ok((bit_header, bit_offset))
>> +    }
>> +
>> +    /// Get a BIT token entry from the BIT table in the PciAtBiosImage
>> +    fn get_bit_token(&self, token_id: u8) -> Result<BitToken> {
>> +        BitToken::from_id(self, token_id)
>> +    }
>> +
>> +    /// Find the Falcon data pointer structure in the PciAtBiosImage
>> +    /// This is just a 4 byte structure that contains a pointer to the
>> +    /// Falcon data in the FWSEC image.
>> +    fn falcon_data_ptr(&self, pdev: &pci::Device) -> Result<u32> {
>> +        let token = self.get_bit_token(BIT_TOKEN_ID_FALCON_DATA)?;
>> +
>> +        // Make sure we don't go out of bounds
>> +        if token.data_offset as usize + 4 > self.base.data.len() {
>> +            return Err(EINVAL);
>> +        }
>> +
>> +        // read the 4 bytes at the offset specified in the token
>> +        let offset = token.data_offset as usize;
>> +        let bytes: [u8; 4] = self.base.data[offset..offset + 4].try_into().map_err(|_| {
>> +            dev_err!(pdev.as_ref(), "Failed to convert data slice to array");
>> +            EINVAL
>> +        })?;
>> +
>> +        let data_ptr = u32::from_le_bytes(bytes);
>> +
>> +        if (data_ptr as usize) < self.base.data.len() {
>> +            dev_err!(pdev.as_ref(), "Falcon data pointer out of bounds\n");
>> +            return Err(EINVAL);
>> +        }
>> +
>> +        Ok(data_ptr)
> 
> Not 100% sure about this but maybe this should be data_offset and not
> data_ptr? It took me a bit to understand what was going on here since normally
> you can't tell if a pointer is valid just by comparing it to the raw length of
> a piece of data
> 

I understand it is a bit confusing, but is consistent with OpenRM code base
naming so I'll like to leave it alone for consistency.

>> +    }
>> +}
>> +
>> +impl TryFrom<BiosImageBase> for PciAtBiosImage {
>> +    type Error = Error;
>> +
>> +    fn try_from(base: BiosImageBase) -> Result<Self> {
>> +        let data_slice = &base.data;
>> +        let (bit_header, bit_offset) = PciAtBiosImage::find_bit_header(data_slice)?;
>> +
>> +        Ok(PciAtBiosImage {
>> +            base,
>> +            bit_header,
>> +            bit_offset,
>> +        })
>> +    }
>> +}
>> +
>> +/// The PmuLookupTableEntry structure is a single entry in the PmuLookupTable.
>> +/// See the PmuLookupTable description for more information.
>> +#[expect(dead_code)]
>> +struct PmuLookupTableEntry {
>> +    application_id: u8,
>> +    target_id: u8,
>> +    data: u32,
>> +}
>> +
>> +impl PmuLookupTableEntry {
>> +    fn new(data: &[u8]) -> Result<Self> {
>> +        if data.len() < 5 {
>> +            return Err(EINVAL);
>> +        }
>> +
>> +        Ok(PmuLookupTableEntry {
>> +            application_id: data[0],
>> +            target_id: data[1],
>> +            data: u32::from_le_bytes(data[2..6].try_into().map_err(|_| EINVAL)?),
>> +        })
>> +    }
>> +}
>> +
>> +/// The PmuLookupTableEntry structure is used to find the PmuLookupTableEntry
>> +/// for a given application ID. The table of entries is pointed to by the falcon
>> +/// data pointer in the BIT table, and is used to locate the Falcon Ucode.
>> +#[expect(dead_code)]
>> +struct PmuLookupTable {
>> +    version: u8,
>> +    header_len: u8,
>> +    entry_len: u8,
>> +    entry_count: u8,
>> +    table_data: KVec<u8>,
>> +}
>> +
>> +impl PmuLookupTable {
>> +    fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
>> +        if data.len() < 4 {
>> +            return Err(EINVAL);
>> +        }
>> +
>> +        let header_len = data[1] as usize;
>> +        let entry_len = data[2] as usize;
>> +        let entry_count = data[3] as usize;
>> +
>> +        let required_bytes = header_len + (entry_count * entry_len);
>> +
>> +        if data.len() < required_bytes {
>> +            dev_err!(
>> +                pdev.as_ref(),
>> +                "PmuLookupTable data length less than required\n"
>> +            );
>> +            return Err(EINVAL);
>> +        }
>> +
>> +        // Create a copy of only the table data
>> +        let table_data = {
>> +            let mut ret = KVec::new();
>> +            ret.extend_from_slice(&data[header_len..required_bytes], GFP_KERNEL)?;
>> +            ret
>> +        };
>> +
>> +        // Debug logging of entries (dumps the table data to dmesg)
>> +        if cfg!(debug_assertions) {
>> +            for i in (header_len..required_bytes).step_by(entry_len) {
>> +                dev_dbg!(
>> +                    pdev.as_ref(),
>> +                    "PMU entry: {:02x?}\n",
>> +                    &data[i..][..entry_len]
>> +                );
>> +            }
>> +        }
> 
> Not sure this makes sense - debug_assertions is supposed to be about
> assertions, we probably shouldn't try to use it for other things (especially
> since we've already got dev_dbg! here)

This was suggested by Danilo. I don't really feel strongly either way, IMO I am
also Ok with running it in production.

> 
>> +
>> +        Ok(PmuLookupTable {
>> +            version: data[0],
>> +            header_len: header_len as u8,
>> +            entry_len: entry_len as u8,
>> +            entry_count: entry_count as u8,
>> +            table_data,
>> +        })
>> +    }
>> +
>> +    fn lookup_index(&self, idx: u8) -> Result<PmuLookupTableEntry> {
>> +        if idx >= self.entry_count {
>> +            return Err(EINVAL);
>> +        }
>> +
>> +        let index = (idx as usize) * self.entry_len as usize;
>> +        PmuLookupTableEntry::new(&self.table_data[index..])
>> +    }
>> +
>> +    // find entry by type value
>> +    fn find_entry_by_type(&self, entry_type: u8) -> Result<PmuLookupTableEntry> {
>> +        for i in 0..self.entry_count {
>> +            let entry = self.lookup_index(i)?;
>> +            if entry.application_id == entry_type {
>> +                return Ok(entry);
>> +            }
>> +        }
>> +
>> +        Err(EINVAL)
>> +    }
>> +}
>> +
>> +/// The FwSecBiosImage structure contains the PMU table and the Falcon Ucode.
>> +/// The PMU table contains voltage/frequency tables as well as a pointer to the
>> +/// Falcon Ucode.
>> +impl FwSecBiosPartial {
>> +    fn setup_falcon_data(
>> +        &mut self,
>> +        pdev: &pci::Device,
>> +        pci_at_image: &PciAtBiosImage,
>> +        first_fwsec: &FwSecBiosPartial,
>> +    ) -> Result {
>> +        let mut offset = pci_at_image.falcon_data_ptr(pdev)? as usize;
>> +        let mut pmu_in_first_fwsec = false;
>> +
>> +        // The falcon data pointer assumes that the PciAt and FWSEC images
>> +        // are contiguous in memory. However, testing shows the EFI image sits in
>> +        // between them. So calculate the offset from the end of the PciAt image
>> +        // rather than the start of it. Compensate.
>> +        offset -= pci_at_image.base.data.len();
>> +
>> +        // The offset is now from the start of the first Fwsec image, however
>> +        // the offset points to a location in the second Fwsec image. Since
>> +        // the fwsec images are contiguous, subtract the length of the first Fwsec
>> +        // image from the offset to get the offset to the start of the second
>> +        // Fwsec image.
>> +        if offset < first_fwsec.base.data.len() {
>> +            pmu_in_first_fwsec = true;
>> +        } else {
>> +            offset -= first_fwsec.base.data.len();
>> +        }
>> +
>> +        self.falcon_data_offset = Some(offset);
>> +
>> +        if pmu_in_first_fwsec {
>> +            self.pmu_lookup_table =
>> +                Some(PmuLookupTable::new(pdev, &first_fwsec.base.data[offset..])?);
>> +        } else {
>> +            self.pmu_lookup_table = Some(PmuLookupTable::new(pdev, &self.base.data[offset..])?);
>> +        }
>> +
>> +        match self
>> +            .pmu_lookup_table
>> +            .as_ref()
>> +            .ok_or(EINVAL)?
>> +            .find_entry_by_type(FALCON_UCODE_ENTRY_APPID_FWSEC_PROD)
>> +        {
>> +            Ok(entry) => {
>> +                let mut ucode_offset = entry.data as usize;
>> +                ucode_offset -= pci_at_image.base.data.len();
>> +                if ucode_offset < first_fwsec.base.data.len() {
>> +                    dev_err!(pdev.as_ref(), "Falcon Ucode offset not in second Fwsec.\n");
>> +                    return Err(EINVAL);
>> +                }
>> +                ucode_offset -= first_fwsec.base.data.len();
>> +                self.falcon_ucode_offset = Some(ucode_offset);
>> +            }
>> +            Err(e) => {
>> +                dev_err!(
>> +                    pdev.as_ref(),
>> +                    "PmuLookupTableEntry not found, error: {:?}\n",
>> +                    e
>> +                );
>> +                return Err(EINVAL);
>> +            }
>> +        }
>> +        Ok(())
>> +    }
>> +}
>> +
>> +impl FwSecBiosImage {
>> +    fn new(pdev: &pci::Device, data: FwSecBiosPartial) -> Result<Self> {
>> +        let ret = FwSecBiosImage {
>> +            base: data.base,
>> +            falcon_ucode_offset: data.falcon_ucode_offset.ok_or(EINVAL)?,
>> +        };
>> +
>> +        if cfg!(debug_assertions) {
>> +            // Print the desc header for debugging
>> +            let desc = ret.fwsec_header(pdev.as_ref())?;
>> +            dev_dbg!(pdev.as_ref(), "PmuLookupTableEntry desc: {:#?}\n", desc);
>> +        }
> 
> Again - definitely don't think we should be using debug_assertions for this

Same comment reply above.

>> +
>> +        Ok(ret)
>> +    }
>> +
>> +    /// Get the FwSec header (FalconUCodeDescV3)
>> +    fn fwsec_header(&self, dev: &device::Device) -> Result<&FalconUCodeDescV3> {
>> +        // Get the falcon ucode offset that was found in setup_falcon_data
>> +        let falcon_ucode_offset = self.falcon_ucode_offset;
>> +
>> +        // Make sure the offset is within the data bounds
>> +        if falcon_ucode_offset + core::mem::size_of::<FalconUCodeDescV3>() > self.base.data.len() {
>> +            dev_err!(dev, "fwsec-frts header not contained within BIOS bounds\n");
>> +            return Err(ERANGE);
>> +        }
>> +
>> +        // Read the first 4 bytes to get the version
>> +        let hdr_bytes: [u8; 4] = self.base.data[falcon_ucode_offset..falcon_ucode_offset + 4]
>> +            .try_into()
>> +            .map_err(|_| EINVAL)?;
>> +        let hdr = u32::from_le_bytes(hdr_bytes);
>> +        let ver = (hdr & 0xff00) >> 8;
>> +
>> +        if ver != 3 {
>> +            dev_err!(dev, "invalid fwsec firmware version: {:?}\n", ver);
>> +            return Err(EINVAL);
>> +        }
>> +
>> +        // Return a reference to the FalconUCodeDescV3 structure SAFETY: we have checked that
>> +        // `falcon_ucode_offset + size_of::<FalconUCodeDescV3` is within the bounds of `data.`
> 
> The SAFETY comment here should start on its own line in the comment

Fixed.

> 
>> +        Ok(unsafe {
>> +            &*(self.base.data.as_ptr().add(falcon_ucode_offset) as *const FalconUCodeDescV3)
> 
> FWIW: I would use cast here, not as.

Ok, I'll kindly defer this to Alex since he wrote this line.

> Also though, I think you need to justify> in the safety comment here why it's
safe to be able to hold an immutable
> reference (e.g. why can we expect this data not to be mutated for the lifetime
> of the reference?)

This data vector is ROM, also 'data' in BiosImageBase is immutable after
construction. I'll update the comment.

> 
>> +        })
>> +    }
> 
> ^ missing a newline here

Fixed.

> 
>> +    /// Get the ucode data as a byte slice
>> +    fn fwsec_ucode(&self, dev: &device::Device, desc: &FalconUCodeDescV3) -> Result<&[u8]> {
>> +        let falcon_ucode_offset = self.falcon_ucode_offset;
> 
> I think we can drop this variable if we're only calling falcon_ucode_offset
> once
> 

Good point, fixed.

>> +
>> +        // The ucode data follows the descriptor
>> +        let ucode_data_offset = falcon_ucode_offset + desc.size();
>> +        let size = (desc.imem_load_size + desc.dmem_load_size) as usize;
>> +
>> +        // Get the data slice, checking bounds in a single operation
>> +        self.base
>> +            .data
>> +            .get(ucode_data_offset..ucode_data_offset + size)
>> +            .ok_or(ERANGE)
>> +            .inspect_err(|_| dev_err!(dev, "fwsec ucode data not contained within BIOS bounds\n"))
>> +    }
>> +
>> +    /// Get the signatures as a byte slice
>> +    fn fwsec_sigs(&self, dev: &device::Device, desc: &FalconUCodeDescV3) -> Result<&[u8]> {
>> +        const SIG_SIZE: usize = 96 * 4;
>> +
>> +        let falcon_ucode_offset = self.falcon_ucode_offset;
>> +
>> +        // The signatures data follows the descriptor
>> +        let sigs_data_offset = falcon_ucode_offset + core::mem::size_of::<FalconUCodeDescV3>();
>> +        let size = desc.signature_count as usize * SIG_SIZE;
>> +
>> +        // Make sure the data is within bounds
>> +        if sigs_data_offset + size > self.base.data.len() {
>> +            dev_err!(
>> +                dev,
>> +                "fwsec signatures data not contained within BIOS bounds\n"
>> +            );
>> +            return Err(ERANGE);
>> +        }
>> +
>> +        Ok(&self.base.data[sigs_data_offset..sigs_data_offset + size])
>> +    }
>> +}
>>
> 
> Would be nice to get other people's take on this but I feel like that we
> probably shouldn't make these methods conditional at this point,
> FwSecBiosImage as a type name with FwSecBiosPartial implies that we should
> have already figured out if it's a valid bios image and extracted the relevant
> data in ::new() right?
> 

Do you mean these things be computed at object construction time? I am not sure
if I agree with that, because maybe computing some of these will be optional in
the future. And it will also require additional fields/footprint in the struct
to store them. Probably more LOC too.

thanks,

 - Joel


