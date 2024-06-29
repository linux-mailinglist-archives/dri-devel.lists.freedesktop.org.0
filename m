Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B59AC91CE30
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jun 2024 18:46:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02E8110E04A;
	Sat, 29 Jun 2024 16:46:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VTzQBBWL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2069.outbound.protection.outlook.com [40.107.243.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC17710E027;
 Sat, 29 Jun 2024 16:46:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gzA9siBBJkW/V2uWg/6oPsGt8b7QUbm7RlbRrCjqZlglnCj759fuqvRkXLKWFV0pk3TW93PRQynGVEYuv5dpMF5TyFRv71+V058E2PWaCE0+U4GRzY+OCG4CrhRkGvkwYx3FjAXSx6b8Dqm7I7tiHPUR8T9HUHyT8SOqicsdjQ2iwMdX7zjencAYClfeqnUl8ew5Okd6HA6i7xKnkhGyiNiCI9GrYvEm3kCV7ul7y5Z6aQhXZZrUmGUMjcjWy9dLBWX3hQNN/sNsnzu6LcNngMQreS4SY2m8mumjWF/tecfp1JtZ340pWgIxOkH46F5WlgAtNkj/4by5zVPc3bXc7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yBopiIZ9frPVLG79hv7d2AzQoXwC6WFrci8lIv+t7ig=;
 b=IXlgWYGV+tjm+1mKIy1DliEB/OmCdNXsPnx+tCHvFymJ2sddCItLEuPQPwX1uBZp/92pPRMrtp44zJkjCdCwNOVXogv6URMXqlVffRkQ66iTlsCmWB6pOhIELQcy/SLmTFoPUYrZm4+W8tkdHN0XJ14e0EMzfdsYSgJcIFtMWFpjdAU9//Dq0X827PSTnFGMtOVVmCnzFa8CrkbCrYf1ZxpRFi3j1LZPprtyOmIhZccDOTF006wt2zAJEtxk4rjcvAXGP/zF8rGmWiJq98TTGy9FGaObmXC01iVx4JnQftOj2bVOprIXTNQchHMbUCz+K1neHBip2C6d5HT+LVPyLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yBopiIZ9frPVLG79hv7d2AzQoXwC6WFrci8lIv+t7ig=;
 b=VTzQBBWLzx+Apg2GU+LXTaBE57scwDCsSoIyMJ/JOUepskuUsx+boAYbcXTry4BfBXHGJWNUiHjg3V0m30mUMOk0LaKv6lVwXzo1wp6gv6fdLcV1TESO645HHwxsk0QlGXIkpEvyVV0SNWfnZ9D+e/8h387tePIVXQznnLHYn70=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW6PR12MB8733.namprd12.prod.outlook.com (2603:10b6:303:24c::8)
 by MW3PR12MB4459.namprd12.prod.outlook.com (2603:10b6:303:56::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.28; Sat, 29 Jun
 2024 16:46:50 +0000
Received: from MW6PR12MB8733.namprd12.prod.outlook.com
 ([fe80::71a6:a9da:c464:fa2e]) by MW6PR12MB8733.namprd12.prod.outlook.com
 ([fe80::71a6:a9da:c464:fa2e%3]) with mapi id 15.20.7719.028; Sat, 29 Jun 2024
 16:46:50 +0000
Message-ID: <ea465a40-f673-42b1-8b1c-a2efb20cd562@amd.com>
Date: Sat, 29 Jun 2024 10:46:45 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: 6.10/bisected/regression - commits bc87d666c05 and 6d4279cb99ac
 cause appearing green flashing bar on top of screen on Radeon 6900XT and
 120Hz
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 "Mahfooz, Hamza" <Hamza.Mahfooz@amd.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
References: <CABXGCsNptxsQO=5=qi-JYiFX=rX8Ok5inK80Gn0qrUFWbtBGng@mail.gmail.com>
 <CADnq5_PDxJ8O1JUQ9RBYRFB9G1WZJos05ZAM4jUKuPBwPxjNkA@mail.gmail.com>
 <CABXGCsNN9LwHc2x2AAEH=5UNwpvkWkBqRYz3OP8MZ6Woy+HDXA@mail.gmail.com>
 <b6c440ca-e63e-429b-af41-5f27d4b8b2a2@leemhuis.info>
 <CABXGCsNoFfMn7LaqqFgEPg-ECyUPN=f=SXVrFi=GZk6c69-Gqw@mail.gmail.com>
 <CADnq5_PDSkr4hOHJmb1J30UC0a7sXsm5-TPkEmjzffMK_A+7ug@mail.gmail.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <CADnq5_PDSkr4hOHJmb1J30UC0a7sXsm5-TPkEmjzffMK_A+7ug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0810.namprd03.prod.outlook.com
 (2603:10b6:408:13f::35) To MW6PR12MB8733.namprd12.prod.outlook.com
 (2603:10b6:303:24c::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR12MB8733:EE_|MW3PR12MB4459:EE_
X-MS-Office365-Filtering-Correlation-Id: 363d9241-a81a-4bb0-e1b1-08dc985b12dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QUNwazZXT1NwbnA3T2dHdmI1Q2tuSytmSDNSd3A0emZWT2VEZ001TkdOZVdX?=
 =?utf-8?B?NGMxWjI2NmhzcHNobG1iMWQxeHpMSmhyVFU1ZWRWNTk1VDFvbHFBM3ozR1FE?=
 =?utf-8?B?LzZWdDNLSVBCRGVRRUpGOHZ2bjJQVElKN2JXak13eTBSTFJRTzJlblFTSkdV?=
 =?utf-8?B?KzJxODdtYzlTVktsVXZJV3FWZXRmZk5jK2NNN0cwOHBjZjl2WkwzaEsrQTZC?=
 =?utf-8?B?cU1lTDJ2eWZXVDBNTVpsZTZNNlMrOU1PU0dFZHFUb3JFK2NqMjZ4VlFHanl2?=
 =?utf-8?B?dnZNaC8vYTJRNGc3ZjhQMkVNTUlCdU1uNjN0L2dQK090NGVnUjhyQTA5SG03?=
 =?utf-8?B?NHZvTW9TVHBYTDZnckcvMUJKNjlwN2FOVTJTZXZ1NlY0UFBsSEZLS2p2Q1J5?=
 =?utf-8?B?Mi84ZVNZSHZYS05HMlhlN09TQkQwM1NlbUdvWS9hUm1ZRG1Nb2YyR21NbmdD?=
 =?utf-8?B?WFRmcFJoQ2hCUFg1ZGRPL0p4azJxcVMxYWVVdzNwZ1VPK3VzS00yU04vdThZ?=
 =?utf-8?B?ZmYrVUl3dXdDYVlWSC80aDZCMUMwSWd0eHg0NFVraU10V1luUXZrdDk4T1k2?=
 =?utf-8?B?YnJKYkdvemltZ0ZkQjFFWmVXME45dGF1QTJjVkV6T2I2RGV6K3hGWnRGY0wv?=
 =?utf-8?B?MmtMVHJJcjdNcDBwcmpNM0sxWXFySC9NZ1pYN2NkZTVZYnJPcUd3bzJWUmd6?=
 =?utf-8?B?SzFtRk9neFI1OHY0eEV3Q0I2Y1gvcGErdmw4ZUNuODdBTjVsNStLY1BBNTdX?=
 =?utf-8?B?ZjJzWFNsZlhjMk9nVnB5WWNzSzB0bzJKd1dpQnZvRWtYV2R4Z3BOdUdkUXJP?=
 =?utf-8?B?ZEdZT1hoZ09XUTd6N2ZEeDhNQzQ0Q0FLdUw2QURCb3QxcUV2K2ZOMXJCS2pt?=
 =?utf-8?B?N1R1V1FkYWpYTXBjbnRiS2pWOVJpcklxd0dOY0dLYngrbTg2V1hCR2YxaXR4?=
 =?utf-8?B?T3JuWDhXMzdWLzA4VlZNeGtvaGNZQ3JaNUFMS3R1ZmZzL1Q3bnZLWHVpY0lM?=
 =?utf-8?B?SmY0WXNNakhTVmVGUDUzRnpoVUZoUVJXeEtTNE84Ukthb3V3SXByWjRFcXVR?=
 =?utf-8?B?Y1VMZ1ZnazJRL0Z6dWFJVFg5R3dxeDg1dFI5UkVOUlA5aXR2bUlrSWRrd01a?=
 =?utf-8?B?Vy9ENzVBSFpGSmhJR01EakZabDhua295eEhiaWFETjM0Q3ZvSFl4ZldUVEs3?=
 =?utf-8?B?Yk5QSWlMS3Yyc0QyZWR4Z1RkRGJ3N1F2Rk14OWJTL2RNV2hsbnh2TFhpYnZi?=
 =?utf-8?B?cjhzV2drY290UUVtN3JjU1VmbXd1R0NKcUFvSWI1S1dKVXpzMXZxREk1dk41?=
 =?utf-8?B?K3hxeGZJcmV5ZjByMWxoazllTjNjWHFsaE9WMHFDRlFsTC9mWkorR2cyM0NV?=
 =?utf-8?B?UjNybHpkamRYZHBLM1dXZk1sWTZFenJWSVNiVUI3NUR3ZEloQzdma2pJL2l0?=
 =?utf-8?B?anJDNVV3UGNtNkdXYTVSN2oxUnZmcDdXYlhia1lPNUppRTRvMDR5TmJoNVh2?=
 =?utf-8?B?UXZSRndDMThQek1UNzJIK2laYzJHOC9LVmVTQ0dBL1dsU2RjNmZZNzd3ZXZu?=
 =?utf-8?B?WXZ0YmVaSnlha3Fnb052QnMxam5VS0lrd2RqelhxLzBZNmp6R0xHc25XSXhJ?=
 =?utf-8?B?Uk5LSGV6clA1VEY0ejJ4Rmp2bzRsWWZqVi9QelRKZUl0UFBZcEdzdmtTamhj?=
 =?utf-8?B?R3ZZeXA1ZGFMZlJCV1BwbXJhcERmaWR1KzZUVjhXTlArcHgzcTYraHJnczFW?=
 =?utf-8?Q?kyP/P5r27cpSb5OMz0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW6PR12MB8733.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eE1oWHVRbTdiN0dDT2xyK0w4Rml6Ujd1MzArZytjWnJod1RaRWZvbGpRYUxY?=
 =?utf-8?B?MkN5QVpNT2tOaVRZTjRrYW1zM0RSMG9nNDk1UXBtR0tVUmJMcFJjaE82MlZs?=
 =?utf-8?B?VHFxb3U2VnlmeTUzTzlzWUt6cGxPajgway9nVytXSk4rMUV3MWZhMzNDVzYw?=
 =?utf-8?B?TnlqNlVIS3pBRktBUEZmTUIrOHVpUnBFdjUvcnk5RjVoMU1TRk1jb2FFS0M1?=
 =?utf-8?B?T0MzSE1MWWp5OUJLcGx2cEd0U3VzMmYwbDJ4VzFVQjN2RkxPMUdQckR0aFpR?=
 =?utf-8?B?dS9UNmhiWWNLZEVpajZUNVZrZzA4QzlWU0h2UXFyVitzaHFTN3cyRit1OTlF?=
 =?utf-8?B?aFdySDZWMkNOaHBEWGkra3UrNDZNODRTOTJjYTNNTkRTZXRLTUdYeTJmYVU2?=
 =?utf-8?B?UTVTbStUenluTm1iNnFkSXNYYmVzQi9NUC94OFNzSkl5VVdXdW1VUkg4UE1S?=
 =?utf-8?B?NjJRWnVHTDF5QkR5NXZwaHI5S3h5NThQQjExbXRNK2VkdmZkZ1dkWDkwZUVy?=
 =?utf-8?B?eFg1Z21Fd2RicHArb1UxRjVjOVh3RCt5dklXZHlnckh5T01BMGE0NW51TjFR?=
 =?utf-8?B?di9nNmtNMXl3OE1EMC9URitETGFaYlhDdytjWGNlejBmUHlmUlNjZ0EwRWF2?=
 =?utf-8?B?ZjhkOHdoUFordTdMZEpMTHRmU0Vwd01NU3R5elR5ZGNCc05xZkkvWEwxendV?=
 =?utf-8?B?cmF6VHgzVllxbFQ4a1hhUTFZeXJDbXZpQ3pKUE5WZjMyMWwzRWdnOVlncHpB?=
 =?utf-8?B?YUlXbmpwYy9YcU1WSGtkeWhCR3JyY0VidFBJSllzN3M3OThzNGJRT2VGNFla?=
 =?utf-8?B?N2pHTTQ5TG5MZ3JQM1N3Ny96b0w2eVNEYjNJdXJQSVFSa2t6STloQ1J5VnNC?=
 =?utf-8?B?WENYbjE5M0lveTRTcnJDS3NoY1c4aUtOVFRDZElxbG0vdVZlbXpwTWNWd0l3?=
 =?utf-8?B?WmNRck9kMEFqTVZZRHRwN3BPem5kRjhLWjF5TElweVhxUVNWdFIxWDJsTEk1?=
 =?utf-8?B?ZWtqcXg2ZGd6eGxOSlQ2WjJhRnJJNmF1Zk00ZjBCbVI1R1VkL0trMDJpOVdm?=
 =?utf-8?B?MWtKSXRieHdTd0FkeFhMU09XemV4b1lRa0RGTGhqWktSY29jNXdpdE1BZUg2?=
 =?utf-8?B?UUpUd0IxTGp6cXFodFZteStsUkVKQTdyaENNc3h1WFVwYlZUb1VyMnY0NHQ1?=
 =?utf-8?B?SmUxZnhkMExRUTNEK0srVjlYZW1VL3B5OEtoeUt4Y1dzd0JvTklvdWtOT2F6?=
 =?utf-8?B?bzVmTFNHTHRmOG5QcG1xTTJhdXFtVHZWTjhjdVhMNEtZL0J2cjVVSmhsR08z?=
 =?utf-8?B?bWx5MDROWUJtTktaTWVWMFBKY1V3Ui9FQVE2L2JtTnc5WnFhMzA3YzNBbits?=
 =?utf-8?B?eU9GeU5haGJaUktLRnkwZy9xcmRJNTdnckRWUVJtSjFXemFOcC9kb3NTbElS?=
 =?utf-8?B?M3hFZktmc3ptc25BQVpRM3FSQ05GZlg4cDI0eHhUcDVvL0xZMlNGUWhaQTQ3?=
 =?utf-8?B?QThuL1IyRGN5dmlqZk9yZGlucDduVHBwR3VBUi9NY3J0VGFnay9ZNVh4eTFk?=
 =?utf-8?B?VlBsbldPaGlxQ1BYSmJEQTNNT0MwUllJSnJFQ3VuM3YzbFJSV3FXOC9IanMv?=
 =?utf-8?B?WmMxOExVZmVXSm1mdUdmZnVEc2h5NWtNKzAvRy9acXNESU8zaW1xSUo2YXQ3?=
 =?utf-8?B?UXY0TGJIYXVqa216eHNBdmJ0bDlQNVJYTGdVNDVMQVRQODhBSkwzY0dUNUNl?=
 =?utf-8?B?QUluTXlBTU1WQzVSQ2xpcldVdWs4aXdkYzBaMDcrNmZqWVhRQjhqY1FZMThZ?=
 =?utf-8?B?TDRDMVFxQWpJa29ucnVLdTArRGRMZUMxaUJjbkxCVGJDRG1BNkdxVFlJK1Bk?=
 =?utf-8?B?RTZOZzMrOXpISFJoQ0pqSHhEcVRhT3F4Mk9maDVST3NIREFSamtmSklJMlBD?=
 =?utf-8?B?OEhXYUx2czNVZ0ZKODlRdVF1SkJPUjVkOXhJMGN0d05QNU10ZGE2bzcrMGI5?=
 =?utf-8?B?N29vVERhN1FRUkt4MGV4TGt3M2trUG4ybk5IS01jRUtMemhTWmp5SkhtSFYy?=
 =?utf-8?B?RGozckFrMkpvdjBPTm9kQ1Vjb1JzenRudUloT2dsdmlyUnY4VHFuMmhiZ1B0?=
 =?utf-8?Q?+EK9JpGDCNLFj33f+FVumMHxd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 363d9241-a81a-4bb0-e1b1-08dc985b12dd
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB8733.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2024 16:46:50.7003 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wtPp27AbkVYrtrT3ZcMspxc53K07heZ3vQz9nRAf9BFJ3m/4EH5I2INpEKHDKOZ+0YyrYmf8ybfmvuBEq7K36w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4459
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



On 6/28/24 9:19 AM, Alex Deucher wrote:
> On Fri, Jun 21, 2024 at 6:45 AM Mikhail Gavrilov
> <mikhail.v.gavrilov@gmail.com> wrote:
>>
>> On Fri, Jun 21, 2024 at 12:56 PM Linux regression tracking (Thorsten
>> Leemhuis) <regressions@leemhuis.info> wrote:
>>> Hmmm, I might have missed something, but it looks like nothing happened
>>> here since then. What's the status? Is the issue still happening?
>>
>> Yes. Tested on e5b3efbe1ab1.
>>
>> I spotted that the problem disappears after forcing the TV to sleep
>> (activate screensaver <Super> + <L>) and then wake it up by pressing
>> any button and entering a password.
>> Hope this information can't help figure out how to fix it.
> 
> @Siqueira, Rodrigo @Mahfooz, Hamza any ideas?
> 
> Alex

Hi Mikhail,

I'm trying to reproduce this issue, but until now, I've been unable to 
reproduce it. I tried some different scenarios with the following 
components:

1. Displays: I tried with one and two displays
  - 4k@120 - DP && 4k@60 - HDMI
  - 4k@244 Oled - DP
2. GPU: 7900XTX
3. OSes:
  - ArchLinux kernel 6.9.6, Gnome (no changes)
  - Ubuntu 22 + latest amd-staging-drm-next + latest firmware, Gnome

Anyway, I could not reproduce the issue with the below components. I may 
be missing something that will trigger this bug; in this sense, could 
you describe the following:
- The display resolution and refresh rate.
- Are you able to reproduce this issue with DP and HDMI?
- Could you provide the firmware information: sudo cat 
/sys/kernel/debug/dri/0/amdgpu_firmware_info

Also, could you conduct the below tests and report the results:

- Test 1: Just revert the fallback patch (drm/amd/display: Add fallback 
configuration for set DRR in DCN10) and see if it solves the issue.
- Test 2: Try the latest amd-staging-drm-next 
(https://gitlab.freedesktop.org/agd5f/linux) and see if the issue is gone.
- Test 3: In the kernel that you see the issue, could you install the 
latest firmware and see if it fix the issue? Check: 
https://gitlab.freedesktop.org/drm/firmware P.S.: Don't forget to update 
the initramfs or something similar in your system.

Thanks
Siqueira
