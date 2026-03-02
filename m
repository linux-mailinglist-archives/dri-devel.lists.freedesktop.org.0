Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAp3IwL+pGn3xwUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 04:03:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0277E1D2968
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 04:03:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13DD610E41A;
	Mon,  2 Mar 2026 03:03:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZV9JmAoi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013043.outbound.protection.outlook.com
 [40.93.196.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D78E10E41A;
 Mon,  2 Mar 2026 03:03:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s+0FYB/NPTqdqIVkzesc5AB6cHBbP7PcUoUCd0ke8QhKlBrTHnR3drFXo1I4iqYHsbStTUZSoc8McIgvyMZXes56RgC+Ov4GRArTXJW3/Vf8FE0LXcLbhQ0IjJ3LstRaiJKHXbH6n8C1GU/hVxc0AMcq4vfMR/7uXyESIK6XZ7Otjsihoa6hllLh+L9DLdrQvJFGdsFK6NVScyqQtpPeuQ3Q0SYdxqPn9Qhb6eW0/W7EUIMgPX6kYXSaBH/l36EDDiVI3DFoVV59EDX54lRBGgw3LBscShjtHnjHoZV8pS1DShZIrsb5oi2bOzdEKVAf5MCtbnyqUol/d4dDwcj6FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HMYqeksp5RYlsbttCe476FZtLp3GB/SlZZe9QHWHc7Y=;
 b=oWejpnkOJWCNd7wvD0bE22VydeBICQO7gy96fptb90dFdhLDrXzD/iftcA3vlTRgNM+o4RBEgK3PdN92v4QGkULdYE2qnYjyGPlLQ69O8Tvi0vlHpb6u+xv6+sXvFB5P74SAZ4Sdli+nAaVCy/ZYWG6Zkx6KCk4sznADfl67nto934iz70aT3MZv0c2YVDCoPpbd1lm1zwe5bNP7z/g8wegKdPcayMIwk+TB8RkzYa50Q5hGEqcft3ML91/Za5pfsBq6AxUSQ+wWRcUJeIAW/dXgEMEgEF/mJkoWbqOXiEkNpzPgxD5HApjYVw6vsrSrpgg8npKeMiADjkuX6DwQ6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HMYqeksp5RYlsbttCe476FZtLp3GB/SlZZe9QHWHc7Y=;
 b=ZV9JmAoiHn08SjWCSXyyW6uoOP3zTOKrA5qhSDxWY/Frbf0vIvTfJDXivpPEoHtEPD2xHh5sR/3894w58bWsY1qhlI7lCxpHWnY/e9D992pTh1vXoOemfesCOc1PR4TM9pA+TbyTgzWOY+ZlV1z0TaZ9oaE+vvLvEVplrGIF3GdhzWGbZxHvbZmRaJVVJBFJtnDMgQjAIo9V/a6M9qr+Ueg0FCcAshR4K9j1RrhR7j2EY1Chpxc8KqS8RJOUSTy2gmT0Uw4OJPhZK8XbfvRLzISIWZMQk2oxKhamJps3FBJ0HaBXNeYMrpsVc8ERstwVqtti4D1owp2C085M632+eg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM6PR12MB4467.namprd12.prod.outlook.com (2603:10b6:5:2a8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Mon, 2 Mar
 2026 03:03:21 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 03:03:20 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 12:03:16 +0900
Message-Id: <DGRYNXISKYQR.2V6CH8PKCLUDY@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Benno Lossin"
 <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/4] gpu: nova-core: gsp: add sync and async command
 queue API to `Cmdq`
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
References: <20260226-cmdq-locking-v2-0-c7e16a6d5885@nvidia.com>
 <20260226-cmdq-locking-v2-2-c7e16a6d5885@nvidia.com>
 <a3b7a5c3-9689-4700-981e-d94bd2b5091d@nvidia.com>
 <DGRXSDSDMUOI.31863U05DR3VA@nvidia.com>
In-Reply-To: <DGRXSDSDMUOI.31863U05DR3VA@nvidia.com>
X-ClientProxiedBy: TYCP301CA0033.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM6PR12MB4467:EE_
X-MS-Office365-Filtering-Correlation-Id: 444ab37e-1e95-4c24-1aef-08de7808429b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|10070799003; 
X-Microsoft-Antispam-Message-Info: rUphXf3pV0kX+/0maALSQeZEnC4/wCTQI8xmIdtEqRVptdr7GV29SYSbYBSBujoZ8FRVCtiqTH+8y2g/Duj0Cl+5/RcfXjPpOVSlr4XkMVJGvUxd4YBjS6BACqGIYZQ0O5FtGZ10lsXTt/4tMlJRI5sP7TdHI+PFzNtKl/uND6Hfzy+qaexkzpVyv+Q0cZJeKWEKnz+4DC9uppGEQBn0+KHggP7EApLzv9+2so6yt3PnajslkuYI1Sk6SsmmWTAJUl7Rp1H5oDWWQP3Qah+hfDsqyLu1DjDldkEQvqr6N5ZyH5rPSsV+6Uc61RHwvUUd/VFiwRcqtNb5+l3a5keIaAFteQNJSzhZ0HUSWuTu5zCVNIhw7/WnKKxWAhYoEyX63UFEk7VzOuaLFqpfIWro3FNWY5MGVhJEB1YNIGSpw2s7m6yQVEKimjAtZPG+8wOJrvYEjmI41cu2EXYqOY8peUMD9zXGn0cMMYc1aCkk1BY3rqkbvozWc7ZKKSc8WRMocHsEq3V9PraCsvFBmWRRwbZv0t2nx0yq22dZg90NYbRNfaDuuWBOvJvKLdXmvGILbnqp0VfSZcvDFUnMvF7IY+PmkfD4teyY8+yzktZs//grA+4rgLk8ibVlUBDIMmttx2mqSU485U2BRf6jHCUjvFv3mdhcGSd2vNtObxS4Y4NGt3aqTzZMmLjPMJ3YzwzlwOEDhuX3qkxyWUci1SoycJLcqS57aY31/zofZ+SmsUY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWtLSWM5WUdXY3VpeG91ZWFEc3paREowc0UwNkprZlg0OGZHQ3ZWWWE1djNj?=
 =?utf-8?B?b01sdktLcFRGMkNVTVVBTGxOQnk1Qk1JSys3RlJ2dW9jMWZjc0psNHk1UXRz?=
 =?utf-8?B?SUppZnhXYzlzS0VKVEZMazJMOVJEZDJJZG50T2xzTVZqRlJ4ZmJiWTdRTCtB?=
 =?utf-8?B?SFZwYUxyZ0dGQ1ROVUNiYkFrd2ZCWkdEQWRRdStvR0paeU1OQXhwejB1WFp1?=
 =?utf-8?B?UnFoOEhGeGtkMDh3WFpDelJ2VHNlbUQ1SFA2cFkxQllMV1dyK2MyRTlRMWtl?=
 =?utf-8?B?U0ROejB3ZGJGMUw4Y1dtTW5uaTJsS1gwZ0JXb2xpcmZsM3J3c0hqSkUyWDRC?=
 =?utf-8?B?S3A2M1NBc3JOVXdZMmJ1d1RnUTVuLy8wc0pJOWgvanRnbUo1aWUySHV5Z0JU?=
 =?utf-8?B?MDBXKzNJVkVCVkdqN1hwc29ETUNMVEkwV24wS2U1TWs4NGtaamY0VEI2TEZr?=
 =?utf-8?B?anEzMGpXUmcxRHlZNTJnNytTSlF0NWZpTlV0ODFTQ3BLcmRvUjF0MFRRQUJG?=
 =?utf-8?B?YisxMFVKVTVKWFdLYWZjSEI2WlZOUDR5S2tkb1pHOTNlMHZqYStOanVjRWJI?=
 =?utf-8?B?ZUZSNmdBYVRRMnVPZnlaMmZFd28rUXlkM1JqTmpNQTIwUG9kR0VCMnlMUTFm?=
 =?utf-8?B?OUVrSGJnYnVGUDcwUFR3Vy82Z1dMV0tPQ0ZpZncva01iL284TC96Zjh1TGhK?=
 =?utf-8?B?eFNNREo2UDNXMzc3dnllRWFOZUo3eFJ1WHQrZForNEhKeUNGcWNBN2dNWkZK?=
 =?utf-8?B?ejBrQUVPeDFsQkluaW9aOTRKdE1kMUIxN2pIMWhvamZ3WGd6ZjdVdTJXWmYx?=
 =?utf-8?B?anY3NHRITisyU0J0RVorTk9BbDcyZFVxVTd1aVptZ1RYT3lWRHVuSWJoaGJH?=
 =?utf-8?B?YjAvSVVuQ1VUUjVYa2FqekNUTXh0amN3YWtuazJNdEs0ODM5KzhnWGszSVZ4?=
 =?utf-8?B?amZvbkl5TjltYk1FaVZsUU5MQzlkR3F4eFk5Syt6eEczR3VyS2VvVTl5QjMr?=
 =?utf-8?B?VlJ0MmlmTWVydDdKZ25iUldWWHpSdlAxRWZ5OHRoN1VNaTI0eG9LMDRraUFK?=
 =?utf-8?B?ejFqb0c3bkh1U3pqeW5hcDBETzU2Q05zMzlmeDVjWFByTGIyVnR5c0VPcmpQ?=
 =?utf-8?B?bFY5ZGk3ajlJVWM5Zks3dzk5cVlxOVhsdFdNOXZPdVN0SSt3LzdtK0lNcm8x?=
 =?utf-8?B?Y2puTXVtN3A0Q013dVJIZGNYTFZrbVF0ZCsxSnc0aVlEVE03bFpQbzBSajdK?=
 =?utf-8?B?VmxhNDhVVnIxQnpvTUR5OE9EMDloaksrZWRvdThtT0lubkx2RmxndG54OVda?=
 =?utf-8?B?V2pmOWpFVjRnRFpSSUdmU2V3d2tZWVo2a3RtZ2xhSzJka2dRd1VoWGlDbTdN?=
 =?utf-8?B?YmdDMU0vOU1WRlRJdVgySDJLaGM5VHdHa0JLVkNPSEphOGY1bDFZdWMrWW5V?=
 =?utf-8?B?VVZXQVhXNEVTOFcrVExOczBaZVgzTWhvc3luRTFxSHZObTUweHRnWG00N1FD?=
 =?utf-8?B?OUwzNDFUcjg5L0RlZk43alFFaUQ3YkczeXR6alZrVVcwMFhmMWZZVmVpVjRu?=
 =?utf-8?B?UnV5WTJTNHhTbEh0Zjdxcmh3NzJZSDBScUVqNnhYUjllU2JibXFHNG1tWlVQ?=
 =?utf-8?B?MTJOSzNRRTQ0RVFPVG05STUxam5KRVZqV2JuYlB5R08vY0dDNFdYRG1HTzIv?=
 =?utf-8?B?b0RTTXBleHFLczNhTzNzV3pQU0lCS3hySXg1YUR1ZVd3aGY3SzUxWlVlNUhw?=
 =?utf-8?B?K1pIdTFQejE2dlN0UVJhRE1pRWZCUFBER2RtWlBxSDZXb2Rac0xqd3BBUUJV?=
 =?utf-8?B?UUdTQy9pakhYTHpqOUlBMUlhNzdJWDI5clgxS1ZYTlFHVTVJYW9nMFZOblB4?=
 =?utf-8?B?ZEEyd2hpU0xRcVQ3anExRHc1Q0VRbWVtRVc1cndicTdZSkpPR3BsNmUrZHh2?=
 =?utf-8?B?OUtDL2hPMjlJUldBakJPSnJ4YjJDU2FGZWVDdXVEMTM5L3FGNFBEZlE1b3dy?=
 =?utf-8?B?bFBic2lmL2Z0d1YyaEVrdGpzaGN6cmxVOU9OUThjbFdDd243WEsveUwrR3ln?=
 =?utf-8?B?dU5rY0dsWFBmVmVRYVRYMUJ4Y3licWNVSXZJQUhWSXJjL2F3Q0ltRWM1ZFZ2?=
 =?utf-8?B?R1JqWXF0enFPNUJ4S2kyUGNSakJTcndBNEp2Z1FsYjhPK3hVRUlibmZSMldG?=
 =?utf-8?B?WUt0SFlnRk9ReWsrNzhUeGd6NGVXZGg2Rnpkc05xVTVGdC9RK2hxNnVrY0ov?=
 =?utf-8?B?ZldPQXBuSTNOTFZnWkNlN1FyOGpXaWhsbFRBSm91TGV2VEo4aWJpMzRsbU1L?=
 =?utf-8?B?VDUwTitQOU10SGQrdG0xM1FycEE5bEpGTTBGWnFydHBDWkhGTFFvSXNNalQz?=
 =?utf-8?Q?xOSx+oAcJaoYQ/9QuPlFNy1e2nQtkyaHdQ9JIvG2zHz2j?=
X-MS-Exchange-AntiSpam-MessageData-1: kt1IoQ5WeLQGNA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 444ab37e-1e95-4c24-1aef-08de7808429b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 03:03:20.8600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qv3e4dSQwCedpeQkuq9aUHI2NQQsTlnI/BeGg8s3bsOlu7i0RVKV43u8UJzvDBEeHJmHoAkrddeRIeBNMvKFEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4467
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[nvidia.com,kernel.org,google.com,gmail.com,ffwll.ch,garyguo.net,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim,nvidia.com:mid]
X-Rspamd-Queue-Id: 0277E1D2968
X-Rspamd-Action: no action

On Mon Mar 2, 2026 at 11:22 AM JST, Eliot Courtney wrote:
> On Sat Feb 28, 2026 at 3:11 PM JST, John Hubbard wrote:
>> On 2/26/26 7:50 AM, Eliot Courtney wrote:
>>> Add sync and async command queue API and the type infrastructure to kno=
w
>>> what reply is expected from each `CommandToGsp`.
>>>=20
>>> Use a marker type `NoReply` which does not implement `MessageFromGsp` t=
o
>>> mark async commands which don't expect a response.
>>>=20
>> ...
>>> +    /// Type of the reply expected from the GSP, or [`NoReply`] for as=
ync commands.
>>
>> Hi Eliot,
>>
>> The following does not need to hold up your patchset, but I want
>> to bring it up somewhere just to work through it.
>>
>> The sync/async naming that GSP RM uses is a little bit "off". I
>> spent some time discussing it with them, and the problem is that
>> sync/async is a concept that is somewhat independent of whether
>> a reply is expected. Usually, sync means a blocking wait for a
>> response, which is not necessarily required in all case with
>> GSP RM calls.
>>
>> The naming would be better here if it reflected simply that
>> a response is expected, or not. I don't have great names for
>> that, but "fire and forget" works well for what we have so
>> far called "async". So we could do create a convention in which
>> no annotation means that the API has a response that will come
>> back, and some abbreviated for of "fire and forget" or "one way"
>> added to the function name would mean that no response is
>> expected.
>>
>> Again, I don't think this has to happen here, because we can
>> go through and rename later, no problem there. But when I saw
>> the sync/asynch and remembered the very recent discussion, I
>> figured I'd better post something about it.
>>
>> And yes, I started us off in the wrong direction with the
>> IS_ASYNCH thing! haha
>>
>> thanks,
>
> Hi John,
>
> I totally agree and was hoping that someone would have a good suggestion
> for this. I discussed this exact thing with Alex before posting this
> too. So if you have any naming suggestions would love to hear them.
>
> As you say, sync and async are orthogonal to reply vs no reply. I think
> we have several ideas here actually:
> - blocking vs non-blocking
> - reply vs no-reply
> - wait for reply vs don't wait for reply (practically equivalent to
>   blocking vs non-blocking here, but conceptually the send could also be
>   blocking vs non-blocking)
>
> We should also be careful with conflating waiting for the reply vs not
> having a reply. So `send_without_waiting_for_reply` is definitely
> confusing to me, because there may be a reply that we just don't wait
> for.
>
> Some ideas:
> - send_command_with_reply + send_command_without_reply
>   - Maybe non-obvious that this blocks for send_command_with_reply.
> - send_and_wait_for_reply + send_no_reply
>   - More obvious that it blocks and gets the reply.
>   - Should be obvious from context that you are sending a command
>     anyway.
>
> Personally I think it's nice to keep a convention of keeping it
> mostly obvious which functions block/wait. (e.g. we already have
> wait_for_msg in cmdq.rs).
>
> For lack of a better idea  i suggest send_and_wait_for_reply +
> send_no_reply for now.

One important detail IMHO is that the API cannot be misused, i.e. you
cannot call the fire-and-forget send method on a command that expects a
reply. So the risk is mostly when adding support for a new command - but
if that step is done properly, users will be directed to the right
method by the compiler.

This, I think, allows us to tolerate more ambiguity in the method names,
as long as their documentation makes up for it. We all agree that
`async` and `sync` are not a good fit, but `send`/`send_noreply` should
be tolerable (I'd like to keep the names short if possible)

Or maybe we can use a variant of the trick mentioned by Gary in [1] and
have a single `send_command` method?

[1] https://lore.kernel.org/all/DGRJJA3068FV.3CE7J7SKLTN8O@garyguo.net/
