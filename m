Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDA5487A12
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 17:02:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D851311A8AC;
	Fri,  7 Jan 2022 16:02:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD4E11A8A7;
 Fri,  7 Jan 2022 16:02:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SOMKSGRh2CzV4PzftIjMAQvG+dlL3aFGPIyB5s6CtQTlmWFqvstLzFrft48nLVQmtRwIXOnzWawolQZd7PKLI0RH3tWGNYYGf+5U3A7T4L99Q/HSrLqvjj8CwA9yt2uXbUutBz0n9iqB5Y4i1Qlix1a9vA97b9sC37rV1Dvh4EomezDTknNsrd3L2UzfuEffkSiE/Bkw/wrGErLVaA/WZrC/PM8OD0n9xe5qn2QONnxjDbFCS9rxkqUylwLckEs5i7doPzdXHJw8/T2pjBLH+epnpAYZj1+hkp0tvC1/vite/hMgE8asliNtmLAxuLFLZaQ8foIixRfCp3ix+0WH1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5MwLMp01HBB+Z8/krrg1lnMxOuIOMWxqy3Ep6GctI1Y=;
 b=D7uVClIXwjgWFhd/VYsB7xo2/avxLZnP5ToX2qaYPIEq17mvUirEtzrqUk3YATRIw5lQHaXgaS3P2c7f19qrDrod4o3iKBL5ko4BkT0KefO3vVu+LSaFDmnfRlWqCeC4CElFQff7j34u6sBW9rC0p5sQiDv3essZO1a2iMWBPLT8Y8ieRZfgBqt8jjLCLq0qcozjnLEBSX8jZYeoVgVFijFJCtzvjU0ly1gXB758YqVBhKiuq+Y51BG4NlmUK8Vh0g9RjTq/3ZW1DQJwcoY4fKwfRBUBr2g4stbMTezg58bBVWRFZua3tIQeDaHouKUBkrOHza/QWhpjLceDWN3QVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5MwLMp01HBB+Z8/krrg1lnMxOuIOMWxqy3Ep6GctI1Y=;
 b=yEYmp3I3WYLwTs0ahP0xJ5ShXqDUXpO2NmwqxRsFNwzW0pVF3SmGVEt8N1hYZ1AUUqvt5KiGeHt/Yx7FKOkPPKMpY2nfHjHx7prB9jHK5D6k2kSULBsD3JY1TAdYS3VA0K5E8onW2IO33kJUlpQbxufLoaYcCzU/2p4ReHFWWDs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by DM6PR12MB3994.namprd12.prod.outlook.com (2603:10b6:5:1cd::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Fri, 7 Jan
 2022 16:02:21 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::5573:3d0a:9cfd:f13c]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::5573:3d0a:9cfd:f13c%7]) with mapi id 15.20.4867.010; Fri, 7 Jan 2022
 16:02:21 +0000
Subject: Re: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset protection
 for SRIOV
To: JingWen Chen <jingwech@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Liu, Monk" <Monk.Liu@amd.com>, "Chen, JingWen" <JingWen.Chen2@amd.com>,
 "Deng, Emily" <Emily.Deng@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Chen, Horace" <Horace.Chen@amd.com>, kaili.wang@amd.com
References: <20211222220506.789133-1-andrey.grodzovsky@amd.com>
 <PH0PR12MB5417F12B403B8181D5CD03988F7F9@PH0PR12MB5417.namprd12.prod.outlook.com>
 <cc8e296d-360d-9a2f-85cd-f47d55581e99@amd.com>
 <f5ba0a69-1cae-7d8b-bfe7-4e4400e9c32a@amd.com>
 <2dee6f65-9ca9-a332-7206-f24021fb4c44@gmail.com>
 <b5a31f18-262d-951e-2530-bdb0738e5033@amd.com>
 <20363a4e-b282-232d-34d0-14867bad4931@amd.com>
 <BL1PR12MB5269922395096810CC79E66D844A9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <23bebf13-c622-7c61-af88-0e0970b90389@amd.com>
 <a74c1198-6027-6a0f-55a8-24227c868704@amd.com>
 <c41f0294-fd64-cf16-8c22-994a7a2ed157@amd.com>
 <821c0b66-8c9c-9dff-a328-bfbc2233d4ef@gmail.com>
 <eecdf721-bdd1-0bc1-70c0-29bc8b844d68@amd.com>
 <b23a5387-7bb1-ef1a-82f5-a012cc530203@amd.com>
 <1f876e45-964e-3796-b7b7-24a7ac40fa90@amd.com>
 <a40beb3f-5ace-1932-8918-18c10339afdc@amd.com>
 <3dad24dc-b060-1739-a0de-0904e70ddaf6@amd.com>
 <a04dfafb-e65c-451d-e429-ae596d35a98b@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <b0711077-9f41-3b2f-5e4e-b8bf97f54809@amd.com>
Date: Fri, 7 Jan 2022 11:02:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <a04dfafb-e65c-451d-e429-ae596d35a98b@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0034.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::47) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1bb57086-4b74-433d-fe5c-08d9d1f71618
X-MS-TrafficTypeDiagnostic: DM6PR12MB3994:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB39942DE88C6C547A991BAB3AEA4D9@DM6PR12MB3994.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AXNQ7ad8JY4p3yE8GWe3Ap3GJ/pKGvMGdGE4Imk1BJYl2hf4m5NX7eEpuY9PWikUcUiw47/vKlBohdniKPo5ZmNyWIehJH8LPebv16ah5/LYqfIBCBhAFK8ImWV4kJO4qHq0r+97uQdO9WWBIik1KWQMTVS24XCtWA9KDFpFwRZDuu/IK2oapMFctUIvT0nAhqPUOZH3U/TtYuxnU4r5bGf2hPbd6C4QNgwqeVdLJmH/JY4AuhXO8FtlW29eAX+WP8LbGcdkwTt/yhIxZJlx9VOFHFrCwmFuTEtHgCGLDCA3We/mMg40ftn/g7qdzbckdy+XBYkRcR3PgHgKAKwxep8CoiZoVcCvw+yem1nNF7dQZndR1tO+9lHVs5Fsr69unSF8CktGrbvJNp1+BcbHDnUAEd3dVRSDFFUgKNCyC8iWAksWsc7Oid797P/ucRHVywPDADIMGZPIbJ4nIzH2X4WOAHVuH/Bg6m+SLGbPKsb9Tb4sa5u/DxBsHq2NUYxA+4X7L+GSM9SAqtSzuzOCMC+4IWwR+udu1c+/o0k/5QG2jcJOXheso9YmCEoFn0K3oMr1Hk/Qhj5taAMnXbUsZ3O0PYjSJAbuv7Ov04sOV1J7Sc0LiN2k4MDxhoDgT9oYs4SLSxFecp1tYO7wbu3FRHcNH0SYVDED3WX565765v74tk7XorbXSlFltEjpyK1AptYboqygSm+lUk/vyw+hqSIgUIwBuQC5W/t85yI8E+75yAE2TPSJNeZdW/Lenfg/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(6666004)(30864003)(38100700002)(86362001)(5660300002)(66556008)(6506007)(66476007)(2906002)(66946007)(36756003)(8936002)(6486002)(508600001)(8676002)(53546011)(44832011)(2616005)(110136005)(6636002)(4326008)(4001150100001)(186003)(31686004)(6512007)(83380400001)(66574015)(31696002)(921005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emU1Mis2bllDY0R5ZCtoRzJyN0ZibVRoL3hBQ3ErUVQreVQza0RDS2cxdHhu?=
 =?utf-8?B?Qjh1QUszVjRzYUY4aFIzTjJRajFMVGlNU2pkK0FjdFVndWlnM21aOHQvK3JF?=
 =?utf-8?B?ZzhZNnpGUWRDOVZaWTNaQ2lEMVlET2xnaTIva3dJdVJ1c09KU0o2eXp0K1JM?=
 =?utf-8?B?anBQOGJwUFlQbFJoRkkrMy8rQS81T21iQ3grK3NsRXBBNnRCS28rNkx3Y3l5?=
 =?utf-8?B?Y2dYcGtFNUxrV2VlQnJKMm5rYmVwV1h0QzVPL3Ywa255WTBMOUYrWjJXQnN3?=
 =?utf-8?B?a0t2eS9VNmZZT3Y3clFtNVNlNXo4eG92dEFvMFhBdVd1aTFGUTMyWkdYdDZB?=
 =?utf-8?B?eEp0dFlpOFh1aHdWcEIySXJPUGVseEdicDRnUDNnR3pWT3lIdmJtbllXRFk2?=
 =?utf-8?B?MG5xQWZ0MFRpczZQLzVUMW5tSnp3UnQ2aGNHWDRTZ0pXeHhFajRPKytSOFVn?=
 =?utf-8?B?ZFlYejVFRmJLS2RkYmtvMHRLMHNPdUxFdFhtNFg5R0FveG9ScXMwQmFmUjY4?=
 =?utf-8?B?WmtYSGdPeFFkSmN4d2dHaTZOd01xOFBqVUtCYVpkRTBXL2dpUXh0V3dyY3RX?=
 =?utf-8?B?blkxYm5SQ0kxR1l2Tk9Kd3pjejZ2b1EzVVdVWXZrdnZERzRuMk53NnZXQVZr?=
 =?utf-8?B?UlJLT2F5MG5qTjRyUGYzSVJsR2M3VlRrbmZUdTRCbkt2Q1pJMTZQZW5JV2wv?=
 =?utf-8?B?T3lPZTJqcmVMRmNQUVlXN2tFK3FyR3ZJanJBT2ovbi9Bc1ZMSXJQSENlc1VU?=
 =?utf-8?B?TTczWFE2Y3laQy9sK01HSHFBa05XMHVQWkNqT005ekhKSGs0Y1ZjOXhVbHVH?=
 =?utf-8?B?MG9QSzBDK2h4Sk5kK080OXR5S0pXWjFHYXdrUmFBYy95bzFJQmNmUVR4ZlJW?=
 =?utf-8?B?d3RpcS8xNHJvMEdVd2x5N09Vb1Y4SFB0R2tPSTVkN2hWYmRPWSs2OVNlL1J3?=
 =?utf-8?B?L2s1ajNGN0N3ZEFDVnNHazVGS2h2WUNad1dsV3lXQmJZeDl5R2pzcEpXa296?=
 =?utf-8?B?bVRvaEZWc2FwZWppcVZUZkk1Vnp4MWgrLzRaRUowVWhHUlo3TklCdkxTNEwv?=
 =?utf-8?B?UFc5RmxybC9PWm5GOVIxVkQ4dkpVd0dSZSsyTzYydTZ5ZlB3V3BETURKKzR6?=
 =?utf-8?B?cGZ2VEphYVBRNzhsTm44VlZEek9XemV4RXhEcDhlbXVkamwzRFhnN0JDMElD?=
 =?utf-8?B?eEo1TWVEQVFKTWl3K0haNXBvLzZIdW9VTysycjVVVm8zWm1SVzdQUURDWnhu?=
 =?utf-8?B?S0ZONFYrZHZMU1FYTTZJczRTcW5RSXBXZm1hdWViVUp4eklUV2VKK29oRXpC?=
 =?utf-8?B?ajVjNkJWUE9GdnNQdlNiSFF3ZEVxNE40cnV6d1Q4enRDdGNsb213Mkk1RFRV?=
 =?utf-8?B?emQ5UVRpMzRCVGVEc1hlUlJocWhLNTBMZ2xrellPQURVL2hRdmF3aS9KYkpq?=
 =?utf-8?B?MWZtdDRhYzJUVjJ1SmlhWVpWSWRFWnNKMUhIYmRVbC9nUHF0RWxHQjI1cXEy?=
 =?utf-8?B?QlU3MGlsNzk2OUtuQlVEQlBpSVVFNUdNOUtQMnJ2d29LREl0YnlqY0VnZ0sw?=
 =?utf-8?B?RmJqVHBFeFVMbnhydUU1RFUxVzNib05pUGhtOEdSZmRWdmZibFMzV0luNGZ1?=
 =?utf-8?B?ZnduY1hDVmNmTDZiNzZQNkRvdzhzS3BBc0xNbnkzdVdvT294emIwMS9GeXlr?=
 =?utf-8?B?OG1HajQ1UG9zZ0ZrVUtsT2xCMDF2R0UxOFpUUnBhUktBekNISzQxWk0zUmEv?=
 =?utf-8?B?MkpMQ0I4by9GN1cwN2JoUE5kK2srNVFlb2J6YTlXMHVVUk9TeGxsS2NoQUY3?=
 =?utf-8?B?TDhUbUhibHN5Q0Q0cDJhbHVRQ21XazZzV2VRbkhBbEtxcTdFTVV3dWpwT0l2?=
 =?utf-8?B?dnRxRnpjcStDQUUyNWV4ZGRhUzk4WFlKN0xhc0FTcnNEV1RYSW13dmlha3dn?=
 =?utf-8?B?QWlFYTNSeDJSZ3hDNjdISTFXejVKcEE5MjJSTXk3V09xUithb1NyWFJ2cWpE?=
 =?utf-8?B?SlQyb3BzM2h3ZldLZnpLRmM2NGlCKzR2SEU1S3JtNFkxQ3doYVl0bjBZQmdK?=
 =?utf-8?B?OVlRUzNFL3NqUmhReUVPZmFEcEpaWXEvSm04Skd0QUl3UlNXYkNDeVdJdFh4?=
 =?utf-8?B?dEdQVW5HL3ZGQndoVUNyVGk0Z3hWdVZwdVFobTVnMGhqeFVPNTdrUlJBRCt5?=
 =?utf-8?B?WW9EOVFsSzlPY0RFYmhaNXpxRmE4RFhqLytQdjUrVVEreUFMSStZWXMwdU1R?=
 =?utf-8?Q?+aAcDdep4RYEF+Tg/3wLA71ME2N4+Vc/CPLPSFG+9g=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bb57086-4b74-433d-fe5c-08d9d1f71618
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 16:02:21.1093 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2JhHCb629LZwkNOPD4x4zmcFfaYw3uTOig4oo09xbpR1DWEoloGk2eUdIK1YTe4iywWXi/0fkteKVBK+MCXY9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3994
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


On 2022-01-07 12:46 a.m., JingWen Chen wrote:
> On 2022/1/7 上午11:57, JingWen Chen wrote:
>> On 2022/1/7 上午3:13, Andrey Grodzovsky wrote:
>>> On 2022-01-06 12:18 a.m., JingWen Chen wrote:
>>>> On 2022/1/6 下午12:59, JingWen Chen wrote:
>>>>> On 2022/1/6 上午2:24, Andrey Grodzovsky wrote:
>>>>>> On 2022-01-05 2:59 a.m., Christian König wrote:
>>>>>>> Am 05.01.22 um 08:34 schrieb JingWen Chen:
>>>>>>>> On 2022/1/5 上午12:56, Andrey Grodzovsky wrote:
>>>>>>>>> On 2022-01-04 6:36 a.m., Christian König wrote:
>>>>>>>>>> Am 04.01.22 um 11:49 schrieb Liu, Monk:
>>>>>>>>>>> [AMD Official Use Only]
>>>>>>>>>>>
>>>>>>>>>>>>> See the FLR request from the hypervisor is just another source of signaling the need for a reset, similar to each job timeout on each queue. Otherwise you have a race condition between the hypervisor and the scheduler.
>>>>>>>>>>> No it's not, FLR from hypervisor is just to notify guest the hw VF FLR is about to start or was already executed, but host will do FLR anyway without waiting for guest too long
>>>>>>>>>>>
>>>>>>>>>> Then we have a major design issue in the SRIOV protocol and really need to question this.
>>>>>>>>>>
>>>>>>>>>> How do you want to prevent a race between the hypervisor resetting the hardware and the client trying the same because of a timeout?
>>>>>>>>>>
>>>>>>>>>> As far as I can see the procedure should be:
>>>>>>>>>> 1. We detect that a reset is necessary, either because of a fault a timeout or signal from hypervisor.
>>>>>>>>>> 2. For each of those potential reset sources a work item is send to the single workqueue.
>>>>>>>>>> 3. One of those work items execute first and prepares the reset.
>>>>>>>>>> 4. We either do the reset our self or notify the hypervisor that we are ready for the reset.
>>>>>>>>>> 5. Cleanup after the reset, eventually resubmit jobs etc..
>>>>>>>>>> 6. Cancel work items which might have been scheduled from other reset sources.
>>>>>>>>>>
>>>>>>>>>> It does make sense that the hypervisor resets the hardware without waiting for the clients for too long, but if we don't follow this general steps we will always have a race between the different components.
>>>>>>>>> Monk, just to add to this - if indeed as you say that 'FLR from hypervisor is just to notify guest the hw VF FLR is about to start or was already executed, but host will do FLR anyway without waiting for guest too long'
>>>>>>>>> and there is no strict waiting from the hypervisor for IDH_READY_TO_RESET to be recived from guest before starting the reset then setting in_gpu_reset and locking reset_sem from guest side is not really full proof
>>>>>>>>> protection from MMIO accesses by the guest - it only truly helps if hypervisor waits for that message before initiation of HW reset.
>>>>>>>>>
>>>>>>>> Hi Andrey, this cannot be done. If somehow guest kernel hangs and never has the chance to send the response back, then other VFs will have to wait it reset. All the vfs will hang in this case. Or sometimes the mailbox has some delay and other VFs will also wait. The user of other VFs will be affected in this case.
>>>>>>> Yeah, agree completely with JingWen. The hypervisor is the one in charge here, not the guest.
>>>>>>>
>>>>>>> What the hypervisor should do (and it already seems to be designed that way) is to send the guest a message that a reset is about to happen and give it some time to response appropriately.
>>>>>>>
>>>>>>> The guest on the other hand then tells the hypervisor that all processing has stopped and it is ready to restart. If that doesn't happen in time the hypervisor should eliminate the guest probably trigger even more severe consequences, e.g. restart the whole VM etc...
>>>>>>>
>>>>>>> Christian.
>>>>>> So what's the end conclusion here regarding dropping this particular patch ? Seems to me we still need to drop it to prevent driver's MMIO access
>>>>>> to the GPU during reset from various places in the code.
>>>>>>
>>>>>> Andrey
>>>>>>
>>>>> Hi Andrey & Christian,
>>>>>
>>>>> I have ported your patch(drop the reset_sem and in_gpu_reset in flr work) and run some tests. If a engine hang during an OCL benchmark(using kfd), we can see the logs below:
>>> Did you port the entire patchset or just 'drm/amd/virt: Drop concurrent GPU reset protection for SRIOV' ?
>>>
>>>
>> I ported the entire patchset
>>>>> [  397.190727] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
>>>>> [  397.301496] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
>>>>> [  397.406601] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
>>>>> [  397.532343] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
>>>>> [  397.642251] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
>>>>> [  397.746634] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
>>>>> [  397.850761] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
>>>>> [  397.960544] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
>>>>> [  398.065218] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
>>>>> [  398.182173] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
>>>>> [  398.288264] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
>>>>> [  398.394712] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
>>>>> [  428.400582] [drm] clean up the vf2pf work item
>>>>> [  428.500528] amdgpu 0000:00:07.0: amdgpu: [gfxhub] page fault (src_id:0 ring:153 vmid:8 pasid:32771, for process xgemmStandalone pid 3557 thread xgemmStandalone pid 3557)
>>>>> [  428.527576] amdgpu 0000:00:07.0: amdgpu:   in page starting at address 0x00007fc991c04000 from client 0x1b (UTCL2)
>>>>> [  437.531392] amdgpu: qcm fence wait loop timeout expired
>>>>> [  437.535738] amdgpu: The cp might be in an unrecoverable state due to an unsuccessful queues preemption
>>>>> [  437.537191] amdgpu 0000:00:07.0: amdgpu: GPU reset begin!
>>>>> [  438.087443] [drm] RE-INIT-early: nv_common succeeded
>>>>>
>>>>> As kfd relies on these to check if GPU is in reset, dropping it will hit some page fault and fence error very easily.
>>>> To be clear, we can also hit the page fault with the reset_sem and in_gpu_reset, just not as easily as dropping them.
>>> Are you saying that the entire patch-set with and without patch 'drm/amd/virt: Drop concurrent GPU reset protection for SRIOV
>>> is casing this GPUVM page fault during testing engine hang while running benchmark ?
>>>
>>> Do you never observe this page fault when running this test with original tree without the new patch-set ?
>>>
>>> Andrey
>>>
>> I think this page fault issue can be seen even on the original tree. It's just drop the concurrent GPU reset will hit it more easily.
>>
>> We may need a new way to protect the reset in SRIOV.
>>
> Hi Andrey
>
> Actually, I would like to propose a RFC based on your patch, which will move the waiting logic in SRIOV flr work into amdgpu_device_gpu_recover_imp, host will wait a certain time till the pre_reset work done and guest send back response then actually do the vf flr. Hopefully this will help solving the page fault issue.
>
> JingWen


This makes sense to me, you want the guest driver to be as idle as 
possible before host side starts actual reset. Go ahead and try it on 
top of my patch-set and update with results.
I am away all next week but will try to find time and peek at your updates.

Another question - how much the switch to single threaded reset makes 
SRIOV more unstable ? Is it OK to push the patches as is without your 
RFC or we need to wait for your RFC before push ?

Andrey


>
>>>>>>>>> Andrey
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>> Regards,
>>>>>>>>>> Christian.
>>>>>>>>>>
>>>>>>>>>> Am 04.01.22 um 11:49 schrieb Liu, Monk:
>>>>>>>>>>> [AMD Official Use Only]
>>>>>>>>>>>
>>>>>>>>>>>>> See the FLR request from the hypervisor is just another source of signaling the need for a reset, similar to each job timeout on each queue. Otherwise you have a race condition between the hypervisor and the scheduler.
>>>>>>>>>>> No it's not, FLR from hypervisor is just to notify guest the hw VF FLR is about to start or was already executed, but host will do FLR anyway without waiting for guest too long
>>>>>>>>>>>
>>>>>>>>>>>>> In other words I strongly think that the current SRIOV reset implementation is severely broken and what Andrey is doing is actually fixing it.
>>>>>>>>>>> It makes the code to crash ... how could it be a fix ?
>>>>>>>>>>>
>>>>>>>>>>> I'm afraid the patch is NAK from me,  but it is welcome if the cleanup do not ruin the logic, Andry or jingwen can try it if needed.
>>>>>>>>>>>
>>>>>>>>>>> Thanks
>>>>>>>>>>> -------------------------------------------------------------------
>>>>>>>>>>> Monk Liu | Cloud GPU & Virtualization Solution | AMD
>>>>>>>>>>> -------------------------------------------------------------------
>>>>>>>>>>> we are hiring software manager for CVS core team
>>>>>>>>>>> -------------------------------------------------------------------
>>>>>>>>>>>
>>>>>>>>>>> -----Original Message-----
>>>>>>>>>>> From: Koenig, Christian <Christian.Koenig@amd.com>
>>>>>>>>>>> Sent: Tuesday, January 4, 2022 6:19 PM
>>>>>>>>>>> To: Chen, JingWen <JingWen.Chen2@amd.com>; Christian König <ckoenig.leichtzumerken@gmail.com>; Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; Deng, Emily <Emily.Deng@amd.com>; Liu, Monk <Monk.Liu@amd.com>; dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; Chen, Horace <Horace.Chen@amd.com>; Chen, JingWen <JingWen.Chen2@amd.com>
>>>>>>>>>>> Cc: daniel@ffwll.ch
>>>>>>>>>>> Subject: Re: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset protection for SRIOV
>>>>>>>>>>>
>>>>>>>>>>> Hi Jingwen,
>>>>>>>>>>>
>>>>>>>>>>> well what I mean is that we need to adjust the implementation in amdgpu to actually match the requirements.
>>>>>>>>>>>
>>>>>>>>>>> Could be that the reset sequence is questionable in general, but I doubt so at least for now.
>>>>>>>>>>>
>>>>>>>>>>> See the FLR request from the hypervisor is just another source of signaling the need for a reset, similar to each job timeout on each queue. Otherwise you have a race condition between the hypervisor and the scheduler.
>>>>>>>>>>>
>>>>>>>>>>> Properly setting in_gpu_reset is indeed mandatory, but should happen at a central place and not in the SRIOV specific code.
>>>>>>>>>>>
>>>>>>>>>>> In other words I strongly think that the current SRIOV reset implementation is severely broken and what Andrey is doing is actually fixing it.
>>>>>>>>>>>
>>>>>>>>>>> Regards,
>>>>>>>>>>> Christian.
>>>>>>>>>>>
>>>>>>>>>>> Am 04.01.22 um 10:07 schrieb JingWen Chen:
>>>>>>>>>>>> Hi Christian,
>>>>>>>>>>>> I'm not sure what do you mean by "we need to change SRIOV not the driver".
>>>>>>>>>>>>
>>>>>>>>>>>> Do you mean we should change the reset sequence in SRIOV? This will be a huge change for our SRIOV solution.
>>>>>>>>>>>>
>>>>>>>>>>>>      From my point of view, we can directly use amdgpu_device_lock_adev
>>>>>>>>>>>> and amdgpu_device_unlock_adev in flr_work instead of try_lock since no one will conflict with this thread with reset_domain introduced.
>>>>>>>>>>>> But we do need the reset_sem and adev->in_gpu_reset to keep device untouched via user space.
>>>>>>>>>>>>
>>>>>>>>>>>> Best Regards,
>>>>>>>>>>>> Jingwen Chen
>>>>>>>>>>>>
>>>>>>>>>>>> On 2022/1/3 下午6:17, Christian König wrote:
>>>>>>>>>>>>> Please don't. This patch is vital to the cleanup of the reset procedure.
>>>>>>>>>>>>>
>>>>>>>>>>>>> If SRIOV doesn't work with that we need to change SRIOV and not the driver.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Christian.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Am 30.12.21 um 19:45 schrieb Andrey Grodzovsky:
>>>>>>>>>>>>>> Sure, I guess i can drop this patch then.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Andrey
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> On 2021-12-24 4:57 a.m., JingWen Chen wrote:
>>>>>>>>>>>>>>> I do agree with shaoyun, if the host find the gpu engine hangs first, and do the flr, guest side thread may not know this and still try to access HW(e.g. kfd is using a lot of amdgpu_in_reset and reset_sem to identify the reset status). And this may lead to very bad result.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> On 2021/12/24 下午4:58, Deng, Emily wrote:
>>>>>>>>>>>>>>>> These patches look good to me. JingWen will pull these patches and do some basic TDR test on sriov environment, and give feedback.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> Best wishes
>>>>>>>>>>>>>>>> Emily Deng
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> -----Original Message-----
>>>>>>>>>>>>>>>>> From: Liu, Monk <Monk.Liu@amd.com>
>>>>>>>>>>>>>>>>> Sent: Thursday, December 23, 2021 6:14 PM
>>>>>>>>>>>>>>>>> To: Koenig, Christian <Christian.Koenig@amd.com>; Grodzovsky,
>>>>>>>>>>>>>>>>> Andrey <Andrey.Grodzovsky@amd.com>;
>>>>>>>>>>>>>>>>> dri-devel@lists.freedesktop.org; amd- gfx@lists.freedesktop.org;
>>>>>>>>>>>>>>>>> Chen, Horace <Horace.Chen@amd.com>; Chen, JingWen
>>>>>>>>>>>>>>>>> <JingWen.Chen2@amd.com>; Deng, Emily <Emily.Deng@amd.com>
>>>>>>>>>>>>>>>>> Cc: daniel@ffwll.ch
>>>>>>>>>>>>>>>>> Subject: RE: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset
>>>>>>>>>>>>>>>>> protection for SRIOV
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> [AMD Official Use Only]
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> @Chen, Horace @Chen, JingWen @Deng, Emily
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> Please take a review on Andrey's patch
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> Thanks
>>>>>>>>>>>>>>>>> -----------------------------------------------------------------
>>>>>>>>>>>>>>>>> -- Monk Liu | Cloud GPU & Virtualization Solution | AMD
>>>>>>>>>>>>>>>>> -----------------------------------------------------------------
>>>>>>>>>>>>>>>>> -- we are hiring software manager for CVS core team
>>>>>>>>>>>>>>>>> -----------------------------------------------------------------
>>>>>>>>>>>>>>>>> -- 
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> -----Original Message-----
>>>>>>>>>>>>>>>>> From: Koenig, Christian <Christian.Koenig@amd.com>
>>>>>>>>>>>>>>>>> Sent: Thursday, December 23, 2021 4:42 PM
>>>>>>>>>>>>>>>>> To: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; dri-
>>>>>>>>>>>>>>>>> devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
>>>>>>>>>>>>>>>>> Cc: daniel@ffwll.ch; Liu, Monk <Monk.Liu@amd.com>; Chen, Horace
>>>>>>>>>>>>>>>>> <Horace.Chen@amd.com>
>>>>>>>>>>>>>>>>> Subject: Re: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset
>>>>>>>>>>>>>>>>> protection for SRIOV
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> Am 22.12.21 um 23:14 schrieb Andrey Grodzovsky:
>>>>>>>>>>>>>>>>>> Since now flr work is serialized against  GPU resets there is no
>>>>>>>>>>>>>>>>>> need for this.
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>>>>>>>>>>>>>> Acked-by: Christian König <christian.koenig@amd.com>
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>>>>>>         drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c | 11 -----------
>>>>>>>>>>>>>>>>>>         drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c | 11 -----------
>>>>>>>>>>>>>>>>>>         2 files changed, 22 deletions(-)
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>>>>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>>>>>>>>>>>>> index 487cd654b69e..7d59a66e3988 100644
>>>>>>>>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>>>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>>>>>>>>>>>>> @@ -248,15 +248,7 @@ static void xgpu_ai_mailbox_flr_work(struct
>>>>>>>>>>>>>>>>> work_struct *work)
>>>>>>>>>>>>>>>>>>             struct amdgpu_device *adev = container_of(virt, struct
>>>>>>>>>>>>>>>>> amdgpu_device, virt);
>>>>>>>>>>>>>>>>>>             int timeout = AI_MAILBOX_POLL_FLR_TIMEDOUT;
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> -    /* block amdgpu_gpu_recover till msg FLR COMPLETE received,
>>>>>>>>>>>>>>>>>> -     * otherwise the mailbox msg will be ruined/reseted by
>>>>>>>>>>>>>>>>>> -     * the VF FLR.
>>>>>>>>>>>>>>>>>> -     */
>>>>>>>>>>>>>>>>>> -    if (!down_write_trylock(&adev->reset_sem))
>>>>>>>>>>>>>>>>>> -        return;
>>>>>>>>>>>>>>>>>> -
>>>>>>>>>>>>>>>>>> amdgpu_virt_fini_data_exchange(adev);
>>>>>>>>>>>>>>>>>> -    atomic_set(&adev->in_gpu_reset, 1);
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>             xgpu_ai_mailbox_trans_msg(adev, IDH_READY_TO_RESET, 0,
>>>>>>>>>>>>>>>>>> 0, 0);
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> @@ -269,9 +261,6 @@ static void xgpu_ai_mailbox_flr_work(struct
>>>>>>>>>>>>>>>>> work_struct *work)
>>>>>>>>>>>>>>>>>>             } while (timeout > 1);
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>         flr_done:
>>>>>>>>>>>>>>>>>> -    atomic_set(&adev->in_gpu_reset, 0);
>>>>>>>>>>>>>>>>>> -    up_write(&adev->reset_sem);
>>>>>>>>>>>>>>>>>> -
>>>>>>>>>>>>>>>>>>             /* Trigger recovery for world switch failure if no TDR
>>>>>>>>>>>>>>>>>> */
>>>>>>>>>>>>>>>>>>             if (amdgpu_device_should_recover_gpu(adev)
>>>>>>>>>>>>>>>>>>                 && (!amdgpu_device_has_job_running(adev) || diff
>>>>>>>>>>>>>>>>>> --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>>>>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>>>>>>>>>>>>> index e3869067a31d..f82c066c8e8d 100644
>>>>>>>>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>>>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>>>>>>>>>>>>> @@ -277,15 +277,7 @@ static void xgpu_nv_mailbox_flr_work(struct
>>>>>>>>>>>>>>>>> work_struct *work)
>>>>>>>>>>>>>>>>>>             struct amdgpu_device *adev = container_of(virt, struct
>>>>>>>>>>>>>>>>> amdgpu_device, virt);
>>>>>>>>>>>>>>>>>>             int timeout = NV_MAILBOX_POLL_FLR_TIMEDOUT;
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> -    /* block amdgpu_gpu_recover till msg FLR COMPLETE received,
>>>>>>>>>>>>>>>>>> -     * otherwise the mailbox msg will be ruined/reseted by
>>>>>>>>>>>>>>>>>> -     * the VF FLR.
>>>>>>>>>>>>>>>>>> -     */
>>>>>>>>>>>>>>>>>> -    if (!down_write_trylock(&adev->reset_sem))
>>>>>>>>>>>>>>>>>> -        return;
>>>>>>>>>>>>>>>>>> -
>>>>>>>>>>>>>>>>>> amdgpu_virt_fini_data_exchange(adev);
>>>>>>>>>>>>>>>>>> -    atomic_set(&adev->in_gpu_reset, 1);
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>             xgpu_nv_mailbox_trans_msg(adev, IDH_READY_TO_RESET, 0,
>>>>>>>>>>>>>>>>>> 0, 0);
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> @@ -298,9 +290,6 @@ static void xgpu_nv_mailbox_flr_work(struct
>>>>>>>>>>>>>>>>> work_struct *work)
>>>>>>>>>>>>>>>>>>             } while (timeout > 1);
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>         flr_done:
>>>>>>>>>>>>>>>>>> -    atomic_set(&adev->in_gpu_reset, 0);
>>>>>>>>>>>>>>>>>> -    up_write(&adev->reset_sem);
>>>>>>>>>>>>>>>>>> -
>>>>>>>>>>>>>>>>>>             /* Trigger recovery for world switch failure if no TDR
>>>>>>>>>>>>>>>>>> */
>>>>>>>>>>>>>>>>>>             if (amdgpu_device_should_recover_gpu(adev)
>>>>>>>>>>>>>>>>>>                 && (!amdgpu_device_has_job_running(adev) ||
