Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DCCB0437E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 17:22:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA29F10E4B6;
	Mon, 14 Jul 2025 15:22:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VcJuBzZd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2087.outbound.protection.outlook.com [40.107.93.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A07310E4B6;
 Mon, 14 Jul 2025 15:22:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SM5n/7L36rXB5NgS8hAYzjeQdlrWdJmUgn5mijX93XlAievkEp1duu/HNIQ3m2tLZYVqAhLJpTfw2M4cCvAK4nEHSIRKB+956Uf1SrrbDZpS0IG3hB6SgH4F+sAXSgxWiKMEW+s/8lW6yhwSdwXMz92vj/LYeeTfJSTywfXa22N280LeP4KgUnHE9/zSBq53LVfVENZJYl8dJ/gCLegQnV8wMrdWoZzoZT0+kg+HxzXFuHmFxWIDEsTwcfoeQgoD/2Apm9YxTrp1L1s7gL5RkK44dqJn9tJFDpZW8u0CTKpMonuHilyV2qHEm2wIzf6rS4EGWjlubJ5oI9SdeRlVww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Abx34pjP1MTEVCEl97LK5W+y54efz6wQUye6BjEa0eE=;
 b=KoZHPtSLUZkshsVtBQ4Cvl+Uxe3GUW7c62lXCwMPnFKM9YRgj97hMyFp9XEamLwVV927gFmKktaeO9RXUrRHM3T9idVWA1zLNaJqqMR8TYunYRA4JpcyEQc6S7CSrHJCpntw4rzDiZ0KDH+8AmKej6HdMoxxJDI8yqNP8Xaa58AaDTOoFYmqW/SArrJ0KVSUTziq3ZnXI4wIsH0qgFSZVy3dzH3xUkuDqoln6fhin6N5T9My0DEeSm33q4F/aG5rFUC7Hjc3Ul5JyTS79y2ZL45LkCX6zfz4QVt3hi8XUkrIUTQSWzl5bW4+gJxQrLgdnURrHbKNSuz7lxXqZHBs1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Abx34pjP1MTEVCEl97LK5W+y54efz6wQUye6BjEa0eE=;
 b=VcJuBzZd19bIpKeTa7pjvR57wCMN1Eno6SeK3f9KweVUpLBeKYpxAGfxis3/N54TunlA2betvcu/GgvK5CdTNx9LvCnB7yyNTQQZUDrkwMnVDHiW4NbYi4Zaf5Yb5pLRlxt4Uj50cUx8TTmCvfM9L/MTWAZqCn83MtOEVx9w32CDf/XtcFQvK/K9tyX2emGPhh7+lulCHi2wDwlBe7/NXBm1E10nHQDiapiPqhADb8TXVuyn//ChP7P/BuzhCegh9VSfltKnC8YrTYKSeAARqERvNrTZYIrodrt0CSavPx9KjO1pzIq7ebaKD+k7fNUfLGM71HNWdHs15Vmo79lp7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by BY5PR12MB4036.namprd12.prod.outlook.com (2603:10b6:a03:210::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Mon, 14 Jul
 2025 15:22:08 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%7]) with mapi id 15.20.8901.018; Mon, 14 Jul 2025
 15:22:08 +0000
Message-ID: <b56a6923-7795-4b5f-a57a-5775a3c08f19@nvidia.com>
Date: Mon, 14 Jul 2025 11:22:06 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] gpu: nova-core: vbios: change PmuLookupTableEntry to
 relax alignment
To: Alice Ryhl <aliceryhl@google.com>
Cc: Rhys Lloyd <krakow20@gmail.com>, acourbot@nvidia.com, dakr@kernel.org,
 rust-for-linux@vger.kernel.org, airlied@gmail.com, simona@ffwll.ch,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250714110229.141221-1-krakow20@gmail.com>
 <20250714144837.GA2996266@joelnvbox>
 <CAH5fLgiFOFm+Lh0K_PDZ2eCFa0EAOMk9GRh0Cgh2sm8fay=qnA@mail.gmail.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <CAH5fLgiFOFm+Lh0K_PDZ2eCFa0EAOMk9GRh0Cgh2sm8fay=qnA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN0P223CA0026.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:52b::12) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|BY5PR12MB4036:EE_
X-MS-Office365-Filtering-Correlation-Id: beb7a198-2126-4994-7157-08ddc2ea32a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eWt4SEZvRmlpZi9WcXR2N2hoWmFvZEVYZThFRmVST0E1L1hrYkpGaXJjR0hG?=
 =?utf-8?B?SGNnZVlSaVVYOG9NZzNST21EcGRkYitTQm0xQllmRG5HbzBGM1VYK1ZlWTBC?=
 =?utf-8?B?Z0hJdGpVV3Q0TE1aNEROb3JEeWJvZUd1ekk2OTZBOUJYcTdBdERhZ1YxdWZq?=
 =?utf-8?B?MGEwaDljMFA5eDZSWUJTcm9CMUphV25OdkZNWkNSNEYxZkE2ZGNNYkx0cU1W?=
 =?utf-8?B?YnRiSVFZMTNPb0xzQUF1VUJwUFF5UjRoSGtSOXhjdklSWWdjcE1KeHM1cHQw?=
 =?utf-8?B?Rm9VdGVTcFRrdndjdE9nODh2QUxPamkrR3U4U0o4bGsvVU9uSENHYnp6STg5?=
 =?utf-8?B?dTNPazRFbTQ5U09kbnErMlpldkpXSmlqY0VjMlNicWtPTy9HVTJCWUN2RG9t?=
 =?utf-8?B?aGJpZERaUmp4M3RJTE9LcVo2MHYyY1B0ZEpETU00NG42aWlpMnB0NWMvb3Rt?=
 =?utf-8?B?amJxZ20va09MMDVBK0gwN044VForZ1BZVFQ4bWI3THRPWjFGeW4zamw2eUtX?=
 =?utf-8?B?SmtKMzRaMm43NHRhd0JUVW9BR0ZacE1qZElnbTY0ZUI5bkpuaS9ueUZ5ZjI3?=
 =?utf-8?B?STF2UlpZL3lYTDB1cWR4WkdueWRxTjRYc0xEVGZ0NHZDenZMNk00RFJMdEtm?=
 =?utf-8?B?aVFFY1JhUVVSNnd5NEhSa1VjMkpKNDlwbTZhL1pVb0E1VmZRbUlVdjh4NnI1?=
 =?utf-8?B?aisyWDM0aWdESnNYT2NjYlJPQ1ZWamQxdStZYUR3SHFqcEZ2bmd6YS83Wjlt?=
 =?utf-8?B?WTZUU0pGdFRLU2RhalluaFVLWFo4QVV4Q0FwM0pYdmhOelN6QWE1VTFLK3M5?=
 =?utf-8?B?d0JRWUdVU3BqTFJmcVArSE5qU281M1l3ME1QMHpySFNLWS9vRjdkYjh0QUl5?=
 =?utf-8?B?MWdLaEM1NjZyU2NJRmt5TkhHeEMwTkNwdU00S1M0L2d5enZMcDZueEVCYSts?=
 =?utf-8?B?eFZUdGREWlI3SHVQTzRUQjdMaW5JeExpR0ZFYzMrL3JyMGdWc3RDNkhCUDhy?=
 =?utf-8?B?ekorZ1BrNEsva3o1SmFvWDAyQjdjN2p5eFNHemZkSld5SkdJME1ySWFIOHlv?=
 =?utf-8?B?cTU4c2JUM1hZVUxOTFBrMnMvVkVpSk0xck52SlR0WnlkZzJIaFRpbm92TUxQ?=
 =?utf-8?B?bkVwNmZVcEt6NDVzSlBOK1lBYXRoSUh3NEMxeTMveU9jNHJMeGVNN0RrVXFR?=
 =?utf-8?B?ajdFMU1ydjkyNnliQkovQ2U2QVFpSllrWDlQaXRpSmFmS3FLak83QUM3WFYy?=
 =?utf-8?B?bVdiV1VSamNYMlBzVVlRTFhZZ05qSUlueUhHV000WDBGYld5U1VqQUNYaXBq?=
 =?utf-8?B?eWg5QnEzeE92MGpZU054S1d6V3MzRHVJOTBpS0hLL05FREFET0ZBZURTUm1z?=
 =?utf-8?B?UjhLOUd0TVZYUGdxL2xyWDVJZFJWTjRFUWkyZzdFVFc0c3ptRklxVXo2dXJD?=
 =?utf-8?B?UTF1cGVCTE9BWG9uMmNuSDBqcDNaT3FKcWljSXZERFpoQnVPdTk0VThaL1RH?=
 =?utf-8?B?NDlqYXBIbDlyY0V0SS9OU3grNjZ0azBmU09tTDdkMWtJV3hsS1ptM1ZZUEdt?=
 =?utf-8?B?N1lDR1lTaGJsMXFwVkY4K0NZSjFGdk13bnBMRjZFLzdXYVA3N29HV0dlNjlN?=
 =?utf-8?B?N0JRbXJId2VwMU5aeWlsY0NiVHFmYzdHN1hwWWVNVURRbDZmRnNZU1FlMU5j?=
 =?utf-8?B?MWlSRElhVTM2YTdrNlBYRzUvMUFpdEE5WUFMTkIyS2dZVklNSVZYZDNvK0NU?=
 =?utf-8?B?bXRNSExESFZRZTJvcnNGemJvSnpic1NCUWwzeEJsMFZGSnJQUnZoeUhoYlQ1?=
 =?utf-8?B?aHVzejJ3ZlQ4NmFnMlRzZytKT1p0VWVMWFl2aEtyMzIxTGF6RGhVZXRCSnpj?=
 =?utf-8?B?eFBGN3A0Wkd5d2FzRUsxVWY2RVNta3NYTmdSZGx5QStLaGc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TG02ajJZUTBqSGIzT1NiVmxNQzR4N3JxbW5jWHZLZ3NLclBhRmtKN3RuckJI?=
 =?utf-8?B?OC9CV3MvUHdmRTdvNlZjQzVINE5aZTZibkYxdGR3QWZxaGk0TDlQUUdZdDVP?=
 =?utf-8?B?Z2dTQ0x0Zy9BKzdOMzR1MDlEQ1EvYSszcjBUVVltTXRFV0hCcDBmR1JjRXNB?=
 =?utf-8?B?YmNDVElyMTEvVVVEaDg0akdXQXN0YU90djVqOVdjbjM4RXQ2aFlvNEd2TTU4?=
 =?utf-8?B?U3BLcmd2TUhNQVJKb2cxczg4R0owSXVMRXlVb255Q000U3hPTkFFSXg1NkJF?=
 =?utf-8?B?Ykc5UWJsYWxWRlJMdldQREFWNW1ubkh3MENvRmcrRDhPT0gybk02cmNhdzdh?=
 =?utf-8?B?SUxlbGR3SWdOOWhGaU1WUzBSNFpQenpBTUYwNHdjdGgyY2RrUWRULy8xL3lR?=
 =?utf-8?B?V0xCZU5VVzhLT0xwK3VvVDN4RWhDb094dWpmM1RqZUJPUGlIK09SUkFFQ1JR?=
 =?utf-8?B?cXRNNmNDUlV2VnlObjVmTjJkVFhiMWdIVzhqN1docDBndVBUZVQ2Smd5ZmRR?=
 =?utf-8?B?dlg2QzdsWVc0Vy9yU0xuUFFuWkJXQW1oU1FldXdHdEpWdTZCd2xZSUhkbXN6?=
 =?utf-8?B?OUpWNEpOZ0ZyWTh5RnlFc0xHcTFjTlNDdkkvbTVOUk5JTlU0R0VSb29JVDZS?=
 =?utf-8?B?OXUrZkozb3FFcXVpQlJxRVozUk81akt2NFlqUU5ORC9CazkxNUhwZXphMUlz?=
 =?utf-8?B?RXFSRzdrUExieE03TURGVlc4QkNPVUQ1VEduQVlaSmlxcmRLWWtpVHdzVVNK?=
 =?utf-8?B?dGc0SXd2VEoyUFBUSVQvL0QxRjFqYU1LZEFXQnJWVElQc1UraFhvd0M0ZGZo?=
 =?utf-8?B?MGdFTVIyaXBFUWRpemtqWXIwZVdDRkcyYS9YMG1OU2ptbUpXS0JlQ2JISlJM?=
 =?utf-8?B?dXhjRTNIck5UcDY2ckxaUENLUVFIeTNoMUJIWUVISzV0NFp1TEVhVFRrL053?=
 =?utf-8?B?dlVNR0Mvb0I1N3o5Z1RJTVF4VndRN3E3anFzdkxSWUdrSnZqWDNpd0F5eStX?=
 =?utf-8?B?R1VwRHRxclIrK21GalFnYnNaaFZobWNjSlhEOGY2U1ptaHFOSWk5Q0pxeWlN?=
 =?utf-8?B?OUdZcTdFSEdKVXd6a1VZWVpjeGZkaFJXc3gxTlA5Yjd5cXN3TzI5UHpUcXZ3?=
 =?utf-8?B?MThlSnhNMkhxNGNNTDQ3SUZhM2tMUGlVZ0hKS09CeTVsRmkrRWozWTgva0NO?=
 =?utf-8?B?cG4vQW0veFJ1WW5OOWRaQ202b2toUHVsWURjSXBTR1dqOCtzajhwQlFjTnA4?=
 =?utf-8?B?SWswbEg5UjJMdGdicldCcExLSWVkaWZSb0RkUXlyZjMvcGQxTEltWm8yYmNY?=
 =?utf-8?B?WnExbUNqNllQbnFlOStXU29MbThoYXJZK25tWUlzK0lxeThGREhBR0ZuSkE2?=
 =?utf-8?B?RFdScTV5clVmZzRJdHQ1bmNsMGwreGNRUW43YjFYL2U5OURKQ0wzZ0JOSkVP?=
 =?utf-8?B?ZGxPVmFvMmpobEZkNVBxanoxNFRxazVMZSszbWVLWWRVUGYvNVJFZlE3TW5x?=
 =?utf-8?B?S0VnMFdFek5WZHUyTkxUaUE4RjErQTB1VXVpdTY1TzdUUkQzRG0xQmdqOXVU?=
 =?utf-8?B?SENqVDk1R1V3dlBLelRGMENON1RvVFJvN3pWM0FlQW5lMmwvaUNXWXB5a2Va?=
 =?utf-8?B?djcyUmNuenk1bUNHSU8zRG9kTDBESE5jd3d1c0gxTnZwSVc5NHZBeXk0SVpR?=
 =?utf-8?B?eVkzSElNd2NXd0lpMTFJYUIrajJMaEUxSFNKMXZkVHpYRzZnYWt0VFdRS0ky?=
 =?utf-8?B?MXhFQTVyWWFOaG8zM3pMU0IrcCtERkhqYk5FTjRMV0I3QXkwOVpsUHM1TXpC?=
 =?utf-8?B?NUFzT1MvZm43QWtncG1BYWZzMkRwck56c2Jrb3p6SGV5eUZ6SExvU1U5ekUx?=
 =?utf-8?B?Tml2cG5sS1I1Z2lUUTZKclRCd1lhNFExWk1oMDhPS3JMT1N2YVJCbDZub2tR?=
 =?utf-8?B?UTd4U3ZJdTF5ek1lUXBBZVFBazVTdFVNYzN2L05kcFhEM3l0OXlST1U0Qk9r?=
 =?utf-8?B?aUtreUNTUWtnSFlLaVlSWHIrdFZlbGk4YlJGTjFxclRiTElwMEZPbTNNYkVy?=
 =?utf-8?B?SE5vcCtXTTF5NVNsNkVhK1R5SjUxMUJkSTRPd3BZY3RZRisvQksxeE1LNVg2?=
 =?utf-8?Q?1rgFOob91Pjm/W/Pyry/plqdO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beb7a198-2126-4994-7157-08ddc2ea32a0
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 15:22:08.5780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +za0jZQwMElPeM6nEF3Sv2SEt/uTcCkDMmM7bHDu7EZApVK2SCwNTTGwY2praqpwyOZVgZU77HKsWuSvQI2Q8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4036
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



On 7/14/2025 10:53 AM, Alice Ryhl wrote:
> On Mon, Jul 14, 2025 at 4:49 PM Joel Fernandes <joelagnelf@nvidia.com> wrote:
>>
>> Hello, Rhys,
>>
>> On Mon, Jul 14, 2025 at 04:02:23AM -0700, Rhys Lloyd wrote:
>>> Instead of the data field containing a u32 and changing the alignment,
>>> change data to [u8; 4] and convert to u32 with a helper function.
>>> Removes another magic number by making the struct the same size as
>>> the data it needs to read, allowing the use of
>>> `size_of::<PmuLookupTableEntry>()`
>>>
>>> Signed-off-by: Rhys Lloyd <krakow20@gmail.com>
>>> ---
>>> Changes in v2:
>>> - get_data helper function renamed to data
>>>
>>> ---
>>>  drivers/gpu/nova-core/vbios.rs | 13 +++++++++----
>>>  1 file changed, 9 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
>>> index 5b5d9f38cbb3..339c66e63c7e 100644
>>> --- a/drivers/gpu/nova-core/vbios.rs
>>> +++ b/drivers/gpu/nova-core/vbios.rs
>>> @@ -896,21 +896,26 @@ fn try_from(base: BiosImageBase) -> Result<Self> {
>>>  struct PmuLookupTableEntry {
>>>      application_id: u8,
>>>      target_id: u8,
>>> -    data: u32,
>>> +    data: [u8; 4],
>>
>> Instead of this, could we make the struct as #repr[(C, packed)] or does that
>> not work for some reason?
> 
> It would probably, but packed structs aren't very nice to work with
> because Rust has to be really careful to never generate a reference to
> unaligned fields.
Oh, interesting. I am Ok with the [u8; 4] then. Btw, we do have several
#[repr(C, packed)] in vbios.rs already.

 - Joel

