Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOuyOQwenWm/MwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 04:42:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D026181738
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 04:42:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7F4010E498;
	Tue, 24 Feb 2026 03:42:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CnjH3vW2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CBBE10E498
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 03:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1771904519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZfGi+rTpkYSFnpVCfQmyET1TglGZ7PTVeu2IkOlJh3U=;
 b=CnjH3vW22+jTwbUKp0wPUpnYX1btpmKXE6IZPgTA0E0RurOICeqMSMWEBo7PZwZ4HvMbu9
 NVPPD5GIrqUG6t978MTNWB7GM3424XmGxZxJTGkSzF9AzyDDYM+nKGYKuFwnwSZ5RqEgH8
 5ci39sWPLjQugVuinHy3CFX8v8/yviA=
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-597-SogF9me6P3-Oj_EpGLo0JA-1; Mon, 23 Feb 2026 22:41:57 -0500
X-MC-Unique: SogF9me6P3-Oj_EpGLo0JA-1
X-Mimecast-MFC-AGG-ID: SogF9me6P3-Oj_EpGLo0JA_1771904517
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-2ba7e98178fso4554532eec.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 19:41:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771904516; x=1772509316;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZfGi+rTpkYSFnpVCfQmyET1TglGZ7PTVeu2IkOlJh3U=;
 b=r7Y05h+4thPX8vNGxBW7Bz7wZ3iM47AyJM/SrXOnohxFAdYRVxt6xyxzSTL1prB9Jt
 zWOAA4byT8OmTHM1/fsIT6x7wQRrWesgihiyUCGnTHG19g3kvEd/xaattqRqYvPVYOke
 G3Rx5AskI+Dv1qZlLg+siwFf/Q4G8zxZB/85tm8e2x/vS5eF6T116G9yLN+h5lZ1zCPM
 zFFKPNVdfhH7YPS8auWsiNdTqq0JEFyfZEXDcjeLkrkTKxBMiR7d476S0+V7XKGNNVao
 8lmk1CjH7IEW5HuOmYb0evKUiLTAE/mskP0DZv/VzeX41oBbjOzdjp2Md3k1yMiOEYfj
 wOtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeqpuej30PNdhP1Y6/xbZ1FHKLVNMqz8rCRSrtfRE8TNZI1NBhRKkCIRHPMPkjQIK0uFdNQqzBnoM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmhKYI15r51EXtouigdnNwhZbShENi2bEPafsuqjdMR5kybHVO
 mXZBkBZOlJGBBOkLlEcyeqCKPtqz7gfxwAhuRfMEwJB8fiXdZcR6Q3DCO9zRc0ammEaKc2SGIlX
 pFkF42UWUjx4oIUhGeOehPSk/aaTL4jDsHax2UNmH7QfmTwP2zLDcGaQvmj0OsaPF31Fr3nQYTX
 tGv3XV4UJmHr3RdG0RKVv3/bWPFlFUUKhhY11aCxDC1z+0
X-Gm-Gg: AZuq6aK6qE1L1UoDCNIMbaBNLGQbn90BRppM0glwVqp4B2BunQUcsfzJ8o4BEowWdUb
 TN2hvsEIaDiZ74y35iwi5JhiI3HZX7Cug1It9jRCeGaUjpPFQQpCj0gC3Nc2F8NRQNZiAz8QrMk
 0cIvhnz5BadfrxZfL3Luo9i0qqdtJRrkjoCJiZUY5YpbNBXXF4HeVSWTKqlfgeB0ckp7JOyf3MQ
 5+DdK3Qd5ncZMowKeOL51yFkBlM/N2cuqMS
X-Received: by 2002:a05:7022:6986:b0:11b:923d:773f with SMTP id
 a92af1059eb24-1276acb7fe9mr4491849c88.5.1771904516622; 
 Mon, 23 Feb 2026 19:41:56 -0800 (PST)
X-Received: by 2002:a05:7022:6986:b0:11b:923d:773f with SMTP id
 a92af1059eb24-1276acb7fe9mr4491833c88.5.1771904516247; Mon, 23 Feb 2026
 19:41:56 -0800 (PST)
MIME-Version: 1.0
References: <DGJPMOESHINC.1NGNT8LLY8DKW@kernel.org>
 <1771594440.99434@nvidia.com>
 <2026022156-citizen-shredding-5d6d@gregkh>
 <cdc31857-c9a0-4d05-a243-780dc9819cb7@nvidia.com>
 <b45a50ce-de96-42ee-90c1-0a6cd7a78cc0@linux.intel.com>
 <DGMAUQLZGPZB.FWELZM9GYP0Z@kernel.org>
 <DGMP4FBY8958.1KNWJH7IW7M3I@kernel.org>
In-Reply-To: <DGMP4FBY8958.1KNWJH7IW7M3I@kernel.org>
From: David Airlie <airlied@redhat.com>
Date: Tue, 24 Feb 2026 13:41:45 +1000
X-Gm-Features: AaiRm50BDo_t3xPlwTJEEpGzOePwAdIFv9N6YtS43JfkuKqEUHkSqaC-olJg6xU
Message-ID: <CAMwc25q4hXq-ztUHRnMaiWV4aqZeNypU0c_9hatsU_Pyov1G2Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] gpu/buddy: fix module_init() usage
To: Danilo Krummrich <dakr@kernel.org>
Cc: Koen Koning <koen.koning@linux.intel.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, 
 Greg KH <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>, 
 Peter Senna Tschudin <peter.senna@linux.intel.com>, stable@vger.kernel.org, 
 dri-devel <dri-devel-bounces@lists.freedesktop.org>, 
 Arun Pravin <arunpravin.paneerselvam@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: plP7OKHFf1_zthDjUU7aIoQJ9_t2sA96baB9LEReEBc_1771904517
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:koen.koning@linux.intel.com,m:joelagnelf@nvidia.com,m:gregkh@linuxfoundation.org,m:intel-xe@lists.freedesktop.org,m:matthew.auld@intel.com,m:peter.senna@linux.intel.com,m:stable@vger.kernel.org,m:dri-devel-bounces@lists.freedesktop.org,m:arunpravin.paneerselvam@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[airlied@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[airlied@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 5D026181738
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 8:31=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> (Cc: Arun)
>
> On Mon Feb 23, 2026 at 12:20 PM CET, Danilo Krummrich wrote:
> > On Mon Feb 23, 2026 at 12:17 PM CET, Koen Koning wrote:
> >> Thanks that makes sense, then let's just stick to addressing the curre=
nt
> >> regression with gpu/buddy in the drm-tip tree.
> >
> > The patch should go into drm-misc-next.
> >
> >> Joel, could you grab the v1 of this patchset (or the v2 with with
> >> subsys_initcall, either works) and try to get it applied to drm-tip?
> >> Since this is my first time submitting patches, I'm not really sure ho=
w
> >> to proceed from here, and it will probably be faster if you have a loo=
k.
> >
> > I think we should land your original v1; I don't know if Joel can push =
to
> > drm-misc-next, if not please let me know, I can pick it up then.
>
> Actually, since GPU buddy has a separate maintainers entry, I will leave =
it to
> Matthew and Arun.
>
> (Cc'd you both on v1.)

Since I pushed the original damage, I've pushed this fix.

Dave.

