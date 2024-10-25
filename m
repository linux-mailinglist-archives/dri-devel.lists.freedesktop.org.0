Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A87C9AFB85
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 09:51:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44BEA10E2AD;
	Fri, 25 Oct 2024 07:51:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gVS/e2B0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2084.outbound.protection.outlook.com [40.107.94.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E5CF10E2AD
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 07:51:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QFObF4mqStO5T5V7PsPgnfTDPtKcTFK7LQju7kpMvCpQjAOhEQbf6ir8fc9zG16OiiiUezj+roRCdF5LhP+dDE8D7rjaWNmJOmHBP+3ZcDSzz4S0BRqXEFV+UKcWE+pN1+gmoppuSvv1ZKv4dkTvtavGggD6UId+/ZZCFZBn0xIpAELP1fYAHJt7PIHgQLyDhZlA+NUMsNwYT0JfRGOYllb2sYIkwq9hsLSCla78/CoDdQdifoQZO/DIWV2gXeijetIM8BRN7zJ8ELRqSHxaivzX9roW3w+TXP4Tz6Lg4Ef3PSRj7bxvjgCYf9CTe4xjB9Q3Uu69xE1hGuaVjfBf7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Soh5htLbmqhnQbUK8LL692N7Mzh4mOjE3biFcwK0Bf8=;
 b=WriIM16qhA9bo2YIn8b6Jx83yz3Xa6FZKrhj1OTbm1aW8CNFYzo3C0Ww2w0cN7oHqi92JgIct8OLzT0quLiYyvdAg69IDNCkapiW2o4AoMSQCp8qZRGO9n7C3vBQjJQ98743+c8e1iVfRMfEO6TIVOHb+FAHhYeZv6/l6rAYNPcAp+uL5rzs8PAWnmTAWvpgWLVtA0eiqtGjAeTQmdPDSr6a4kXCU7Xps3aeqJNUW9o96vV0E9OjIPOhoGE+il2RVIKlo9Tx2mHEd+ay12KlvMP3Vgt1W7YEtlTmdCBM2cHE/DslsL5/cxj+io/c8fOGC72WdEeYx4h23W+DXQUbog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Soh5htLbmqhnQbUK8LL692N7Mzh4mOjE3biFcwK0Bf8=;
 b=gVS/e2B0zqrdBbBbWTK0AZCm7l0Ex86lwUcbG7To2uAWLfg6n+ZIfA3GgOLRjyVLWXkxnywoiKWrln3MTXQrFRJjb/0fOkYfgtmXIGf6fWvjC+qZLEgWPnuBimR/L9VkY1yVva76RBQksW+4F7g2ZjGduqhPZ66Kpet58E3sXMdXCEQ9z2pfwFM1gs3PiZsMjgJKNQJpSTgYhg0WLkRCxsw5oIJ5M4rHj7fRifyJaq23MmEe9Fkn49gr2YwZVYa2v24S9Uh+0+U1IuNtcrgvnWmmlB8p39ANwftv+JoW57LFZqsgTmLQ6uGzdh6lDVKhpkuNDdihfg3xOWjGl64pww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB7914.namprd12.prod.outlook.com (2603:10b6:510:27d::13)
 by LV2PR12MB5920.namprd12.prod.outlook.com (2603:10b6:408:172::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Fri, 25 Oct
 2024 07:51:46 +0000
Received: from PH7PR12MB7914.namprd12.prod.outlook.com
 ([fe80::8998:fe5c:833c:f378]) by PH7PR12MB7914.namprd12.prod.outlook.com
 ([fe80::8998:fe5c:833c:f378%4]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 07:51:45 +0000
Message-ID: <46b487ec-e8a6-43fb-85d5-f264618f2e5d@nvidia.com>
Date: Fri, 25 Oct 2024 15:51:40 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI/VGA: Don't assume only VGA device found is the boot
 VGA device
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Luke Jones <luke@ljones.dev>, Mario Limonciello <superm1@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20241014152502.1477809-1-superm1@kernel.org>
 <20b48c6f-7ea9-4571-a39c-f20a9cf62319@app.fastmail.com>
 <f56c555f-7313-43ff-abe4-28fb246e31cc@nvidia.com>
 <CADnq5_OjfJzcOqa=NbWVw5ENvi+nmvNAZX0u_0hOvk3EVoh0bw@mail.gmail.com>
 <fd7cae9a-5ee1-4e18-915d-4115f0a6a156@nvidia.com>
 <CADnq5_NTBXPbW+u_AxTewH-aouLNn4gxebpzUSzsyev-VxOtcg@mail.gmail.com>
Content-Language: en-US
From: Kai-Heng Feng <kaihengf@nvidia.com>
In-Reply-To: <CADnq5_NTBXPbW+u_AxTewH-aouLNn4gxebpzUSzsyev-VxOtcg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TPYP295CA0054.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:8::6)
 To PH7PR12MB7914.namprd12.prod.outlook.com
 (2603:10b6:510:27d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB7914:EE_|LV2PR12MB5920:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ff924a3-4621-4f99-3edf-08dcf4c9df7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VDJ5cDZtNzdCelU1Z3VSbUFMbUx3VUVIZ0QvYUg3MlV0cnk1NHJ5WXJOai83?=
 =?utf-8?B?UjlQYnk4cTJTQllCS2Qya1RHSmt4ZG1yTFFJdzFqNkJDYUhpTTAyQXZiUWgr?=
 =?utf-8?B?eGt1S3g5UjczRkFDZCsxNzRjVlY5cXM1RS9NRk5sUXgwbnNwdjNVam9JZWdQ?=
 =?utf-8?B?RUdaMllyMjVrUVhLQlR1KzVIVkNaMk44ZnFYTHIwVmZCZ2FWcEkwbWRHenI5?=
 =?utf-8?B?NEFyNFl0RVFmUk8vNGo3cVkvblpqZVloUEdZTzRnZUxFeXhiVFFmQmgvdEg1?=
 =?utf-8?B?NVp5NStuU2dVMmNMak0rSldyU1BGRGJMTXB4elF5Q3Q4ZFlCa0QrOC9ySlU1?=
 =?utf-8?B?S3c4aFBCNi9WamZTSmdaMEp5bnlXL1djM1lIeFdUUDdpUk1ybmU5TkwvMnVJ?=
 =?utf-8?B?aTVSTE9JelZtK2pVRnlpRHAzUVJXK0ljWkZTbWsxT2JabjhrdjB6TkVCUkxx?=
 =?utf-8?B?K3BaTDdiVnd1VWlUTWxSYkJSb2J5ZkNJZi9SdHV2SXlqWXB5TjNHZVI4Tlp5?=
 =?utf-8?B?eVE5djZpeFEyRm0ydEFDRUREc1UyUkpjWGNxWFJuNXA4cEd0Q2VjNllmMlhi?=
 =?utf-8?B?U3ZpQmo4QThjRnprTzBscWdpaVlzNnhoVmFxMWYyMGQ3aWUzbVdYYURadENJ?=
 =?utf-8?B?amtBQ3IwazVQTTRML2dLbHRwdVF1ODZwRzZ6UTI5dEthdC9ISU1oQmcrMFJ2?=
 =?utf-8?B?c1dxUEdRZVA4bU5sVWJFUG5pQmdBSTBIOTU4Nk1MVFVvYjZpR1JXTnlMV0pU?=
 =?utf-8?B?eEZEanZlOFBtZS95dHJZc2FqRVUwWlZxZnJQT2xzR3ZSeTdCaHZMQUlDeFpn?=
 =?utf-8?B?OHc1dzRHdUMyNTgzR0wrOW1aMW1UbEhKSUFLWTJLRzlMYkFWSGdXY3owUFhk?=
 =?utf-8?B?elB6ZFRSbnNGNnpXcC9EcmNzRWVqM0NkS0h1UHk4T1N1ZFJIM1lhVkhoQVhP?=
 =?utf-8?B?V0l1Nk5JblpvYkV0cXJwRm1QQm12d2R6S0hySElrS2JRL2FrTGdRSU83cWtS?=
 =?utf-8?B?N2daR0xJNGZYckxPNXFCandLK3c2Y0kzYmJVNHhIT015WllpZTArTnZKUlkz?=
 =?utf-8?B?YlczUnV4SXY1a0hGeTkveGtjWnRXMVdWZ0JmTE9pTFVhV3hFMTZjSHU3Ukoz?=
 =?utf-8?B?dERqWmMxd0Jid3RVUmJoLzc2ZnV5SHB1MlY4L3hpVHBLZXFDcGpmc0UyMVFT?=
 =?utf-8?B?NWx5ZU1kcktVZ2xKN0MvNjBXbjlzWkxqTXEvOFFYbll0MWFRY1paMXBTenhL?=
 =?utf-8?B?azZXaFExQlR3cityU3BVY3VaUG1SbVdMaDFlbnNDOTF0ck5lZlhCYWVib1dK?=
 =?utf-8?B?dXhFL0tLc0duOFFiTi9SWGhJd1RsTEdPZHgvak1LVTBiREFLQ2Z6bjZEaHE1?=
 =?utf-8?B?M3BKYnF4dWg4eFJCRytpK3Y5Z1ZKL05DOE5qRDY5aHg0cTZrWWFXZFdOVFhp?=
 =?utf-8?B?N1hUTzVqU0RnMktEWjlEV1NVT01naXJVZVV2ZzcxT3lhMjBVZXZIZHo3NVU5?=
 =?utf-8?B?ZVpFQ2drbWZCdDAwR0Zlck0rOEw1anJOdW8yWHdocXY2RkJ1dExCWTlPQklI?=
 =?utf-8?B?VE1IeEFvaXJaQ05ZamlEUTdPTzQxYjZialk4SjdkUnkrMEZCWTQyZitWdXVC?=
 =?utf-8?B?eU1QTnpQU2N2MHo1U2QvSmxlNzJJWFNoZHhySXpUeUFMQlEzSmhuM25DUWdQ?=
 =?utf-8?B?cy9wb3h5KzIzSm1CUWhjWk1JdEo1WXlTVGR4MHBjVUQvS2ZkMFlhRnRjVlZa?=
 =?utf-8?Q?4ZzX8zIOfxJ3FUNcfW5uAs7TEn4RK2C1chgEckY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB7914.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzZ6MTR6bGJ1MXdLY0p2WGE0TXBwcEs3TWxRek05ZkhyMDFhK2Jtem9VYTR3?=
 =?utf-8?B?L1hiejVhd2hZazNtalQ1OUY4OE9SZVZGcWxGWldSWnlFUTZsUDFVQkgrbXFZ?=
 =?utf-8?B?eXQ0UlVNbDdtSUg2bjMxL3RqWW9hc1BCSWJFK25sQjJHVjRCa04zUXRUb3Zt?=
 =?utf-8?B?V3ArVEkveHVobTV5VE85TVhyazdzVFpwK2IvZSt4YW4rd09ydUsrblJvSFVa?=
 =?utf-8?B?OGh0b3NXNnJGaTQrU3NiT0RXL0gzczl2RTBmZ3RFWjJDOVVlSUNuQ1crcE1P?=
 =?utf-8?B?eFdLc3h6UjdhZVc2RGQxZ1dReUNyL0ZBOXUwNndablJRL25XVFRlY0VCVEVP?=
 =?utf-8?B?bXlzQ2Rrd2R3ejhaYkJwaGE2Lys2UnZ5cGZqVlZ6NXpEYVlJcFg0V3BqT2NE?=
 =?utf-8?B?aUV1dTMzb202YjV6czFxWnRWcHpZbURqRnpqVW1BSTlKQmcrWm04bUV1OEJk?=
 =?utf-8?B?SjZkRmQySCtZNXlJS2t6MmdrV1duUjVndXRGWnNkL2k4VEtzWWJlWVRnNE9k?=
 =?utf-8?B?U2ZFU0dsKzNmdWxxTTd0cnovUi9Qa3plYXBxRUtzODlYMjh3YVhkQURYRWVR?=
 =?utf-8?B?VHpMRXZxVDRrZC9lL1ptUndscG1SM1ZYYVA5bVdjbGdCc2RQUUJuTStudVpR?=
 =?utf-8?B?MUtXeGgxMlAwM0pSYWFpbFpRVkVHczJ4emJ0WG9GT2N1TEVjR1hVcjJCSDky?=
 =?utf-8?B?WDFsWXhxOTdHWUV4YmZ0YUNRS1B3cEw1L25taEMveXdnczVnVnR0NlVpSUdX?=
 =?utf-8?B?RDR3MWVBSkVFcmxZSlFnNlJib0dJK0o2cm4vNDBMOXhHbmFNaGtveDRxRm4z?=
 =?utf-8?B?NHYyL3FuOVVnczFjd1FZUnN0amZiek84QTdWRWR4S29UZHdVRnRjQW82VktE?=
 =?utf-8?B?dDg1Q0ZUcndTYkIvd2FxYUZtb2RJWCtnVjBaQ2FRM1VSYVd6cUxRVVYrV3h4?=
 =?utf-8?B?dGhacllCcTJtQnF6L2QwSVBZTHk0bEVtZzZ4K1pVa0VUM2FPRFhnKzY1bGZL?=
 =?utf-8?B?bk15dGY3bXgxRm9ZdG9tNHFISnkzTUxnczJzMmNTTHJQMU10V3oxczV3MmpZ?=
 =?utf-8?B?c01WWkZVcGRaTDh4Q0RpL0ZGbVhiUWVkS1hFNFVDUG1JNXlOa3RPeGNuODN6?=
 =?utf-8?B?eUkxT0l1akxvVHRBQk80SCtHNG9KT08wWTlqUys4Tk15TU5ya1ZKYzZnYWNM?=
 =?utf-8?B?akVRWGwyNzArSDVGaE9HWlF1ZUlqNzNMRE40dG45R2NERUNwK2NiYkwvenRr?=
 =?utf-8?B?YXBFQ0RVYTBFMURtZGYrbUU4SUZNd0dIa1U4eXVBMnowZVJZMDYyTlRad2Ix?=
 =?utf-8?B?SVdXRndvWlR6OUluZUhmeU9ySU9NQURPa1JWVlBlUVlCT3M4L2dkMzNSM0Ux?=
 =?utf-8?B?eS9HNUJhRXdBeTBMNkxpdkdwUGZmVlZqeXNaWWtHQ0kzSEtwRWJjUmVDT0U3?=
 =?utf-8?B?VFgzbnRXdUFIZ3cxL2FYU0g4ZEZvdDg4TEVxUGVNZ3NCb1Qwck5XSGFBa0NZ?=
 =?utf-8?B?aVBoa3daN0tRQXUwbFJTRlRmSkhjK3VSNjdrZExBSHNsU2cvUE5UdUpLeVVz?=
 =?utf-8?B?dng0Tmt0NmptaTVqbkM1SzN5Zllsc0dYSjRjZU5BV3ZCYVUzU3FzckQyZGly?=
 =?utf-8?B?aEI0aGlGRTNhQjE1N3RhdDF4K0RYMkhyRit6cldMUmdwWlhQVEFkeDFXK2M3?=
 =?utf-8?B?UjZZTWN1U2FHL3ZENlo1L1FCTCtnTXBVakRSQ1VwWFJJaEVROEd5ZlBKZEpH?=
 =?utf-8?B?VXZxOC8yQkxrcDA2RUZjYk80d0RJTGNvdXE2eDArQ0lFZENQTld3S0Y1eDBQ?=
 =?utf-8?B?QVhIQ0VjaXd1YmJ5cmJnV0R1TVAzTEp1MmM2YlB6NWFxV21rb0xxeHhVVlVr?=
 =?utf-8?B?UUM0MmpoL05DMmtnV0pQbEQwZG5PUTA3blBDalh0c2ZuL1lDYS9UM1c4ODFz?=
 =?utf-8?B?MG1VUE94VlRRb010TWNGTUttYXRzdVJkcGN4UTBnRkVWeEtRY0c5RlB2ekll?=
 =?utf-8?B?WWd2R0RqVlVRMlptcnhOZE04a0VGSm9CemozZG1RWWZmYUxWUFBWSFlOdkVs?=
 =?utf-8?B?djNyY2VmSFN1Y0tpbHZ3L3k4T0pqdnJOOGtOOFBySjJaaDErbjFnbXJLTlY5?=
 =?utf-8?Q?K+IvE09dlzEsLy3BeV80ViNCE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ff924a3-4621-4f99-3edf-08dcf4c9df7e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB7914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 07:51:45.6331 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4pwMXApkYoFm3u80xYL6ZIRx1DTZVL7UP/nWNQ0MCSydZZ1JbK4wTrUJ7QkmEGtH4nsyZ91DDJKQhkLnEDTTHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5920
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



On 2024/10/23 11:27 PM, Alex Deucher wrote:
> External email: Use caution opening links or attachments
> 
> 
> On Tue, Oct 22, 2024 at 9:27 PM Kai-Heng Feng <kaihengf@nvidia.com> wrote:
>>
>>
>>
>> On 2024/10/22 9:04 PM, Alex Deucher wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> On Tue, Oct 22, 2024 at 2:31 AM Kai-Heng Feng <kaihengf@nvidia.com> wrote:
>>>>
>>>> Hi Luke,
>>>>
>>>> On 2024/10/15 4:04 PM, Luke Jones wrote:
>>>>> On Mon, 14 Oct 2024, at 5:25 PM, Mario Limonciello wrote:
>>>>>> From: Mario Limonciello <mario.limonciello@amd.com>
>>>>>>
>>>>>> The ASUS GA605W has a NVIDIA PCI VGA device and an AMD PCI display device.
>>>>>>
>>>>>> ```
>>>>>> 65:00.0 VGA compatible controller: NVIDIA Corporation AD106M [GeForce
>>>>>> RTX 4070 Max-Q / Mobile] (rev a1)
>>>>>> 66:00.0 Display controller: Advanced Micro Devices, Inc. [AMD/ATI]
>>>>>> Strix [Radeon 880M / 890M] (rev c1)
>>>>>> ```
>>>>>>
>>>>>> The fallback logic in vga_is_boot_device() flags the NVIDIA dGPU as the
>>>>>> boot VGA device, but really the eDP is connected to the AMD PCI display
>>>>>> device.
>>>>>>
>>>>>> Drop this case to avoid marking the NVIDIA dGPU as the boot VGA device.
>>>>>>
>>>>>> Suggested-by: Alex Deucher <alexander.deucher@amd.com>
>>>>>> Reported-by: Luke D. Jones <luke@ljones.dev>
>>>>>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3673
>>>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>>>> ---
>>>>>>     drivers/pci/vgaarb.c | 7 -------
>>>>>>     1 file changed, 7 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
>>>>>> index 78748e8d2dba..05ac2b672d4b 100644
>>>>>> --- a/drivers/pci/vgaarb.c
>>>>>> +++ b/drivers/pci/vgaarb.c
>>>>>> @@ -675,13 +675,6 @@ static bool vga_is_boot_device(struct vga_device *vgadev)
>>>>>>                return true;
>>>>>>        }
>>>>>>
>>>>>> -    /*
>>>>>> -     * Vgadev has neither IO nor MEM enabled.  If we haven't found any
>>>>>> -     * other VGA devices, it is the best candidate so far.
>>>>>> -     */
>>>>>> -    if (!boot_vga)
>>>>>> -            return true;
>>>>>> -
>>>>>>        return false;
>>>>>>     }
>>>>>>
>>>>>> --
>>>>>> 2.43.0
>>>>>
>>>>> Hi Mario,
>>>>>
>>>>> I can verify that this does leave the `boot_vga` attribute set as 0 for the NVIDIA device.
>>>>
>>>> Does the following diff work for you?
>>>> This variant should be less risky for most systems.
>>>>
>>>> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
>>>> index 78748e8d2dba..3fb734cb9c1b 100644
>>>> --- a/drivers/pci/vgaarb.c
>>>> +++ b/drivers/pci/vgaarb.c
>>>> @@ -675,6 +675,9 @@ static bool vga_is_boot_device(struct vga_device *vgadev)
>>>>                    return true;
>>>>            }
>>>>
>>>> +       if (vga_arb_integrated_gpu(&pdev->dev))
>>>> +               return true;
>>>> +
>>>
>>> The problem is that the integrated graphics does not support VGA.
>>
>> Right, so the check has to be used much earlier.
>>
>> I wonder does the integrated GFX have _DOD/_DOS while the discrete one doesn't?
>> If that's the case, vga_arb_integrated_gpu() can be used to differentiate which
>> one is the boot GFX.
> 
> I think the problem is that the boot GPU is being conflated with vga
> arb.  In this case the iGPU has no VGA so has no reason to be involved
> in vga arb.  Trying to mess with any vga related resources on it could
> be problematic.  Do higher levels of the stack look at vga arb to
> determine the "primary" GPU?

Hmm, I wonder if all those heuristic are needed for EFI based system?

Can we assume that what being used by UEFI GOP is the primary GFX device?

Kai-Heng

> 
> Alex
> 
>>
>> Kai-Heng
>>
>>>
>>> Alex
>>>
>>>>            /*
>>>>             * Vgadev has neither IO nor MEM enabled.  If we haven't found any
>>>>             * other VGA devices, it is the best candidate so far.
>>>>
>>>>
>>>> Kai-Heng
>>>>
>>>>>
>>>>> Tested-by: Luke D. Jones <luke@ljones.dev>
>>>>
>>

