Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1744D4F35
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 17:27:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B80A010E353;
	Thu, 10 Mar 2022 16:27:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2057.outbound.protection.outlook.com [40.107.244.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FFBB10E27F;
 Thu, 10 Mar 2022 16:27:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S2R/LF5sBgdbzTaj2z44NVuekjaqTWzMw5JCp2YEuZPS653KGwl0ppDtJqEN0kWUtG21DMlIWGU2ze8y0RhuTmF/kI6D8p2mIJgzF3JDeQubT6Uk4G+bHkHurL/wXJVU8WDQWk9eZwUfSg8P34oGnGM3zMdPXimkJfeVbUtjIAKazfEa36MO0oXZzuDXZj9iY1tnS8/+cwTEQW5jk7IgiAol2qeE7Ak6tkjekNeqtL63s83njzIYjhhoHx32tCHfm+GvElNjKy4VteyOo72oWYHO2uKwSwUxMNpDPUmgLOGEtqaJZ0Roew3ORGlRzCwieSb5PLK433DhYvVZ341WXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AW0wBRCmd84ndPGJrC4KeFrU3JV4St+2HSxcdYmNOjY=;
 b=BC8auGv6mdOEPT+GkCxHekZbbE7AcLy8texXLGu303fdB876VH6t1+3NSR4p+YDYyT9+aVjkuqApjRCeOVdw/b1GfaeT/O6u92S/8sZcM/N8J1Bm6b6AWCqS/OX0xZ8VAJprqPVT7FRp6X0EtlfuJDqGY7kNs+mEtylDSoH2c+6tS2NuADnp3zvfKXTY0m0GoBroYw+lgeGtcQ6DVVohIe9PoADOgSiV2GG5ngMQjpmI8a3YleSzYspexwrdIWp3Sa38fBnj+It80LIALgDPGPZhHDl+Rlfc0Zg3zBRDymyMSnwVQ2wfBfCOuFY3PDxf6DKonf3wOY4ZNVH9/Plw2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AW0wBRCmd84ndPGJrC4KeFrU3JV4St+2HSxcdYmNOjY=;
 b=bAZ4tft+6iOZFgOib6XlyibVb2AF0C+InfqteTPtNqio2mztPJYkI2DG0VE7wodeYZRb4c09QpgGMK8Td5vfkId6A8dgGOlpE5xFDghrcoXEpcSTACBpFYcEoWnp4pDcEOLZOuow5LSbazW/so/ar4wKJu+IqpTsfUKXfzXeQ+c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by BY5PR12MB3810.namprd12.prod.outlook.com (2603:10b6:a03:1a6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Thu, 10 Mar
 2022 16:27:30 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::90bd:5b12:918d:5703]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::90bd:5b12:918d:5703%5]) with mapi id 15.20.5038.027; Thu, 10 Mar 2022
 16:27:30 +0000
Message-ID: <5f6f6d7a-240f-f82d-b1dd-d3328ed75c07@amd.com>
Date: Thu, 10 Mar 2022 11:27:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
Content-Language: en-US
To: "Sharma, Shashank" <shashank.sharma@amd.com>,
 Rob Clark <robdclark@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20220308180403.75566-1-contactshashanksharma@gmail.com>
 <CAF6AEGsmectHSmW-Y6rf+AksXTkges7rukeiYd4yDm-xwdb1=Q@mail.gmail.com>
 <55629bd8-9fb4-2ee7-87f0-6c4c77cf06fc@gmail.com>
 <CAF6AEGsgDTphUm7ET+RuMmh2aTn-Ho5gJdUJ4kwJ3iOh7+HGvw@mail.gmail.com>
 <4f2b2329-3c57-3895-6732-875db2f98b5a@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <4f2b2329-3c57-3895-6732-875db2f98b5a@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR18CA0046.namprd18.prod.outlook.com
 (2603:10b6:610:55::26) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de59da3d-d983-412b-a938-08da02b2df48
X-MS-TrafficTypeDiagnostic: BY5PR12MB3810:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB38102FA8BBD16C2AD449D670EA0B9@BY5PR12MB3810.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rUiWyIJsyzJKdWjKvm5N03UV2KdTakj2PhWjIikyXBJzEajgvDme++baX6OLryMEe7h3Ia2dYveLO9loUiOFXM0qY0jOcBvj/mphyEiRF6NCon4DXfSzzIpYLzXK3ZQc8recQQa57fm42reCNvUaPb4RIISTf7GKmbHgqvdQDff2SIf8x5VKVT9R7xKCZZx6rq9YNthTE34WFM2Vjb2K/EUziUg/h4q/Ti7Pon23SweG585zZocqmse5WzubZDivI4c2kVnzS/H2BO4ioz97mx9yg88DdVjkLaPSCV6GjN93oj1bh+b8lLpxjzHreT7Pult/DTvBArej97mVs6NdOMXXPYtwazrUKEaLW9gPtrFn31l08rjIQEqOczAQrXxse6QIuDw2shKEJLV+k8YOFdNmTHbWsrllsAaBbAOgLwzTlBAibC2aX5CeTNwDeKIY9HgIn3r3Dp/3neMsE1LuzU1n7Ix3rlvIwNLjZ22+6syNINwcS3oZmMgSLz27zKAunEZXrhCG4Ai8/R++Gy9SAOdfuMMy01os1FrJFNoONoHtiat5nLD9lFVDwlkD846sNukHzuvhUVCGFjSsxBUWc+2HVC/o0pKzOoMIVbQIQZHMeZowTAF5dgMOf4Luzh7CdWDPghpXWwgPjfSxxsDZlXv2fJuy8WrbxjC25NtzPtVU7hiYXKjtpzvO+Rdnk/MiM4Y2zaRQDtGanZyEQcm7pBkIPo1Gl7oEklrW1FTqmiR4OLWzUDQYuQr7Uehg3Lcl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(8936002)(31686004)(110136005)(6666004)(6486002)(508600001)(44832011)(2906002)(8676002)(4326008)(31696002)(83380400001)(66946007)(66476007)(66556008)(6506007)(6512007)(53546011)(54906003)(38100700002)(316002)(86362001)(2616005)(186003)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1lvZmdZZzBpL0tPd0pMdExXajBEMWpnNFVicGo0UWJGSHJLOHNnNENYem1U?=
 =?utf-8?B?b09NdFFBcnRjaEVWMk9HWDl0eGtJa3pTbTJEYUxnRDlvbUVKS3JmRWY2QStu?=
 =?utf-8?B?ZWU4V3FZNlMrT3NkS0plNVdoSFJ3RnF5RVI2bE1ZOFJwNnFoVVVCT2xRbStH?=
 =?utf-8?B?WE5TOVRJdnpFL1k1OTFhWjN0Q1VZaDZGZkhINHBULysvZVoyb2NHZFFNeEhl?=
 =?utf-8?B?azZjT0JUcFFRMEk4aGhvZ2tqZDVQeTVWZ2duYXJiMzQ1MStIOXZzajFEKytX?=
 =?utf-8?B?N0tFUDcvR0NMNm9lYUM5cFlYSE11UkJRaUZzNUZ4V0YwMlZObHdndHd0aTJS?=
 =?utf-8?B?MVdkaGVndFB4SCt5MGcyVlZISHFIUUZjMk52WUlDNlo4TkpQTVJubjY4Z1JQ?=
 =?utf-8?B?OElHSmRYOGF0Vmo5R1RBeHdETnlybWxHdW43ajF0Z0pvYW5NTjNLbHh2UkF2?=
 =?utf-8?B?SzQzejZXL0lPZkpaQUR2QmpLVnUySk9lSmpBQVdJOTAzUndiL3J0d3NVUnVZ?=
 =?utf-8?B?ZkRkenJ3MnA4OS9hY3h0WkRvanU2R1R2bXlxbElqQ01yeTFRRXBPa0p0Umpm?=
 =?utf-8?B?cGVZR0dobEV2R1pkVlQ2ZitIOGFtc3JUMm5Jcm5EYVgvK0lZRFJ6cEtGamhO?=
 =?utf-8?B?cnE2R1BIRndzSjgzNkJUeUdIc092NkNtdmFZTlJTQ1pCL0lldzJHNmlydHk1?=
 =?utf-8?B?SkJGUHNqbW0wYTMyUUNkZEk5YmJDdUo2RGROc1ExQ2dDVXl1WG5hN1M4Y1N2?=
 =?utf-8?B?dWtVdVVjVGt2a0M4UHNwSW0xLzhDMFdDdmV5STZ1dSt2U0luVFdtaFFkOHFU?=
 =?utf-8?B?Z0dEWTcrbkNiWVNZWHdzSzNQUTlPd205N0ZzSXVqL21Kb2J2OUozL2Y3c0hm?=
 =?utf-8?B?UndSM1VYY3M4dW1lM01TKzlnOWN2aitwcE5uYXYrMmtJblNXT3hYemRBc3Q0?=
 =?utf-8?B?TmI2Y0VoNUYrYnRHT0VIbXEvKzJFcjJHdDVNM1lCRTVTMG40aUw4bzZLZG13?=
 =?utf-8?B?QmZ6bURId0l6R09FMzB3ZGhBTnBXUkc3VDdWWmZVMlJGY3B1VU5lUDROaXF6?=
 =?utf-8?B?NUcwMzExcVQ3RUowVG9BQ3FWSHJnMlcwSGp3V2g3SHJaQ3FJdTJDRm9OWmY0?=
 =?utf-8?B?Ym0xUjFHU0lqUlFVcEdvdjkwTFFLSldiR2NiemRpV2QyWnBXOGx3Q3dTTVZV?=
 =?utf-8?B?MGgyOFZNU0pLS2FvUmZoWS9QenAyMWxuL1RidTR6UXlTYlBaM3RZQmM3aHRx?=
 =?utf-8?B?eWdJemh0NVp3aGJKdGcvd3Y4Vjl6UDFuVlpmZ0svYkFtQ0hoV2ZZNjFraStI?=
 =?utf-8?B?d28wMUJscU5pWkFhQjV0UVFpUEZEL01tQ2pWSFpwbVVIanE3WTdqZlc3WEtv?=
 =?utf-8?B?ZzhwK3o0MnV6UjhqSmVKb1QwT2syVlA4YU5HS3V4TFVmNXhoYUY4MitaVXFn?=
 =?utf-8?B?bDkweEhreGFaZEpUTWwzZkRNcGFpbzNOSTlkMUdCMHIyaFdhVW03UVRlK09Q?=
 =?utf-8?B?MEdPWkRQVjF5QldzT0IzQmRsUTg3VnVKaitudlJxL1ZabVJlb21VRThZZXc1?=
 =?utf-8?B?UDlpZmlsT1JxUG13YXcxMzY4SFY3aHB0bENMY1pVVlBLMDBVZlNNWmdIOUtq?=
 =?utf-8?B?OElpcG05aFBOYTBNUUZnUkc2WDFkU1lIQWxsYys1WXFtcnB5dkNzTG9DejVH?=
 =?utf-8?B?WjE2QXFNcmVMbXJnZURHQnpDZFYvREFldEpVV05FVi92dGpCMm1kYWJYVUc3?=
 =?utf-8?B?QS9kMC9ueGFRa0wyeWFNb2hseW1hMmdFS21pQTIwbEVoWU9rWmZ0Y2p4YTB0?=
 =?utf-8?B?S1piamVmWHE0RGhCdFVVdVlsL01nWloxNUpadklLaUFsSjdySEVjb0s2SHV1?=
 =?utf-8?B?VHRZWS9wN3V6L3Z6OGgya3lzcGdZQ2NSYjNsd0c4STV4bzhCZmpvTUVTWlZ0?=
 =?utf-8?B?cXFYaVZVR3NJalBwRVIyQUxkMzVUVVl0OTJqdytENitSdk9sZGpKb0Vlcjl5?=
 =?utf-8?B?Y2VvK1phaXh1d0pWUW1rV3JPbTFjeUN5UGVrM3hHUW1RemV5dHdIRlZRanJz?=
 =?utf-8?B?a2RxdTZCREE5QnlJWnFGVlhySTV6ekJaN0hlYXdZejNUOERETmdZVEtKMXFO?=
 =?utf-8?B?cHlOaVpLT0syMzFYN0JpU3FBSHpZNXdLMDJ4ancwamMxZGRNaGsrQXhNUDZL?=
 =?utf-8?B?VGkxNVNyL2FDQnJXc0Q5MFpYSDNOMkRHN1NWOXVaQUt3bkI1NXZsbzZ2Q0sx?=
 =?utf-8?Q?glzY15saOgAYXTAyLE+HtqlSHH1Y1WXXXX9BrJMCbA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de59da3d-d983-412b-a938-08da02b2df48
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 16:27:30.2049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ALKZH2PfjyaB2A0dafozEhF/zMhmkr/jTwOdB5FICmimCbOyUcRukNgiRQ5613EHoXAfxm0frHXp+X4aevDiVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3810
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
Cc: Rob Clark <robdclark@chromium.org>,
 Amaranath Somalapuram <amaranath.somalapuram@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alexandar Deucher <alexander.deucher@amd.com>,
 Shashank Sharma <contactshashanksharma@gmail.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-03-10 11:21, Sharma, Shashank wrote:
>
>
> On 3/10/2022 4:24 PM, Rob Clark wrote:
>> On Thu, Mar 10, 2022 at 1:55 AM Christian König
>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>>
>>>
>>>
>>> Am 09.03.22 um 19:12 schrieb Rob Clark:
>>>> On Tue, Mar 8, 2022 at 11:40 PM Shashank Sharma
>>>> <contactshashanksharma@gmail.com> wrote:
>>>>> From: Shashank Sharma <shashank.sharma@amd.com>
>>>>>
>>>>> This patch adds a new sysfs event, which will indicate
>>>>> the userland about a GPU reset, and can also provide
>>>>> some information like:
>>>>> - process ID of the process involved with the GPU reset
>>>>> - process name of the involved process
>>>>> - the GPU status info (using flags)
>>>>>
>>>>> This patch also introduces the first flag of the flags
>>>>> bitmap, which can be appended as and when required.
>>>> Why invent something new, rather than using the already existing 
>>>> devcoredump?
>>>
>>> Yeah, that's a really valid question.
>>>
>>>> I don't think we need (or should encourage/allow) something drm
>>>> specific when there is already an existing solution used by both drm
>>>> and non-drm drivers.  Userspace should not have to learn to support
>>>> yet another mechanism to do the same thing.
>>>
>>> Question is how is userspace notified about new available core dumps?
>>
>> I haven't looked into it too closely, as the CrOS userspace
>> crash-reporter already had support for devcoredump, so it "just
>> worked" out of the box[1].  I believe a udev event is what triggers
>> the crash-reporter to go read the devcore dump out of sysfs.
>
> I had a quick look at the devcoredump code, and it doesn't look like 
> that is sending an event to the user, so we still need an event to 
> indicate a GPU reset.
>
> - Shashank


Another point I raised in another thread is that it looks like we might 
want to use devcoredump during ASIC reset to dump more HW related data 
which is useful
for debugging. It means the use client will have to extract the pid and 
process name out from a bigger data set - Is that ok ? We can probably 
put it at the beginning
for easiest parsing.

Andrey


>
>>
>> BR,
>> -R
>>
>> [1] One small change to allow-list the drm/msm devcore dumps was
>> needed after a privacy review/audit of what is contained in the GPU
>> devcored to ensure it does not contain any PII .. for CrOS on amd
>> devices I'd be happy to walk whoever deals with amd CrOS devices
>> through the process offline.
>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>> BR,
>>>> -R
>>>
