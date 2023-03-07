Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C82B6AE269
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 15:28:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE0CE10E4C1;
	Tue,  7 Mar 2023 14:28:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 787DE10E4C1
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 14:28:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: linasend@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 108E3426E8;
 Tue,  7 Mar 2023 14:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1678199328;
 bh=K1giKwscy2LOuMZ2AqcEY9ztp05XIoWRr3vQhLNQ3Zg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=C8Q+7fYXmoCQcs6Av2OYMPTMZIyuSzXfTLkRhGh0NT0PjTClFUXRliaBU7pDr54pc
 CCRT3Ih84MQr+URhQR/da7Vkr9ohffUpQSUH8C0hElH04mbmcbhXz0otXJgZ0ASq9o
 brXr4tr0KGx6AtvwOvV+POQhw0i2gEXsCjAA/XoJ3omx5A4mBGFlkW5saWhQv6gXQV
 OfnYzJWZNqgvnXU/NPf0IOW787Qql2IlX9qU5XarYRbGgX6EDohlAfZ82itsIDS8MC
 UhRyv2YUrx4OoUxhS6v+tskkGEbPNFm1p6NBDmkfVOXFuJ+PuUK09FwYmrGqF/OgN+
 dCEpNS3Zn/XGQ==
From: Asahi Lina <lina@asahilina.net>
Date: Tue, 07 Mar 2023 23:25:42 +0900
Subject: [PATCH RFC 17/18] rust: macros: Add versions macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230307-rust-drm-v1-17-917ff5bc80a8@asahilina.net>
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
In-Reply-To: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Wedson Almeida Filho <wedsonaf@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Luben Tuikov <luben.tuikov@amd.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
 Dave Hansen <dave.hansen@linux.intel.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678199192; l=11529;
 i=lina@asahilina.net; s=20230221; h=from:subject:message-id;
 bh=K1giKwscy2LOuMZ2AqcEY9ztp05XIoWRr3vQhLNQ3Zg=;
 b=yTmTdTgnDEPP5bvMtuxBQS8eHVdb5iATCaf0YsmsBIxfZyfyeyRxQS1UEyj404IIncEWIlNcL
 /1Q1SDH60DgB9Omehl/rG5FxK3HalovAA8A3Q7ZfE+MaYw72aFfcD01
X-Developer-Key: i=lina@asahilina.net; a=ed25519;
 pk=Qn8jZuOtR1m5GaiDfTrAoQ4NE1XoYVZ/wmt5YtXWFC4=
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
Cc: linaro-mm-sig@lists.linaro.org, rust-for-linux@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>, asahi@lists.linux.dev,
 Asahi Lina <lina@asahilina.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mary <mary@mary.zone>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-sgx@vger.kernel.org,
 Ella Stanforth <ella@iglunix.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This macro allows Rust code to build multiple versions of the same code,
conditionally including certain fields or code segments.

The asahi driver uses this to support multiple GPU types and firmware
revisions in the same codebase, without duplicating everything.

Signed-off-by: Asahi Lina <lina@asahilina.net>
---
 rust/macros/lib.rs      |   7 ++
 rust/macros/versions.rs | 267 ++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 274 insertions(+)

diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index c1d385e345b9..3ab9bae4ab52 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -5,6 +5,7 @@
 mod concat_idents;
 mod helpers;
 mod module;
+mod versions;
 mod vtable;
 
 use proc_macro::TokenStream;
@@ -73,6 +74,12 @@ pub fn module(ts: TokenStream) -> TokenStream {
     module::module(ts)
 }
 
+/// Declares multiple variants of a structure or impl code
+#[proc_macro_attribute]
+pub fn versions(attr: TokenStream, item: TokenStream) -> TokenStream {
+    versions::versions(attr, item)
+}
+
 /// Declares or implements a vtable trait.
 ///
 /// Linux's use of pure vtables is very close to Rust traits, but they differ
diff --git a/rust/macros/versions.rs b/rust/macros/versions.rs
new file mode 100644
index 000000000000..3bcd5f557289
--- /dev/null
+++ b/rust/macros/versions.rs
@@ -0,0 +1,267 @@
+use proc_macro::{token_stream, Group, Ident, Punct, Spacing, Span, TokenStream, TokenTree};
+
+use crate::helpers::{expect_group, expect_punct};
+
+fn drop_until_punct(it: &mut impl Iterator<Item = TokenTree>, delimiter: &str) {
+    let mut depth: isize = 0;
+    for token in it.by_ref() {
+        if let TokenTree::Punct(punct) = token {
+            match punct.as_char() {
+                '<' => {
+                    depth += 1;
+                }
+                '>' => {
+                    depth -= 1;
+                }
+                _ => {
+                    if depth == 0 && delimiter.contains(&punct.to_string()) {
+                        break;
+                    }
+                }
+            }
+        }
+    }
+}
+
+struct VersionConfig {
+    fields: &'static [&'static str],
+    enums: &'static [&'static [&'static str]],
+    versions: &'static [&'static [&'static str]],
+}
+
+static AGX_VERSIONS: VersionConfig = VersionConfig {
+    fields: &["G", "V"],
+    enums: &[&["G13", "G14"], &["V12_3", "V12_4", "V13_0B4", "V13_2"]],
+    versions: &[
+        &["G13", "V12_3"],
+        &["G14", "V12_4"],
+        &["G13", "V13_2"],
+        &["G14", "V13_2"],
+    ],
+};
+
+fn check_version(config: &VersionConfig, ver: &[usize], it: &mut token_stream::IntoIter) -> bool {
+    let first = it.next().unwrap();
+    let val: bool = match &first {
+        TokenTree::Group(group) => check_version(config, ver, &mut group.stream().into_iter()),
+        TokenTree::Ident(ident) => {
+            let key = config
+                .fields
+                .iter()
+                .position(|&r| r == ident.to_string())
+                .unwrap_or_else(|| panic!("Unknown field {}", ident));
+            let mut operator = expect_punct(it).to_string();
+            let mut rhs_token = it.next().unwrap();
+            if let TokenTree::Punct(punct) = &rhs_token {
+                operator.extend(std::iter::once(punct.as_char()));
+                rhs_token = it.next().unwrap();
+            }
+            let rhs_name = if let TokenTree::Ident(ident) = &rhs_token {
+                ident.to_string()
+            } else {
+                panic!("Unexpected token {}", ident)
+            };
+
+            let rhs = config.enums[key]
+                .iter()
+                .position(|&r| r == rhs_name)
+                .unwrap_or_else(|| panic!("Unknown value for {}:{}", ident, rhs_name));
+            let lhs = ver[key];
+
+            match operator.as_str() {
+                "==" => lhs == rhs,
+                "!=" => lhs != rhs,
+                ">" => lhs > rhs,
+                ">=" => lhs >= rhs,
+                "<" => lhs < rhs,
+                "<=" => lhs <= rhs,
+                _ => panic!("Unknown operator {}", operator),
+            }
+        }
+        _ => {
+            panic!("Unknown token {}", first)
+        }
+    };
+
+    let boolop = it.next();
+    match boolop {
+        Some(TokenTree::Punct(punct)) => {
+            let right = expect_punct(it).to_string();
+            if right != punct.to_string() {
+                panic!("Unexpected op {}{}", punct, right);
+            }
+            match punct.as_char() {
+                '&' => val && check_version(config, ver, it),
+                '|' => val || check_version(config, ver, it),
+                _ => panic!("Unexpected op {}{}", right, right),
+            }
+        }
+        Some(a) => panic!("Unexpected op {}", a),
+        None => val,
+    }
+}
+
+fn filter_versions(
+    config: &VersionConfig,
+    tag: &str,
+    ver: &[usize],
+    mut it: &mut token_stream::IntoIter,
+    is_struct: bool,
+) -> Vec<TokenTree> {
+    let mut out = Vec::<TokenTree>::new();
+
+    while let Some(token) = it.next() {
+        let mut tail: Option<TokenTree> = None;
+        match &token {
+            TokenTree::Punct(punct) if punct.to_string() == "#" => {
+                let group = expect_group(it);
+                let mut grp_it = group.stream().into_iter();
+                let attr = grp_it.next().unwrap();
+                match attr {
+                    TokenTree::Ident(ident) if ident.to_string() == "ver" => {
+                        if check_version(config, ver, &mut grp_it) {
+                        } else if is_struct {
+                            drop_until_punct(&mut it, ",");
+                        } else {
+                            let first = it.next().unwrap();
+                            match &first {
+                                TokenTree::Group(_) => (),
+                                _ => {
+                                    drop_until_punct(&mut it, ",;");
+                                }
+                            }
+                        }
+                    }
+                    _ => {
+                        out.push(token.clone());
+                        out.push(TokenTree::Group(group.clone()));
+                    }
+                }
+                continue;
+            }
+            TokenTree::Punct(punct) if punct.to_string() == ":" => {
+                let next = it.next();
+                match next {
+                    Some(TokenTree::Punct(punct)) if punct.to_string() == ":" => {
+                        let next = it.next();
+                        match next {
+                            Some(TokenTree::Ident(idtag)) if idtag.to_string() == "ver" => {
+                                let ident = match out.pop() {
+                                    Some(TokenTree::Ident(ident)) => ident,
+                                    a => panic!("$ver not following ident: {:?}", a),
+                                };
+                                let name = ident.to_string() + tag;
+                                let new_ident = Ident::new(name.as_str(), ident.span());
+                                out.push(TokenTree::Ident(new_ident));
+                                continue;
+                            }
+                            Some(a) => {
+                                out.push(token.clone());
+                                out.push(token.clone());
+                                tail = Some(a);
+                            }
+                            None => {
+                                out.push(token.clone());
+                                out.push(token.clone());
+                            }
+                        }
+                    }
+                    Some(a) => {
+                        out.push(token.clone());
+                        tail = Some(a);
+                    }
+                    None => {
+                        out.push(token.clone());
+                        continue;
+                    }
+                }
+            }
+            _ => {
+                tail = Some(token);
+            }
+        }
+        match &tail {
+            Some(TokenTree::Group(group)) => {
+                let new_body =
+                    filter_versions(config, tag, ver, &mut group.stream().into_iter(), is_struct);
+                let mut stream = TokenStream::new();
+                stream.extend(new_body);
+                let mut filtered_group = Group::new(group.delimiter(), stream);
+                filtered_group.set_span(group.span());
+                out.push(TokenTree::Group(filtered_group));
+            }
+            Some(token) => {
+                out.push(token.clone());
+            }
+            None => {}
+        }
+    }
+
+    out
+}
+
+pub(crate) fn versions(attr: TokenStream, item: TokenStream) -> TokenStream {
+    let config = match attr.to_string().as_str() {
+        "AGX" => &AGX_VERSIONS,
+        _ => panic!("Unknown version group {}", attr),
+    };
+
+    let mut it = item.into_iter();
+    let mut out = TokenStream::new();
+    let mut body: Vec<TokenTree> = Vec::new();
+    let mut is_struct = false;
+
+    while let Some(token) = it.next() {
+        match token {
+            TokenTree::Punct(punct) if punct.to_string() == "#" => {
+                body.push(TokenTree::Punct(punct));
+                body.push(it.next().unwrap());
+            }
+            TokenTree::Ident(ident)
+                if ["struct", "enum", "union", "const", "type"]
+                    .contains(&ident.to_string().as_str()) =>
+            {
+                is_struct = ident.to_string() != "const";
+                body.push(TokenTree::Ident(ident));
+                body.push(it.next().unwrap());
+                // This isn't valid syntax in a struct definition, so add it for the user
+                body.push(TokenTree::Punct(Punct::new(':', Spacing::Joint)));
+                body.push(TokenTree::Punct(Punct::new(':', Spacing::Alone)));
+                body.push(TokenTree::Ident(Ident::new("ver", Span::call_site())));
+                break;
+            }
+            TokenTree::Ident(ident) if ident.to_string() == "impl" => {
+                body.push(TokenTree::Ident(ident));
+                break;
+            }
+            TokenTree::Ident(ident) if ident.to_string() == "fn" => {
+                body.push(TokenTree::Ident(ident));
+                break;
+            }
+            _ => {
+                body.push(token);
+            }
+        }
+    }
+
+    body.extend(it);
+
+    for ver in config.versions {
+        let tag = ver.join("");
+        let mut ver_num = Vec::<usize>::new();
+        for (i, comp) in ver.iter().enumerate() {
+            let idx = config.enums[i].iter().position(|&r| r == *comp).unwrap();
+            ver_num.push(idx);
+        }
+        let tt = TokenStream::from_iter(body.clone().into_iter());
+        out.extend(filter_versions(
+            config,
+            &tag,
+            &ver_num,
+            &mut tt.into_iter(),
+            is_struct,
+        ));
+    }
+
+    out
+}

-- 
2.35.1

