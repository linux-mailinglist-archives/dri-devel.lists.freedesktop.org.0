Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 674228B3A44
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 16:44:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2AD110F068;
	Fri, 26 Apr 2024 14:44:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SLN2wKnP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2089.outbound.protection.outlook.com [40.107.93.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C54610F036;
 Fri, 26 Apr 2024 14:44:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bl9Zd+ZBFRvN2dlDQAKcsyn/6Kx0PnHaVrIvVIHwvHgf6QuPTR/n2cbRCZBhKzYzWT+VM4NUtI7INbUErN5oMVXMSwkrFuZwHLMOe5MF9p1xJhtNwyc9qHJgx//LOQwXQ6ke7hy+tiFCr4Zb6yVp09KOtlSby6nB+Y1JKSFl4Al810yw4AGeLSjRwnWOWTWgWLxaV3k+Lxuag4Tc2b0tPP+X3L4kc1r6adtVpf+PRBpWhU2u9S3SbQSpvVeuS9W8bREcYvgKNhYs58w8rze+fRYRC/5wn97h04c7BNM93zE1vSFhaA6ond8691fHZ4oyWZoPTGYH2f+r6W6uKVn5Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MaHQK4jPRopLTPquycmUtACRsE+iV3juUqQ3n5qjCCs=;
 b=MgeVLJktTmIu4M/FTsLnFxtsFwMpejEr3ITeUKtdwhzgkns6n3lmvfTOObbxACabmps1+V+CZgQYuKoYi1ltIsX4B6DtWCljurpVHWe89HN9ppS80DFe+yy22AYWx2juxfF1ij1ENr/f1edqAeeYyNArjqZWCh/A2UriA6i8+nla4NbYMx94MFrc17EiwadIw9o5dekYf048Q8YcNnEGJCKGoC54Nak7bcUx4eZXoKNHEx4cKiY++HZNXx5UFioYF5QYB+PR/VIJ9fmWq4hZTUn4ls582a4kdTQ/QOcPpfVk9J3Wvw5qEdATh6OxUhtDXPTiwaxdLL99c+K7xy0RKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MaHQK4jPRopLTPquycmUtACRsE+iV3juUqQ3n5qjCCs=;
 b=SLN2wKnPJGArnFiyT6X6qlStGrfXdubko04EqQHAVuL+CMnIpjiTghlu8SPz9234V9SGnEYbxA8knqjV6U2CMhRNPTP03bZgfUU0CrWYa3XYY7wPWIh1gIiYR/zcYahPE/mah4/FI9PDNn3UPQzni+oZlWfqeR/7/Qv2uvHI06w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ2PR12MB7846.namprd12.prod.outlook.com (2603:10b6:a03:4c9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.46; Fri, 26 Apr
 2024 14:44:22 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.7519.021; Fri, 26 Apr 2024
 14:44:22 +0000
Message-ID: <b3df87ac-b985-49b1-8ba4-504cc6b548f1@amd.com>
Date: Fri, 26 Apr 2024 09:44:19 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd: Only allow one entity to control ABM
To: Gergo Koteles <soyer@irl.hu>, harry.wentland@amd.com
Cc: Hamza.Mahfooz@amd.com, Sunpeng.Li@amd.com, amd-gfx@lists.freedesktop.org, 
 ckoenig.leichtzumerken@gmail.com, dri-devel@lists.freedesktop.org
References: <8b2aef9a51b97ca69cd5bc590f9fa535da5af4e4.camel@irl.hu>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <8b2aef9a51b97ca69cd5bc590f9fa535da5af4e4.camel@irl.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR08CA0024.namprd08.prod.outlook.com
 (2603:10b6:805:66::37) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ2PR12MB7846:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ae4e7e0-aed8-4b09-be50-08dc65ff5c4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TElYeGtWbWxPWGRWK1k2SHFuaVNNL2VuVDE1VTFsV0VGVFh0bGdDVzY5U25p?=
 =?utf-8?B?YUttd3c3ZzhNL0JZMDdEMmlpcklYSWZmd1JTSHVOWk5ycDlBSjFuSEJPNngw?=
 =?utf-8?B?RHNkTnEyMlFVaFVuaXBmQnM4VkhCUVhISkVpU0p2YnpHYlNkbzFHVE9MZVRZ?=
 =?utf-8?B?YUpHcWpQRmk1NGh4aUFBYUkwbUJlVVVKSG5GTldaVUZEbzFpOGJIRWJObTBt?=
 =?utf-8?B?cjE1OUc4MGhJL2k3cEJ6TlZ4cHZVNWpYamhXR1h5MUhPMU5FS29SSGw2Mi9Z?=
 =?utf-8?B?VUJ0OGpPUjY1TTgrQ1RhbFlETE4ya2x2OVdLNEIvNkROWGd6TVNaRHB4ZHMv?=
 =?utf-8?B?L014MjlheTNianEyUHJaaW9WeWRVMlpmUWpzM3NHZEFTWVZUL0QrNnhGUWxZ?=
 =?utf-8?B?MTNzQzBGeGg3dGJISEdEc3hKbjluWXc0T0YzbHFMUTdIS0xGSHRxRmttWkFP?=
 =?utf-8?B?RStuL01DcUdGYkZQaXhLYnYvY1k0RDhWVWJ6RHYrS2J1a2R2YmJHQ0pKYkxi?=
 =?utf-8?B?ZXZnc3Y4ZzFidmphdEJvb3hIdnhnTWtZMjZyMTRDdFArOUhBTlVDdlU5M2d1?=
 =?utf-8?B?aTFtTm1mcWpicVhyMWdMeDlnM0k0a2VCUW96OFZRYzdHbUhoQnd0eU5ZVmpa?=
 =?utf-8?B?bGpwMUpwbHlQUmt6NDZPajBvTWdGc09MQXh0S0twZnl2ZWFaYzVlOG9FVTQx?=
 =?utf-8?B?L2hrbVZac04rTm1qNFBsVWFLcDdZQlZTZEkvVmxTZXJZSkNqcEpWSEpscGVH?=
 =?utf-8?B?Y0lRcjRYaEVEbjVGMEFQUnpuMHVCUmtSRGNEc3kzU3VDa2pIMmhsUUcxVFlF?=
 =?utf-8?B?TjlRMldubEpBTGR3d1dFVlJ2QXpJb0tlMzk3cWFudnNJb252L2ErQXh1dnpL?=
 =?utf-8?B?MzdId3ptZytKaUFhREtUWm5RQkljM2xJQjlSbk1OSXFHTEE5NG9hL0lpeVN3?=
 =?utf-8?B?SDBLandpOTFvbHpTVkUweVZ5MTBzYVJ6dmZVYk1OVnI5T2w5MGpBYWdEd1oz?=
 =?utf-8?B?QmVENkxYdEp5WXNSN052aFh1MFBpTUsxNkdSZFdvbWhtRGNsMjFHSnJnU2xY?=
 =?utf-8?B?MkozR1YyUjFPWFFsRHRwWVBlbTMwZUQ1b3NSYUFSbFgva25JS3hXYWZXVVhs?=
 =?utf-8?B?ZUY3MERXSjA5cnRFeHFteGxXQzl0RXRkOGxzNnV0aUVUSmNBRTBZM3FBQ243?=
 =?utf-8?B?clVJcVR2YkQwaXpnR0F2bWF2TFZ0YVoxckVGKzRCbHQ1L0FzYWpta3VhclN0?=
 =?utf-8?B?bjhuSGxrdUdNM0hBWlQrYVFOTUt6dEFLc3J2bHpDaWUybjJ5cHdUYUh3VzdL?=
 =?utf-8?B?SWFCNHdueFNXbHkrWFlSWGU2M2F0T3Q3SjNrZWRuWEorU0tSbkNNeGhORDhP?=
 =?utf-8?B?dWt1VEF2RG5GOS9uM3VFL1E1a3NnMVFmYTFOZTJFS2pFUkt3QVlxbUM1dTNM?=
 =?utf-8?B?VTBVc3Y5MTBML1Bhb3lrbW5lSTg2YS93OW9CWVVvR2JzSVd3Y2h2UUwrUDNi?=
 =?utf-8?B?NmpqV0UvMmFyWVlBNDZaTFNNQjNrRXN2K0ptMW5jc29YTHRYKzFSbVFVSXdS?=
 =?utf-8?B?MWlZYmpWcFhQT1JpaGZaVjl4aWFTakZOWjZYOFRXUlRUSFE2WjB5MU93WW5n?=
 =?utf-8?B?eW9UdFFDM05lYUdEa2dDN1lHaUxQTEl1aW1qTTR6STZERE9pU05mSUZlZ3di?=
 =?utf-8?B?SEovVHoxbzR2N1lJVFAvU2t3ZnN5NEJ4amhoWTc5ay9ZWHBFOVRZTTVRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmR2QTdBdXJSZVVFeUJxMjlnNDJxMi9HVnRMMy83ZXVJTHh4YmRDODMxUndH?=
 =?utf-8?B?dUdJTFRHNkZ5ZmhRZlZuL1hrbkFDYWxsUjJRNGU0aXgydWV3enNpUkt3cjNM?=
 =?utf-8?B?RXVSZGVod0FHWldkamM1T2Q5RXkzT1l0SHlSTHdlckJucHliS2JnNUliOEd3?=
 =?utf-8?B?V2U0R0tzdkZwREY3cE04b3pBNm12c1N1OWYvYXhCQnRrVStsYnVnY2NyVmZ6?=
 =?utf-8?B?dG5tdXF1K0UwbTFEb0VUYWdrbFZjQ0NaSWw3VnErald0M3lnc084NytUR1Zo?=
 =?utf-8?B?bjNIaW1GS3lYZUIzYnNTb094YXBNY0JSVWw0TUlsdTZYQ1Q0NWcyZlRJRXJi?=
 =?utf-8?B?RGJMWFFUSnhLcWVSdGgreW1wSTJQN2dZYVp3b3FHMHF2RkNwMUdrY2xJUStx?=
 =?utf-8?B?US9yRG1PK1hRUmtSR1BPa2QxdXZ3R0xOdFJEWThuQ3pSN2M5VDFwZ3djeUpS?=
 =?utf-8?B?U3ByN1hFd2ozbE1TZEVEV2VQN3NSUkxlc0I1TTRRZ2ltYzJLUysrL2dJZEN4?=
 =?utf-8?B?VWRMSUNFamJuVFl6Vnp0R3B3cWRtU05GYzBjbUdWek1xaGJjbmEydTd6ZXF0?=
 =?utf-8?B?R0FBSlVjdmx2UmQzaUdscDI5OWN6ZDZSTDdodFMrRjFOVy9FaXhWZlJYODVm?=
 =?utf-8?B?cngyQmhMT1Y2WGNKdHNRekhsTm81T0IyUXFmZHhqMnU1L2xpZWtnRTBCMjBT?=
 =?utf-8?B?WUtYamczWEZIMnA1c21YajBFUzNLamUwZ1NGVGxaTU1mbHRmb252QU9VVFow?=
 =?utf-8?B?N1RmeHU5RzFiRmh4RThnQ1dVOERrUlBqQUJacnMyMHJnNnNRR0dRY0RrdTJp?=
 =?utf-8?B?YzMyYXlIUG0yWDJVWGdCWnNBYk1sYS9wVHFucEdSZmR6cUNBb3ArcGxVdnZv?=
 =?utf-8?B?RTl6REgzNm5ZVURtTjFoc29LMVdVaGt5ODZDSkN5c2tjRG0zUFpPRlRndFFo?=
 =?utf-8?B?RkVtOEQ0T29SK2pNcng1YjdUTXdHVWwwNndtWU5zQ1F4V0VBYUhoWHBWYm9T?=
 =?utf-8?B?RU9QR3dmVXcvaTlNV3J3MkhYc29aMjdqdWhpQm5pUi9xdCs4Y2l0U0c5Y1Vn?=
 =?utf-8?B?UkVac1RZaUJlN1kycHROMlVJa0xiaGV3dlBjemFVRkRsd252dk01dUcvYzVN?=
 =?utf-8?B?Z3RqenJBQk1nTkJlKzI5SmNaZUdaYjAxblFXMHFPK2t6OExSc2lsajg3b0Uz?=
 =?utf-8?B?QXBnV08zRnpFOWhldXRsYVJVb2VnZmhzVnFPaVNjY0RLMDdwcUJUdE1RMDFX?=
 =?utf-8?B?U0N6aDJYYTVWeEt4NlRsQWVFcVVoeEwzNFBLcjdvUEFYaWpNZFNRMGRkMG1B?=
 =?utf-8?B?bFovM1pRdmhuVnQ1YWs3RHZRdU44V1VDSGkySmdtRmpPRVd1bDVHd2FBTUxr?=
 =?utf-8?B?L1Y3MzhwaC9HcUd2UFVBTXQ5eXlFM1VEaURmRk5JNkFHMldnSXhNa1c1Tmpn?=
 =?utf-8?B?NnFMaHVzLzZxVVk3SGg5THNTKzJsSDNFOVhTZnM2Ym9KcnNzTzljRUxXa0ZK?=
 =?utf-8?B?NEZyclhtRGYyR2JKbFpYM3dhT0psb1N6eUY4d2RqaHcwVnJ1K3l6RjdXc21T?=
 =?utf-8?B?OWsvZHcrTmVzaW1OM0F1bExYRjYwakUxWStKNGpJeEVMUjNhVnZwaDBhMytK?=
 =?utf-8?B?YmNpcWRPMHNFTjZMRmFvdVQxZStwcU4rQy9IZUdLWWJVY1FCa1Z4eXlMcXNs?=
 =?utf-8?B?TWl3ci9URE5nRkZNYXVPbDZsT2U4OFBJdWJOcVV4Vzk4OU9YNHA1WXFlajhP?=
 =?utf-8?B?c0JEeUNCby96SWFBNUR2SXFVeWpZK2lsZU5KcmVONXYvdmIzRklBeUttbkZI?=
 =?utf-8?B?OHg0WEUzblQ5cTZXY0tieTlaMjJMU29EMkZrMW5BQTloSHNZY3ptazlHWHhC?=
 =?utf-8?B?YS8rTlpySFp0TnZOKzFvR3V3a2tMQzVDbFlsUVI4ekMxWHlTUE0zZXdLY0ND?=
 =?utf-8?B?K3FOcEprb3RIeksveFk5U1pMQ0RleDg1OXA5Y0FYUnpsZ2haN1ZESk0weVNn?=
 =?utf-8?B?em1rekF0QmpjZnNSVWJERjFSS3IwQndnOGtNa3RkM2VjeCszZmNZNkZDR2F4?=
 =?utf-8?B?aE1xZUo2ajFTS3F1eld6a21iN0h2NmlYWFdENEM4c1VONHBBdENlTDRjTGZY?=
 =?utf-8?Q?/j4DixEs7UJs7JyXk1iGR7OU9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ae4e7e0-aed8-4b09-be50-08dc65ff5c4a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 14:44:22.1771 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UbvLScHWBi9zoKXGQV8abhzkb6f3ucJpwqEEnNxhurzGO7yf+wCWPe8W/jGmwCiGUuKc15LAwiBeAxTUqHGUzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7846
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

On 4/13/2024 03:51, Gergo Koteles wrote:
> Hi>
> 
>> ABM will reduce the backlight and compensate by adjusting brightness and contrast of the image. It has 5 levels: 0, 1, 2, 3, 4. 0 means off. 4 means maximum backlight reduction. IMO, 1 and 2 look okay. 3 and 4 can be quite impactful, both to power and visual fidelity.
> 
> I tried this with 6.9 and it looks weird with an OLED panel used with
> dark UI settings.
> The dark is no longer dark, everything is brighter.
> I turned this feature off with amdgpu.abmlevel=0.
> 
> Best regards,
> Gergo
> 

Would you mind filing a bug with the details please?  This was something 
that was actually explicitly checked against an OLED panel.  ABM 
shouldn't be applying to OLED today so this very likely points at a bug 
somewhere in the stack.
